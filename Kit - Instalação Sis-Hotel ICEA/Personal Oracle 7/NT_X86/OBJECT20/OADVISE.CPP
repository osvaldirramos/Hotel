/* Copyright (c) Oracle Corporation 1994.  All Rights Reserved */

/*
    This source code is provided as a debugging aid for developers
    who have purchased Oracle Objects for OLE.       Please see the
    online help for documentation of these classes.
*/

/*
    Oracle Objects for OLE     C++ Classes
    
    This file implements the OAdvise class
                           
    CREATED    ********   11/22/94

*/

#ifndef ORACL_ORACLE
#include "oracl.h"
#endif

#ifndef _OracleInProcServer_H_
#include <oratlb.h>
#endif

static const IID IID_IOraAdvisorySink =
{0xab598600, 0x0a9a, 0x101b, { 0xad, 0xf2, 0x04, 0x02, 0x1c, 0x00, 0x70, 0x02 } };

// ----- OOLEAdvise -----------------------------------------------

class OOLEAdvise : public IOraAdvisorySink
{ 
public:
    // construction & destruction
    OOLEAdvise(OAdvise *parent = NULL);
    ~OOLEAdvise(void);

    // IUnknown overrides
    STDMETHODIMP         QueryInterface(REFIID, void **);
    STDMETHODIMP_(ULONG) AddRef(void);
    STDMETHODIMP_(ULONG) Release(void);
    
    // our entries
    STDMETHODIMP         OnActionRequest(int action);
    STDMETHODIMP         OnAction(int action);
    STDMETHODIMP         OnStatusChange(int action);
        
private:
    unsigned long  refcount;
    OAdvise       *m_parent;
};

// ----- OAdvise -----------------------------------------------

OAdvise::OAdvise(void)
{
}

OAdvise::OAdvise(const OAdvise &other)
{
    Copy(other);
}

OAdvise::OAdvise(const ODynaset &dyn)
{
    OAdvise(); // default contructor
    Open(dyn);
}

OAdvise::~OAdvise(void)
{
    Cleanup();
}

oresult OAdvise::Cleanup(void)
{
    if (IsOpen())
    {
        // disconnect from dynaset
        m_oDyn.ErrorReset();
        ((_IOraDynaset *) (m_oDyn.Internal()))->DUnadvise((OOLEAdvise *) Internal());
        if (0 != m_oDyn.ErrorNumber())
        { // error in unadvise
            SetOtherError(m_oDyn.Internal());
            return(OFAILURE);
        }        
    }
    
    // close the dynaset
    m_oDyn.Close();
    
    return(OOracleObject::Cleanup());
}

oresult OAdvise::Copy(const OAdvise &other)
{
    m_oDyn = other.m_oDyn;
    
    // we can't just copy the oipadv (and AddRef) here.  That wouldn't get the
    //   callbacks to our object.  We've got to create a new OOLEAdvise.
    
    OOLEAdvise *tempadv = new OOLEAdvise(this);
    if (!tempadv)
    { // couldn't get memory?
        SetInternalError(OERROR_MEMORY);
        return(OFAILURE);
    }
    
    if (SetObjectInterface((void *) tempadv, FALSE) != OSUCCESS)
        return(OFAILURE);
    
    // tell dynaset about it
    m_oDyn.ErrorReset();
    ((_IOraDynaset *) (m_oDyn.Internal()))->DAdvise(tempadv);
    if (0 != m_oDyn.ErrorNumber())
    { // failure at dynaset
        SetOtherError(m_oDyn.Internal());
        return(OFAILURE);
    }
    
    // everything worked
    return(OSUCCESS);
}

oresult OAdvise::Open(const ODynaset &odyn)
{
    if (!odyn.IsOpen())
    {
	    SetInternalError(OERROR_INVPARENT); 
		return(OFAILURE);
    }
    
    // create new advisory object
    OOLEAdvise *tempadv = new OOLEAdvise(this);
    if (!tempadv)
    { // couldn't get memory?
        SetInternalError(OERROR_MEMORY);
        return(OFAILURE);
    }
    SetObjectInterface((void *) tempadv, FALSE);
    
    // get a copy of dynaset we're connected to
    m_oDyn = odyn;
    
    // tell dynaset about it
    m_oDyn.ErrorReset();
    ((_IOraDynaset *) (m_oDyn.Internal()))->DAdvise(tempadv);
    if (0 != m_oDyn.ErrorNumber())
    { // failure at dynaset
        SetOtherError(m_oDyn.Internal());
        return(OFAILURE);
    }
    
    // everything worked
    return(OSUCCESS);
}

ODynaset OAdvise::GetDynaset(void) const
{
    ActionGetStart(&m_oDyn); // set errors (if needed)
    
    return(m_oDyn);
}

oresult OAdvise::Close(void)
{
    return(Cleanup());
}

// overloaded assignment operator
OAdvise &OAdvise::operator=(const OAdvise &other)
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

oboolean OAdvise::ActionRequest(int movekind)
{
    return(TRUE);
}

void OAdvise::ActionNotify(int movekind)
{
    return;
}

void OAdvise::StatusChange(int statuskind)
{
    return;
}

// messages that oipsrv hands us on advises
#define OIPMSG_BOOKMARK	      18
#define OIPMSG_MOVEFIRST	  64
#define OIPMSG_MOVENEXT	      65
#define OIPMSG_MOVEPREV	      66
#define OIPMSG_MOVELAST	      67
#define OIPMSG_FINDFIRST	  68
#define OIPMSG_FINDNEXT	      69
#define OIPMSG_FINDPREV	      70
#define OIPMSG_FINDLAST	      71
#define OIPMSG_DELETE	      72
#define OIPMSG_ADDNEW	      73
#define OIPMSG_REFRESH	      74
#define OIPMSG_ROLLBACK	      76
#define OIPMSG_CLOSE	      77
#define OIPMSG_DATAFIELDCHANGED 78
#define OIPMSG_SAVEDATA	      79
#define OIPMSG_READDATA	      80
#define OIPMSG_UPDATE	      81
#define OIPMSG_UNLOAD	      82

