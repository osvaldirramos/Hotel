/* Copyright (c) Oracle Corporation 1994.  All Rights Reserved */

/*
    This source code is provided as a debugging aid for developers
    who have purchased Oracle Objects for OLE    .  Please see the
    online help for documentation of these classes.
*/

/*
    Oracle Objects for OLE     C++ Classes
    
    This file implements the OSession, OConnection and OClient classes
                           
    CREATED    ********   11/22/94
    RWOOLARD	MODIFIED	03/20/95
    			bug#	263010	GetNamedSession returns default when name NULL
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

static const CLSID CLSID_XOSession = 
{0x3893b4a0, 0xffd8, 0x101a, { 0xad, 0xf2, 0x04, 0x02, 0x1c, 0x00, 0x70, 0x02 } };

static const IID IID_IOraSession =
{0xa16bec60, 0x134a, 0x101b, { 0x91, 0x9e, 0x04, 0x02, 0x1c, 0x00, 0x70, 0x02 } };
static const IID IID_IOraClient =
{0x8041eee0, 0x134a, 0x101b, { 0x91, 0x9e, 0x04, 0x02, 0x1c, 0x00, 0x70, 0x02 } };
static const IID IID_IOraConnection =
{0xbea85c00, 0x134a, 0x101b, { 0x91, 0x9e, 0x04, 0x02, 0x1c, 0x00, 0x70, 0x02 } };   

// ----- OSession -----------------------------------------------

OSession::OSession(void)
{
    m_name = 0;
    m_errtext = 0;
    m_version = 0;
}

OSession::OSession(const OSession &other) // copy constructor
{
    m_name = 0;
    m_errtext = 0;
    m_version = 0;
    Copy(other); // call internal copier
}

OSession::OSession(const char *sname)
{ // create & open a session
    m_name = 0;
    m_errtext = 0;
    m_version = 0;
    if (sname)
        Open(sname);
    else
        Open();
}

// create a brand new session from scratch.  One way or another we always start from here
//    because all the rest of the objects hang off this initial session

OSession::~OSession(void)
{
    Cleanup();
}

oresult OSession::Open(void)
{
	char msg[80];

    Cleanup();
    
    if (!CheckOLE())
    { // OLE isn't initialized
        SetInternalError(OERROR_SYSTEM);
        return(OFAILURE);
    }

    void *tempi;
	HRESULT hr = CoCreateInstance(CLSID_XOSession, NULL, CLSCTX_INPROC_SERVER | CLSCTX_INPROC_HANDLER,
								  IID_IOraSession, &tempi);

	int	ret = GetScode(hr);
	switch (ret)
	{
	case E_OUTOFMEMORY:	
        MessageBox(NULL,"Out of memory.",NULL,MB_OK);
    	break;
	case REGDB_E_CLASSNOTREG:
		MessageBox(NULL,"Specified class not registered in registry",NULL,MB_OK);
	    break;
    case E_INVALIDARG:
    	MessageBox(NULL,"One or more arguments are invalid. ",NULL,MB_OK);
	   break;
    case E_UNEXPECTED:	
    	MessageBox(NULL,"An unexpected error occurred. ",NULL,MB_OK);
       break;
	default:
		wsprintf (msg, "Error %d creating instance", ret);
		MessageBox(NULL, msg, NULL, MB_OK);
	case NOERROR:	
		break;
	}

	if (FAILED(hr))
	{ // can't create session object
	    // we could save the HRESULT for later use
	    SetInternalError(OERROR_SYSTEM);
	    return(OFAILURE);
	}
    
    return(SetObjectInterface(tempi));							  
}

// open a new named session
oresult OSession::Open(const char *sname)
{
    // get the client object
    OSession sess;
    sess.Open();  // open the default session
    OClient oCl = sess.GetClient();
    if (!oCl.IsOpen())
    { // no client object not opened yet
        SetInternalError(OERROR_INVPARENT);
        return(OFAILURE);
    }
    if (!sname)
    {
        SetInternalError(OERROR_BADARG);
        return(OFAILURE);
    }
    
    oCl.ErrorReset();
    BSTR cp = OObjectAllocString(sname);
	IDispatch *connect = ((_IOraClient *) (oCl.Internal()))->get_CreateSession(cp);
	OObjectFreeString(cp);
	
    return(OpenHelper((void *) connect, oCl.Internal()));
}

OSession OSession::GetNamedSession(const char *sname)
{
    OSession nameds;

    // temporary OSession on default session
    OSession defsess(0);

    if (!defsess.IsOpen())
    { // can't open default session - probably not initialized
        nameds.SetInternalError(OERROR_INVPARENT);
        return(nameds); // return of closed session indicates error
    }
    
    if (!sname || !strcmp (sname, ""))
        return(defsess);  // user just wanted default session
    
    // otherwise - fetch the named session
    BSTR tempname = OObjectAllocString(sname);
    IDispatch *sess = ((_IOraSession *) (defsess.Internal()))->get_ConnectSession(tempname);
    OObjectFreeString((char *) tempname);
    
    // new session
    nameds.OpenHelper((void *) sess, defsess.Internal());
    
    return(nameds);
}

OConnectionCollection OSession::GetConnections(void) const
{
    OConnectionCollection cset;
    
    if (ActionGetStart(&cset) != OSUCCESS)
        return(cset); // returning unopened object - indicates error
    
	IDispatch *connect = ((_IOraSession *) (Internal()))->get_Connections();
	
	cset.OpenHelper((void *) connect, Internal());
	
	return(cset);
}

#ifdef	ORA_HEAP
oresult OSession::MemoryManager (int flags)
{
    if (ActionStart() != OSUCCESS)
        return(OFAILURE);
    
    ((_IOraSession *) Internal())->MemoryManager(flags, -1);

    return OSUCCESS;
}

oresult OSession::MemoryLog (int flags)
{
    if (ActionStart() != OSUCCESS)
        return(OFAILURE);
    
    ((_IOraSession *) Internal())->MemoryManager(-1, flags);

    return OSUCCESS;
}
#endif


OClient OSession::GetClient(void) const
{
    OClient cl;
    
    if (ActionGetStart(&cl) != OSUCCESS)
        return(cl); // returning unopened object - indicates error
    
	IDispatch *connect = ((_IOraSession *) (Internal()))->get_Client();
	
	cl.OpenHelper((void *) connect, Internal());
	
	return(cl);
}

oresult OSession::OpenHelper(void *idisp, void *otheri)
{
	if (!idisp)
    { // couldn't create session - error is on other object
        SetOtherError(otheri);
        return(OFAILURE);
    }
    IDispatch *connect = (IDispatch *) idisp;
	
    Cleanup(); // clear out this object
    
    void *tempi;
	HRESULT hc = connect->QueryInterface(IID_IOraSession, &tempi);
	connect->Release();
	if (FAILED(hc))
    { // couldn't get the interface
        SetInternalError(OERROR_NOINTER);
        return(OFAILURE);
    }
    
	return(SetObjectInterface(tempi));
}

oresult OSession::Close(void)
{
    return(Cleanup());
}

// overloaded assignment operator
OSession &OSession::operator=(const OSession &other)
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

// routine to do all cleanup for OSession
oresult OSession::Cleanup(void)
{
    if (m_name)
    {
        OObjectFreeString(m_name);
        m_name = 0;
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
    
    return(OOracleObject::Cleanup());
}    

oresult OSession::Copy(const OSession &other)
{
    // don't bother copying strings
    m_name = 0;
    m_errtext = 0;
    m_version = 0;
    
    return(OOracleObject::Copy(other));
}

const char *OSession::GetName(void) const
{
    if (ActionStart() != OSUCCESS)
        return(NULL);
    
    if (!m_name)
    {
        char *cp = ((_IOraSession *) Internal())->get_Name();
        
        /*
            we want to change the state of this const session by changing
            the value of m_name.  Note that we're not really changing the
            session, we're only changing what we know about the session
        */                                                             
        OSession *sessp = (OSession *) this;  // un-const the this pointer
        sessp->m_name = cp;
    }
    return(m_name);
}

