/* Copyright (c) Oracle Corporation 1994.  All Rights Reserved */

/*
    This source code is provided as a debugging aid for developers
    who have purchased Oracle Objects for OLE    .  Please see the
    online help for documentation of these classes.
*/

/*
    Oracle Objects for OLE     C++ Classes
    
    This file implements the ODatabase class
                           
    CREATED    ********   11/22/94

*/

#ifndef ORACL_ORACLE
#include "oracl.h"
#endif

#ifndef _OracleInProcServer_H_
#include <oratlb.h>
#endif

#ifndef ORAOBJI_ORACLE
#include "oraobji.h"
#endif

static const IID IID_IOraDatabase =
{0x5cdfcf20, 0xffd7, 0x101a, { 0xad, 0xf2, 0x04, 0x02, 0x1c, 0x00, 0x70, 0x02 } };

// ----- ODatabase -----------------------------------------------

ODatabase::ODatabase(void)
{
    m_dbname = 0;
    m_dbconnect = 0;
	 m_errtext = 0;
	 m_version = 0;
	 m_numrows = -1;
}

ODatabase::~ODatabase(void)
{
	 Cleanup();
}

ODatabase::ODatabase(const ODatabase &other)
{
	 m_dbname = 0;
	 m_dbconnect = 0;
	 m_errtext = 0;
	 m_version = 0;
	 m_numrows = -1;
	 Copy(other);  // call our internal copier
}

ODatabase::ODatabase(const OSession &dbsess, const char *dbname, const char *username, const char *pwd, long options)
{
	 m_dbname = 0;
	 m_dbconnect = 0;
	 m_errtext = 0;
	 m_version = 0;
	 m_numrows = -1;
	 Open(dbsess, dbname, username, pwd, options);
}

ODatabase::ODatabase(const char *dbname, const char *username, const char *pwd, long options)
{
	 m_dbname = 0;
	 m_dbconnect = 0;
	 m_errtext = 0;
	 m_version = 0;
	 m_numrows = -1;
	 Open(dbname, username, pwd, options);
}

oresult ODatabase::Close(void)
{
	 return(Cleanup());
}

oresult ODatabase::Cleanup(void)
{
	 if (m_dbname)
    {
        OObjectFreeString(m_dbname);
        m_dbname = 0;
    }
    if (m_dbconnect)
    {
        OObjectFreeString(m_dbconnect);
        m_dbconnect = 0;
    }
	 if (m_errtext)
	 {
		  OObjectFreeString(m_errtext);
		  m_errtext = 0;
	 }
	 if (m_version)
	 {
		  OObjectFreeString(m_version);
		  m_version = 0;
	 }
	 m_numrows = -1;
    
    return(OOracleObject::Cleanup());
}

oresult ODatabase::Open(const char *dbname, const char *username, const char *pwd, long options)
{
	 // open a session for this database connection
	 OSession tempSess;
	 oresult ores;

	 ores = tempSess.Open();
	 if (ores == OSUCCESS)
		  ores = Open(tempSess, dbname, username, pwd, options);
	 else
	 { // couldn't open the temporary session.  Some OLE problem
		  SetInternalError(OERROR_SYSTEM);
	 }

	 /*
		  Note that although the OSession session variable will go away, the OLE session object
		  (in the oip) will not, because the database has a reference to it.  The OLE 	 object
		  will go away when the database does.
	 */

	 return(ores);
}

oresult ODatabase::Open(const OSession &dbsess, const char *dbname, const char *username, const char *pwd, long options)
{
	char	*tp;

	if (!dbsess.IsOpen())
	{ // no valid session
	    SetInternalError(OERROR_INVPARENT); 
		return(OFAILURE);
	}
	if (!dbname || !username)
	{
		 SetInternalError(OERROR_BADARG);
	    return(OFAILURE);
	}

	 // get the username and password into the right form
	 if (GetUserPwd (username, pwd, &tp) == OFAILURE)
		   return OFAILURE;

	 // get database name into BSTR
	 BSTR tempdbname = OObjectAllocString(dbname);

	 if (!tp || !tempdbname)
	 {
		  SetInternalError(OERROR_MEMORY);
		  if (tp)
				OObjectFreeString(tp);
		  if (tempdbname)
				OObjectFreeString(tempdbname);
		  return(OFAILURE);
	 }

	 // now do the real work
	 dbsess.ErrorReset(); // reset error state of session

	IDispatch *dbi = ((_IOraSession *)(dbsess.Internal()))->get_OpenDatabase(tempdbname, tp, options);
	// free the BSTRs
	OObjectFreeString(tp);
	OObjectFreeString(tempdbname);

	return(OpenHelper(dbi, dbsess.Internal()));
}


