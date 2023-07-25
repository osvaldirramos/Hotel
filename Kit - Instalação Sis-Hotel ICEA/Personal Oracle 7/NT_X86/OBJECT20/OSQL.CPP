/* Copyright (c) Oracle Corporation 1994.  All Rights Reserved */

/*
    This source code is provided as a debugging aid for developers
    who have purchased Oracle Objects for OLE    .  Please see the
    online help for documentation of these classes.
*/

/*
    Oracle Objects for OLE     C++ Classes
    
	 This file implements the OSqlStmt Class
                           
	 CREATED    RWOOLARD   11/09/95
*/

#ifndef ORACL_ORACLE
#include "oracl.h"
#endif

#ifndef ORAOBJI_ORACLE
#include "oraobji.h"
#endif

#ifndef _OracleInProcServer_H_
#include <oratlb.h>
#endif

static const IID IID_IOraSqlStmt =
{0xCCD73D20, 0xEAB0, 0x101C, { 0x95, 0xC6, 0xC6, 0xA5, 0x55, 0xD0, 0x41, 0x1F } };

// ----- OSqlStmt -----------------------------------------------

OSqlStmt::OSqlStmt(void)
{
    m_sqlstmt = 0;  // no sql statement yet
}

OSqlStmt::OSqlStmt(const OSqlStmt &other)
{
    m_sqlstmt = 0;  // no sql statement yet
    Copy(other);
}

OSqlStmt::OSqlStmt(const ODatabase &odb, const char *sqlst, long options)
{
    m_sqlstmt = 0;  // no sql statement yet
    Open(odb, sqlst, options);
}

OSqlStmt::~OSqlStmt(void) 
{
    Cleanup();
}

oresult OSqlStmt::Close(void)
{
    return(Cleanup());
}

oresult OSqlStmt::Open(const ODatabase &odb, const char *sqlst, long options)
{
    if (!odb.IsOpen())
    { // unopened database
        SetInternalError(OERROR_INVPARENT);
        return(OFAILURE);
    }
    if (!sqlst)
    {
        SetInternalError(OERROR_BADARG);
        return(OFAILURE);
    }
    
    odb.ErrorReset();
	IDispatch *dyni = ((_IOraDatabase *) (odb.Internal()))->get_CreateSql((char *) sqlst, options);
	
	return(OpenHelper(dyni, odb.Internal()));
}


oresult OSqlStmt::OpenHelper(void *id, void *otheri)
{
	if (!id) 
    { // couldn't create dynaset - error is on other object
        SetOtherError(otheri);
        return(OFAILURE);
    }
	
    Cleanup();
        
	IDispatch *idisp = (IDispatch *) id;
	
	void *tempi;	
	HRESULT hc = idisp->QueryInterface(IID_IOraSqlStmt, &tempi);
	idisp->Release();
	if (FAILED(hc))
    { // couldn't get the interface
        SetInternalError(OERROR_NOINTER);
        return(OFAILURE);
    }
    
	return(SetObjectInterface(tempi));
}

OSession OSqlStmt::GetSession(void) const
{
    OSession sess;
    
    if (ActionGetStart(&sess) != OSUCCESS)
        return(sess); // returning unopened object - indicates error
    
	IDispatch *connect = ((_IOraSqlStmt *) (Internal()))->get_Session();
	
	sess.OpenHelper((void *) connect, Internal());
	
	return(sess);
}

ODatabase OSqlStmt::GetDatabase(void) const
{
    ODatabase odb;
    
    if (ActionGetStart(&odb) != OSUCCESS)
        return(odb); // returning unopened object - indicates error
    
    IDispatch *db = ((_IOraSqlStmt *) (Internal()))->get_Database();
    
    odb.OpenHelper((void *) db, Internal());
    
    return(odb);
}

OConnection OSqlStmt::GetConnection(void) const
{
    OConnection conn;
    
    if (ActionGetStart(&conn) != OSUCCESS)
        return(conn); // returning unopened object - indicates error
    
	IDispatch *connect = ((_IOraSqlStmt  *) (Internal()))->get_Connection();
	
	conn.OpenHelper((void *) connect, Internal());
	
	return(conn);
}


