/* Copyright (c) Oracle Corporation 1994.  All Rights Reserved */

/*
    This source code is provided as a debugging aid for developers
    who have purchased Oracle Objects for OLE    .  Please see the
    online help for documentation of these classes.
*/

/*
    Oracle Objects for OLE     C++ Classes
    
    This file implements the OOracleObject class
                           
    CREATED    ********   11/22/94
    RWOOLARD	MODIFIED	03/20/95
    			bug#	262912	*ErrorText should return "" and not NULL
    				262914	*ErrorText should return const char *
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

static const IID IID_IExDispatch =
{0x51309a40, 0x14ba, 0x101b, { 0x91, 0x9e, 0x04, 0x02, 0x1c, 0x00, 0x70, 0x02 } };

// values for error state
#define OERROR_OBJECT -1 // use the normal object error interface
#define OERROR_OTHER -2  // indicates that we should use "other" interface
#define OERROR_INTERNAL -3  // some error in our code - no error interface has the error 


// ----- OOracleObject -----------------------------------------------

// default constructor
OOracleObject::OOracleObject(void)
{
    // we haven't opened interfaces yet - they're null
    m_obji = 0;
    m_erri = 0;
    m_errotheri = 0;
    m_errstate = OERROR_OBJECT;
    m_errno = OERROR_NONE;
    m_lasterrstring = 0;
}

// copy construtor
OOracleObject::OOracleObject(const OOracleObject &other)
{
    m_obji = 0;
    m_erri = 0;
    m_errotheri = 0;
    m_errstate = OERROR_OBJECT;
    m_errno = OERROR_NONE;
    m_lasterrstring = 0;
    // copy new state
    Copy(other);
}

// destructor
OOracleObject::~OOracleObject(void)
{
    // clean out current state
    Cleanup();
}

// overloaded assignment operator
OOracleObject &OOracleObject::operator=(const OOracleObject &other)
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

int OOracleObject::operator==(const OOracleObject &other) const
{
    // closed objects are never equal to anything
    if (!m_obji)
        return(FALSE);
    return(m_obji == other.m_obji);
}

int OOracleObject::operator!=(const OOracleObject &other) const
{
    // closed objects are never equal to anything
    if (!m_obji)
        return(TRUE);
    
    return(m_obji != other.m_obji);
}

void *OOracleObject::Internal(void) const
{
    return m_obji;
}

oboolean OOracleObject::IsOpen(void) const
{
    return (m_obji ? TRUE : FALSE);
}

// routine to clean up current state
//   This routine makes the object look as it did after default constructor
oresult OOracleObject::Cleanup(void)
{
    if (m_obji)
    {  // release object interface
        ((IDispatch *) m_obji)->Release();
        m_obji = 0;
    }
    
    if (m_erri)
    {   // release error interface
        ((_IExDispatch *) m_erri)->Release();
        m_erri = 0;
    }
    
    if (m_errotheri)
    {   // release error interface
        ((_IExDispatch *) m_errotheri)->Release();
        m_errotheri = 0;
    }
    
    if (m_lasterrstring)
    {
        OObjectFreeString(m_lasterrstring);
        m_lasterrstring = 0;
    }
    
    m_errstate = OERROR_OBJECT;
    m_errno = OERROR_NONE;
    
    return(OSUCCESS);
}

oresult OOracleObject::Copy(const OOracleObject &other)
{
    if (other.m_obji)
    { // copy the object interface
        m_obji = other.m_obji;
        ((IDispatch *) m_obji)->AddRef();
    }
    else
        m_obji = 0;
    
    // copy error information
    if (other.m_erri)
    { // copy the error interface
        m_erri = other.m_erri;
        ((_IExDispatch *) m_erri)->AddRef();
    }
    else
        m_erri = 0;
    
    if (other.m_errotheri)
    { // copy the other error interface
        m_errotheri = other.m_errotheri;
        ((_IExDispatch *) m_errotheri)->AddRef();
    }
    else
        m_errotheri = 0;
    
    m_errno = other.m_errno;
    m_errstate = other.m_errstate;
    
    // we don't bother copying m_lasterrstring
    m_lasterrstring = 0;
    
    
    return(OSUCCESS);    
}

// SetObjectInterface - lets subclasses set the object interface
oresult OOracleObject::SetObjectInterface(void *obji, oboolean geterror)
{
    // get rid of old object & error interfaces
    OOracleObject::Cleanup();
    
    // take care of error interface
    if (geterror)
    {  // try to get error interface from object
        HRESULT hc;
        hc = ((IDispatch *) obji)->QueryInterface(IID_IExDispatch, &m_erri);
	    if (FAILED(hc))
        {
            m_erri = 0; // to be sure 
        
            // set error condition
            SetInternalError(OERROR_NOINTER);
            return(OFAILURE);
        }
    }
    else
    { // don't even try to get error interface (maybe there isn't one...)
        m_erri = 0;
    }
    
    // everything went fine
    
    // set the new object interface
    m_obji = obji;
    
    ErrorReset();
    
    return(OSUCCESS);
}

// helper routine for all the routines that do something...
oresult OOracleObject::ActionStart(void) const
{
    if (!IsOpen())
    {
        SetInternalError(OERROR_NOTOPEN);
        return(OFAILURE);
    }
    ErrorReset();

    return(OSUCCESS);
}

// helper routine for all the routines that return an object...
oresult OOracleObject::ActionGetStart(const OOracleObject *nobj) const
{
    if (!IsOpen())
    {
        SetInternalError(OERROR_NOTOPEN);
        nobj->SetInternalError(OERROR_INVPARENT);
        return(OFAILURE);
    }
    ErrorReset();

    return(OSUCCESS);
}

void OOracleObject::ErrorReset(void) const
{
    // we need non-const version of "this" for manipulating error state
    OOracleObject *op = (OOracleObject *) this;
    
    if (m_erri)
    {
        ((_IExDispatch *) m_erri)->Reset();
    }
    
    if (m_errotheri)
    {   // release other error interface (we don't need it anymore)
        ((_IExDispatch *) m_errotheri)->Release();
        op->m_errotheri = 0;
    }
    
    if (m_lasterrstring)
    {
        OObjectFreeString(m_lasterrstring);
        op->m_lasterrstring = 0;
    }
    
    op->m_errstate = OERROR_OBJECT;
    op->m_errno = OERROR_NONE;
    
    return;   
}

void OOracleObject::SetOtherError(void *otheri) const
{
    // we need non-const version of "this" for manipulating error state
    OOracleObject *op = (OOracleObject *) this;
    
    if (m_errotheri)
    {   // release old other error interface (we don't need it anymore)
        ((_IExDispatch *) m_errotheri)->Release();
        op->m_errotheri = 0;
    }
    
    if (m_lasterrstring)
    {
        OObjectFreeString(m_lasterrstring);
        op->m_lasterrstring = 0;
    }
    
    // try to get other error interface
    HRESULT hc;
    void *errotheri;
    hc = ((IDispatch *) otheri)->QueryInterface(IID_IExDispatch, &errotheri);
	if (FAILED(hc))
    {// yikes! now we don't have the proper error info at all!
        // we'd better not ever get here...
        op->m_errotheri = 0; // to be sure 
        
        // set error condition
        SetInternalError(OERROR_NOINTER);
    }
    else
    { // we got the error interface
        op->m_errotheri = errotheri;
        op->m_errstate = OERROR_OTHER;
        op->m_errno = OERROR_NONE;  // actual error is contained in the other interface
    }
    
    return;
}

void OOracleObject::SetInternalError(long errnum) const
{
    // we need non-const version of "this" for manipulating error state
    OOracleObject *op = (OOracleObject *) this;
    
    if (m_errotheri)
    {   // release other error interface (we don't need it anymore)
        ((_IExDispatch *) m_errotheri)->Release();
        op->m_errotheri = 0;
    }
    
    if (m_lasterrstring)
    {
        OObjectFreeString(m_lasterrstring);
        op->m_lasterrstring = 0;
    }
    
    op->m_errstate = OERROR_INTERNAL;
    op->m_errno = errnum;
    
    return;
}

long OOracleObject::ErrorNumber(void) const
{
    // note that just because m_errno contains OERROR_NONE doesn't mean that
    // there is no error.  If the errstate is OERROR_OBJECT or OERROR_OTHER there
    // may be an error in the interface we don't know about yet
    
    long errnum = 0;
    HRESULT hr;

    if (m_errstate == OERROR_INTERNAL)
    { // internal error condition
        return(m_errno);
    }
    else if (m_errstate == OERROR_OBJECT)
    {
        if (m_erri)
        {
            hr = ((_IExDispatch *) m_erri)->get_ResultCode();
            long scode = GetScode(hr);
            if (SUCCEEDED(scode))
		errnum = OERROR_NONE;
            else
            { // try to translate the error
                // what facility is this?
                if (SCODE_FACILITY(scode) == 4)
                { // this is interface-specific errors, that's us
		    errnum = SCODE_CODE(scode);
                }
                else // some other facility - just return generic "implementation" error
		    errnum = OERROR_SYSTEM;
            }
        }
        else
        { // must be object that doesn't have error interface
	    errnum = m_errno;
        }
    }
    else if (m_errstate == OERROR_OTHER && m_errotheri)
    {
        hr = ((_IExDispatch *) m_errotheri)->get_ResultCode();
        long scode = GetScode(hr);
        if (SUCCEEDED(scode))
	    errnum = OERROR_NONE;
        else
        {
            if (SCODE_FACILITY(scode) == 4)
            { // this is interface-specific errors, that's us
		errnum = SCODE_CODE(scode);
            }
            else // some other facility - just return generic "implementation" error
		errnum = OERROR_SYSTEM;
        }
    }
    else
    { // error state indicated an interface that is gone!
	errnum = OERROR_BADERR;
    }    
    
    return(errnum);
}

// BUG #262914
const char *OOracleObject::LookupErrorText(long errnum) const
{
    // we need non-const version of "this" for manipulating error state
    OOracleObject *op = (OOracleObject *) this;
    
    // any such text message should be obtainable from the error object (?)
    if (m_erri)
    {
        if (m_lasterrstring)
        {  // we've already got a string - free it
            OObjectFreeString(m_lasterrstring);
            op->m_lasterrstring = 0;
        }

	op->m_lasterrstring = ((_IExDispatch *) m_erri)->LookupScodeText(errnum);
        return(m_lasterrstring ? m_lasterrstring : "");
    }
    else
// BUG #262912
        return("");       
}

// BUG #262914
const char *OOracleObject::GetErrorText(void) const
{
    // we need non-const version of "this" for manipulating error state
    OOracleObject *op = (OOracleObject *) this;
    
    if (m_lasterrstring)
    {  // we've already got a string - free it
        OObjectFreeString(m_lasterrstring);
        op->m_lasterrstring = 0;
    }

    if (m_errstate == OERROR_INTERNAL)
    { // internal error condition
        op->m_lasterrstring = 0;
    }
    else if (m_errstate == OERROR_OBJECT)
    {
        if (m_erri)
            op->m_lasterrstring = ((_IExDispatch *) m_erri)->get_ResultText();
        else
            op->m_lasterrstring = 0;  // object with no error interface
    }
    else if (m_errstate == OERROR_OTHER && m_errotheri)
    {
        op->m_lasterrstring = ((_IExDispatch *) m_errotheri)->get_ResultText();
    }
    else
    { // error state indicated an interface that is gone!
        op->m_lasterrstring = 0;
    }
    
// BUG #262912
    return(m_lasterrstring ? m_lasterrstring : "");   
}