oresult ODatabase::GetUserPwd(const char *username, const char *pwd, char **retname)
{
	 // get the username and password into the right form
	 // DBCS problem - assumption of single-byte null
	 BSTR tp;
	 // password and username can't be more than 30 bytes apiece so...
    const char *cp, *cp2;

	 cp = username;
	 *retname = NULL;
	 while (*cp)
		  cp++; // scan to end of username
	 if (pwd)
	 {
		  cp2 = pwd;
		  while (*cp2)
				cp2++;
	 }
    //if (strlen(username) > 30 || (pwd && strlen(pwd) > 30))
	 if ((cp-username) > 30 || (pwd && (cp2-pwd)) > 30)
	 {
        SetInternalError(OERROR_BADARG);
		  return(OFAILURE);
    }

    char temps[80];
	 if (pwd)
    { // the username and password are separate
		  // don't use strcpy, etc so that we don't drag in C runtime
        tp = temps;
		  cp = username;
        while (*cp)
				*tp++ = *cp++;
        *tp++ = '/';
		  cp = pwd;
		  while (*cp)
				*tp++ = *cp++;
		  *tp = '\0';  // null terminate;
		  tp = OObjectAllocString(temps);
	 }
	 else
	 {
		  // the username must contain a '/'
		  cp = username;
		  while (*cp)
		  {
				if (*cp == '/')
					 break;
				cp++;
		  }
		  if (*cp != '/')
		  { // no slash
				SetInternalError(OERROR_BADARG);
				return(OFAILURE);
		  }
		  tp = OObjectAllocString(username); // contains username/password
	 }
	 *retname = tp;

    return OSUCCESS;
}

oresult ODatabase::OpenHelper(void *idisp, void *otheri)
{
	if (!idisp)
	{ // couldn't create database
	    // the actual error is stored in the session object
	    SetOtherError(otheri);
	    return(OFAILURE);
	}
	
	Cleanup(); // drop old state
	
	// get database interface
	void *tempi;
	IDispatch *dbi = (IDispatch *) idisp;
	HRESULT hc = dbi->QueryInterface(IID_IOraDatabase, &tempi);
	dbi->Release();
	
	if (FAILED(hc))
	{
	    SetInternalError(OERROR_NOINTER);
		return(OFAILURE);
	}
    
    return(SetObjectInterface(tempi));  // this sets error state
}

// overloaded assignment operator
ODatabase &ODatabase::operator=(const ODatabase &other)
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

oresult ODatabase::ExecuteSQL(const char *sqls) const
{   
	long	numrows;
	
    if (ActionStart() != OSUCCESS)
        return(OFAILURE);
    
    if (!sqls)
    {
        SetInternalError(OERROR_BADARG);
        return(OFAILURE);
    }
    
    BSTR tempsql = OObjectAllocString(sqls);
    numrows = (((_IOraDatabase *) Internal())->ExecuteSQL((BSTR) sqls));
    // un-const this
    ODatabase *dbp = (ODatabase *) this;
    dbp->m_numrows = numrows;
    OObjectFreeString(tempsql);
    
    return((0 == ErrorNumber()) ? OSUCCESS : OFAILURE);
}

long ODatabase::GetRowsProcessed(void) const
{
	return m_numrows;
}

long ODatabase::GetOptions(void) const
{
    if (ActionStart() != OSUCCESS)
        return(ODATABASE_DEFAULT);
    
    return(((_IOraDatabase *) Internal())->get_Options());
}

oresult ODatabase::Copy(const ODatabase &other)
{
    // don't bother to copy strings
    m_dbname = 0;
    m_dbconnect = 0;
    return(OOracleObject::Copy(other));
}