// overloaded assignment operator
OSqlStmt &OSqlStmt::operator=(const OSqlStmt &other)
{
	 if (&other == this)
		  return(*this); // self assignment - do nothing

	 // clear out our old state
	 if (OSUCCESS == Cleanup())
	 {
        Copy(other); // call copy constructor
    }
    // if the cleanup failed (possible but unlikely) we don't do the copy
    //    and as a result, we pass on the unmodified (or partly cleaned!) object
    
    return(*this);
} 

oresult OSqlStmt::Copy(const OSqlStmt &other)
{
    // don't copy the sql statement
    m_sqlstmt = 0;
    
    return(OOracleObject::Copy(other));
}

oresult OSqlStmt::Cleanup(void)
{
    if (m_sqlstmt)
    {
        OObjectFreeString(m_sqlstmt);
        m_sqlstmt = 0;
    }
    
    return(OOracleObject::Cleanup());
}   

oresult OSqlStmt::Refresh(void)
{
    if (ActionStart() != OSUCCESS)
        return(OFAILURE);
    
    ((_IOraSqlStmt  *) Internal())->Refresh();  // fires refresh advisory
    if (ErrorNumber() == OERROR_NONE)
    {
        return(OSUCCESS);
    }
    else
        return(OFAILURE);    
}
    
oresult OSqlStmt::SetSQL(const char *sql_statement)
{
    if (ActionStart() != OSUCCESS)
        return(OFAILURE);
    if (!sql_statement)
    {
        SetInternalError(OERROR_BADARG);
        return(OFAILURE);
    }
    
    // this will invalidate our current sql statement
    if (m_sqlstmt)
    {
        OObjectFreeString(m_sqlstmt);
        m_sqlstmt = 0;
    }
    
    // we need to hand in a real BSTR
    BSTR tempcp = OObjectAllocString(sql_statement); 
    if (!tempcp)
    {
        SetInternalError(OERROR_MEMORY);
        return(OFAILURE);
    }
    ((_IOraSqlStmt *) Internal())->put_SQL(tempcp);
    
    if (ErrorNumber() == OERROR_NONE)
    { // success, might as well remember the sql statment
        m_sqlstmt = tempcp;  // now we don't need to free tempcp
        return(OSUCCESS);
    }
    else
    {
        OObjectFreeString(tempcp);
        return(OFAILURE);
    }    
}
    
const char *OSqlStmt::GetSQL(void) const
{
    if (ActionStart() != OSUCCESS)
        return(NULL);
    
    // we always refetch the SQL statement, just in case
    //   a copy of this OSqlStmt changed the underlying OSqlStmt's
    //   SQL statement
    
    // we need a non-const version of "this" to change m_sqlstmt
    OSqlStmt *this2p = (OSqlStmt *) this;
    
    if (m_sqlstmt)
    {
        OObjectFreeString(m_sqlstmt);
        this2p->m_sqlstmt = 0;
    }
    
    this2p->m_sqlstmt = ((_IOraSqlStmt  *) Internal())->get_SQL();
    
    return(m_sqlstmt);
}


oboolean OSqlStmt::CanTransact(void) const
{
	 if (ActionStart() != OSUCCESS)
		  return(FALSE);

    return TRUE;
	 
}

oboolean OSqlStmt::CanRefresh(void) const
{
    // can always refresh if we're open
    return (IsOpen());
}

long OSqlStmt::GetOptions(void) const
{
	 if (ActionStart() != OSUCCESS)
		  return(ODYNASET_DEFAULT);

	 return(((_IOraSqlStmt *) Internal())->get_Options());
}

long OSqlStmt::GetRecordCount(void) const
{
	 if (ActionStart() != OSUCCESS)
		  return(0);
    
	 return(((_IOraSqlStmt *) Internal())->get_RecordCount());
}    