const char *OSession::GetVersion(void) const
{
    // the version never changes, so if we have it, it is valid
    if (m_version)
        return(m_version);
    
    if (ActionStart() != OSUCCESS)
        return(NULL);
    
    char *cp = ((_IOraSession *) Internal())->get_OipVersionNumber();
        
    /*
        we want to change the state of this const session by changing
        the value of m_version.  Note that we're not really changing the
        session, we're only changing what we know about the session
    */                                                             
    OSession *sessp = (OSession *) this;  // un-const the this pointer
    sessp->m_version = cp;
    
    return(m_version);
}

long OSession::ServerErrorNumber(void) const
{
    if (ActionStart() != OSUCCESS)
        return(0);
    
    long errnum = ((_IOraSession *) Internal())->get_LastServerErr();
    
    return(errnum);
}

const char *OSession::GetServerErrorText(void) const
{
    if (ActionStart() != OSUCCESS)
        return("");
    
    /*
        we want to change the state of this const session by changing
        the value of m_errtext.  Note that we're not really changing the
        session, we're only changing what we know about the session
    */                                                             
    OSession *sessp = (OSession *) this;  // un-const the this pointer

    if (m_errtext)
    { // discard old error text (to make sure we always get latest error)
        OObjectFreeString(m_errtext);
        sessp->m_errtext = 0;
    }
    
    char *cp = ((_IOraSession *) Internal())->get_LastServerErrText();

    sessp->m_errtext = cp;

    return(m_errtext);
}