const char *ODatabase::GetName(void) const
{
    if (ActionStart() != OSUCCESS)
        return(NULL);
    
    if (!m_dbname)
    {
        char *cp = ((_IOraDatabase *) Internal())->get_DatabaseName();
        /*
            we want to change the state of this const database by changing
            the value of m_dbname.  Note that we're not really changing the
            database, we're only changing what we know about the database
        */
        ODatabase *dbp = (ODatabase *) this;  // un-const this
        dbp->m_dbname = cp;
    }
    
    return(m_dbname);                                                             
}

const char *ODatabase::GetConnectString(void) const
{
    if (ActionStart() != OSUCCESS)
        return(NULL);
    
    if (!m_dbconnect)
    {
        char *cp = ((_IOraDatabase *) Internal())->get_Connect();
        /*
            we want to change the state of this const database by changing
            the value of m_dbname.  Note that we're not really changing the
            database, we're only changing what we know about the database
        */
        ODatabase *dbp = (ODatabase *) this;  // un-const this
        dbp->m_dbconnect = cp;
    }
    
    return(m_dbconnect);                                                             
}    

OSession ODatabase::GetSession(void) const
{
    OSession dbsess;

    if (ActionGetStart(&dbsess) != OSUCCESS)
        return(dbsess); // returning unopened object - indicates error
    
	IDispatch *connect = ((_IOraDatabase *) (Internal()))->get_Session();
	dbsess.OpenHelper((void *) connect, Internal());
	
	return(dbsess);
}

OConnection ODatabase::GetConnection(void) const
{
    OConnection dbconn;
    
    if (ActionGetStart(&dbconn) != OSUCCESS)
        return(dbconn); // returning unopened object - indicates error
    
	IDispatch *connect = ((_IOraDatabase *) (Internal()))->get_Connection();
	
	dbconn.OpenHelper((void *) connect, Internal());
	return(dbconn);
}

OParameterCollection ODatabase::GetParameters(void) const
{
    OParameterCollection pcoll;
    
    if (ActionGetStart(&pcoll) != OSUCCESS)
        return(pcoll); // returning unopened object - indicates error
    
	IDispatch *connect = ((_IOraDatabase *) (Internal()))->get_Parameters();
	
	pcoll.OpenHelper((void *) connect, Internal());
	return(pcoll);
}

long ODatabase::ServerErrorNumber(void) const
{
    if (ActionStart() != OSUCCESS)
        return(0);
    
    long errnum = ((_IOraDatabase *) Internal())->get_LastServerErr();
    
    return(errnum);
}

int ODatabase::ServerErrorSQLPos(void) const
{
    if (ActionStart() != OSUCCESS)
        return(-1);
    
    int errpos = ((_IOraDatabase *) Internal())->get_LastServerErrPos();
    
    return(errpos);
}

const char *ODatabase::GetServerErrorText(void) const
{
    if (ActionStart() != OSUCCESS)
		  return("");
    
    /*
        we want to change the state of this const database by changing
        the value of m_errtext.  Note that we're not really changing the
        database, we're only changing what we know about the database
    */                                                             
	 ODatabase *dbp = (ODatabase *) this;  // un-const the this pointer

    if (m_errtext)
    { // discard old error text (to make sure we always get latest error)
        OObjectFreeString(m_errtext);
		  dbp->m_errtext = 0;
    }
    
    char *cp = ((_IOraDatabase *) Internal())->get_LastServerErrText();

    dbp->m_errtext = cp;

	 return(m_errtext);
}

oresult ODatabase::ServerErrorReset(void)
{
	 if (ActionStart() != OSUCCESS)
		  return(OFAILURE);

	 ((_IOraDatabase *) Internal())->LastServerErrReset();

	 return((0 == ErrorNumber()) ? OSUCCESS : OFAILURE);
}

const char *ODatabase::GetRdbmsVersion(void) const
{
	if (ActionStart() != OSUCCESS)
		return("");

	if (! m_version)
	{
		ODatabase *dbp = (ODatabase *) this;  // un-const the this pointer
		char *cp = ((_IOraDatabase *) Internal())->get_RDBMSVersion();
		dbp->m_version = cp;
	}

	return m_version;
}