// ----- OOLEAdvise -----------------------------------------------

OOLEAdvise::OOLEAdvise(OAdvise *parent) 
{ 
	refcount = 1;
	m_parent = parent;
} 
 
 
OOLEAdvise::~OOLEAdvise() 
{ 
} 
 
STDMETHODIMP_(ULONG) 
OOLEAdvise::AddRef() 
{ 
	return ++refcount; 
} 
 
STDMETHODIMP_(ULONG) 
OOLEAdvise::Release() 
{ 
	if (--refcount == 0) 
	  { 
	    delete this; 
	    return 0; 
	  } 
 
	return refcount; 
} 
 
STDMETHODIMP 
OOLEAdvise::QueryInterface(REFIID iid, void **ppv) 
{
    if (!IsEqualGUID(iid, IID_IUnknown) && !IsEqualGUID(iid, IID_IOraAdvisorySink)) 
	    return ResultFromScode(E_NOINTERFACE);  // unsupported interface
	
	// caller is asking for us
	*ppv = this; 
	AddRef(); 
 
	return NOERROR; 
} 
 
STDMETHODIMP 
OOLEAdvise::OnActionRequest(int action) 
{
    oboolean result;
    int message;  // message we pass
    
    if (!m_parent)
        return(ResultFromScode(S_OK));  // we aren't been bound, so OK request
    
    // translate action
    switch(action)
    {
    case OIPMSG_MOVEFIRST:
        message = OADVISE_MOVE_FIRST;
        break;
    case OIPMSG_MOVEPREV:
         message = OADVISE_MOVE_PREV;
        break;
    case OIPMSG_MOVENEXT:
        message = OADVISE_MOVE_NEXT;
        break;
    case OIPMSG_MOVELAST:
        message = OADVISE_MOVE_LAST;
        break;
    case OIPMSG_FINDFIRST:
        message = OADVISE_FIND_FIRST;
        break;
    case OIPMSG_FINDPREV:
         message = OADVISE_FIND_PREV;
        break;
    case OIPMSG_FINDNEXT:
        message = OADVISE_FIND_NEXT;
        break;
    case OIPMSG_FINDLAST:
        message = OADVISE_FIND_LAST;
        break;
    case OIPMSG_BOOKMARK:
        message = OADVISE_MOVE_TOMARK;
        break; 
    case OIPMSG_DELETE:
        message = OADVISE_DELETE;
        break;
    case OIPMSG_ADDNEW:
        message = OADVISE_ADDNEW;
        break;
    case OIPMSG_UPDATE:
        message = OADVISE_UPDATE;
        break;
    case OIPMSG_REFRESH:
        message = OADVISE_REFRESH;
        break;
    case OIPMSG_ROLLBACK:
        message = OADVISE_ROLLBACK;
        break;
    default:
        message = OADVISE_OTHER;
        break;
    }
    
    result = m_parent->ActionRequest(message);
    
    return(result ? ResultFromScode(S_OK) : ResultFromScode(S_FALSE));
} 
 
STDMETHODIMP 
OOLEAdvise::OnAction(int action) 
{
    int message;  // message we pass
    
    if (!m_parent)
        return(ResultFromScode(S_OK));  // we aren't been bound, so OK request
    
    switch(action)
    {
    case OIPMSG_MOVEFIRST:
        message = OADVISE_MOVE_FIRST;
        break;
    case OIPMSG_MOVEPREV:
        message = OADVISE_MOVE_PREV;
        break;
    case OIPMSG_MOVENEXT:
        message = OADVISE_MOVE_NEXT;
        break;
    case OIPMSG_MOVELAST:
        message = OADVISE_MOVE_LAST;
        break;
    case OIPMSG_FINDFIRST:
        message = OADVISE_FIND_FIRST;
        break;
    case OIPMSG_FINDPREV:
        message = OADVISE_FIND_PREV;
        break;
    case OIPMSG_FINDNEXT:
        message = OADVISE_FIND_NEXT;
        break;
    case OIPMSG_FINDLAST:
        message = OADVISE_FIND_LAST;
        break;
    case OIPMSG_BOOKMARK:
        message = OADVISE_MOVE_TOMARK;
        break; 
    case OIPMSG_DELETE:
        message = OADVISE_DELETE;
        break;
    case OIPMSG_ADDNEW:
        message = OADVISE_ADDNEW;
        break;
    case OIPMSG_UPDATE:
        message = OADVISE_UPDATE;
        break;
    case OIPMSG_REFRESH:
        message = OADVISE_REFRESH;
        break;
    case OIPMSG_ROLLBACK:
        message = OADVISE_ROLLBACK;
        break;
    default:
        message = OADVISE_OTHER;
        break;
    }
    
    m_parent->ActionNotify(message);
    
    
    return(ResultFromScode(S_OK));
} 
 
 
/* DCAdvisory::OnStatusChange ------------------------------------------ 
 
   Informs the advisory objects of a variety of status changes. 
--------------------------------------------------------------------- */ 
 
STDMETHODIMP
OOLEAdvise::OnStatusChange(int statCode) 
{
    if (statCode == 1) // DCSTAT_LASTKNOWN is 1, so far as I can tell
        m_parent->StatusChange(OADVISE_FOUNDLAST);
	return NOERROR; 
} 