oresult OSession::ServerErrorReset(void)
{
    if (ActionStart() != OSUCCESS)
        return(OFAILURE);
    
    ((_IOraSession *) Internal())->LastServerErrReset();
    
    return((OERROR_NONE == ErrorNumber()) ? OSUCCESS : OFAILURE);
}

oresult OSession::BeginTransaction(void)
{
    if (ActionStart() != OSUCCESS)
        return(OFAILURE);
    
    ((_IOraSession *) Internal())->BeginTrans();

    return((OERROR_NONE == ErrorNumber()) ? OSUCCESS : OFAILURE);
}

oresult OSession::Commit(oboolean startnew)
{
    if (ActionStart() != OSUCCESS)
        return(OFAILURE);
    
    ((_IOraSession *) Internal())->CommitTrans();
    long errnum = ErrorNumber();
    
    if (0 == errnum && startnew)
    { // the commit worked.  start new transaction if user requested it
        return(BeginTransaction());
    }
    
    return((OERROR_NONE == errnum) ? OSUCCESS : OFAILURE);
}

oresult OSession::Rollback(oboolean startnew)
{
    if (ActionStart() != OSUCCESS)
        return(OFAILURE);
    
    ((_IOraSession *) Internal())->Rollback();
    long errnum = ErrorNumber();
    
    if (OERROR_NONE == errnum && startnew)
    { // the rollback worked.  start new transaction if user requested it
        return(BeginTransaction());
    }
    
    return((OERROR_NONE == errnum) ? OSUCCESS : OFAILURE);
}

oresult OSession::ResetTransaction(void)
{
    if (ActionStart() != OSUCCESS)
        return(OFAILURE);
    
    ((_IOraSession *) Internal())->ResetTrans();
    return((OERROR_NONE == ErrorNumber()) ? OSUCCESS : OFAILURE);
}

// ----- OClient -----------------------------------------------

OClient::OClient(void)
{
    m_name = 0;
}

OClient::OClient(const OClient &other)
{
    m_name = 0;
    Copy(other);
}
 
OClient::~OClient(void)
{
    Cleanup();
}

// overloaded assignment operator
OClient &OClient::operator=(const OClient &other)
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

oresult OClient::Cleanup(void)
{
    if (m_name)
    {
        OObjectFreeString(m_name);
        m_name = 0;
    }
    
    return(OOracleObject::Cleanup());
}

oresult OClient::Copy(const OClient &other)
{
    m_name = 0; // don't bother copying string
    
    return(OOracleObject::Copy(other));
}

oresult OClient::OpenHelper(void *obji, void *otheri)
{
	if (!obji)
    { // couldn't create client - error is on other object
        SetOtherError(otheri);
        return(OFAILURE);
    }
    IDispatch *connect = (IDispatch *) obji;
	
    Cleanup(); // clear out this object
    
    void *tempi;
	HRESULT hc = connect->QueryInterface(IID_IOraClient, &tempi);
	connect->Release();
	if (FAILED(hc))
    { // couldn't get the interface
        SetInternalError(OERROR_NOINTER);
        return(OFAILURE);
    }
    
	return(SetObjectInterface(tempi));
}

oresult OClient::Close(void)
{
    return(Cleanup());
}

const char *OClient::GetName(void) const
{
    if (ActionStart() != OSUCCESS)
        return(NULL);
    
    if (!m_name)
    {
        char *cp = ((_IOraClient *) Internal())->get_Name();
        OClient *clp = (OClient *) this;  // un-const this
        clp->m_name = cp;
    }
    
    return(m_name);
}

OSessionCollection OClient::GetSessions(void) const
{
    OSessionCollection cset;
    
    if (ActionGetStart(&cset) != OSUCCESS)
        return(cset); // returning unopened object - indicates error
    
	IDispatch *connect = ((_IOraClient *) (Internal()))->get_Sessions();
	
	cset.OpenHelper((void *) connect, Internal());
	
	return(cset);
}

// ----- OConnection -----------------------------------------------

OConnection::OConnection(void)
{
    // we don't have strings yet
    m_dbname = 0;
    m_dbconnect = 0;
}

OConnection::OConnection(const OConnection &other)
{
    m_dbname = 0;
    m_dbconnect = 0;
    Copy(other);
}
 
OConnection::~OConnection(void)
{
    Cleanup();
}

// overloaded assignment operator
OConnection &OConnection::operator=(const OConnection &other)
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

oresult OConnection::Close(void)
{
    return(Cleanup());
}

oresult OConnection::Cleanup(void)
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
    
    return(OOracleObject::Cleanup());
}

oresult OConnection::Copy(const OConnection &other)
{
    m_dbname = 0;
    m_dbconnect = 0;
    
    return(OOracleObject::Copy(other));
}

oresult OConnection::OpenHelper(void *idisp, void *otheri)
{ 
    Cleanup();
        
	if (!idisp)
    {  // couldn't create connection.  error is on parent object
        SetOtherError(otheri);
        return(OFAILURE);
    }
    IDispatch *connect = (IDispatch *) idisp;  // cast, for convenience
	
	void *tempi;
	HRESULT hc = connect->QueryInterface(IID_IOraConnection, &tempi);
	connect->Release();
	if (FAILED(hc))
    { // couldn't get the interface
        SetInternalError(OERROR_NOINTER);
        return(OFAILURE);
    }
    
	return(SetObjectInterface(tempi));
}

OSession OConnection::GetSession(void) const
{
    OSession sess;
    
    if (ActionGetStart(&sess) != OSUCCESS)
        return(sess); // returning unopened object - indicates error
    
	IDispatch *connect = ((_IOraConnection *) (Internal()))->get_Session();
	sess.OpenHelper((void *) connect, Internal());
	
	return(sess);
}

const char *OConnection::GetConnectString(void) const
{
    if (ActionStart() != OSUCCESS)
        return(NULL);
    
    if (!m_dbconnect)
    {
        char *cp = ((_IOraConnection *) Internal())->get_Connect();
        OConnection *connp = (OConnection *) this;  // un-const this
        connp->m_dbconnect = cp;
    }
    return(m_dbconnect);
}

const char *OConnection::GetDatabaseName(void) const
{
    if (ActionStart() != OSUCCESS)
        return(NULL);
    
    if (!m_dbname)
    {
        char *cp = ((_IOraConnection *) Internal())->get_DatabaseName();
        OConnection *connp = (OConnection *) this;  // un-const this
        connp->m_dbname = cp;
    }
    return(m_dbname);
}
