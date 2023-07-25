/* Copyright (c) Oracle Corporation 1994.  All Rights Reserved */

/*
    This source code is provided as a debugging aid for developers
    who have purchased Oracle Objects for OLE    .  Please see the
    online help for documentation of these classes.
*/

/*
    Oracle Objects for OLE     C++ Classes
    
    This file implements OStartup, OShutdown and several internal utility functions
                           
    CREATED    ********   11/22/94

*/

#ifndef ORACL_ORACLE
#include "oracl.h"
#endif

#ifndef ORAOBJI_ORACLE
#include "oraobji.h"
#endif

// ----- OStartup -----------------------------------------------

oboolean OStartup(void)
{
    oglobal *ogp = ssoo4wGetGlobal();  // probably allocates memory
    
    if (ogp->ogtried)
        return(FALSE);  // have already tried to startup
    
    // initialize OLE
    ogp->ogtried = TRUE;
    HRESULT hr = OleInitialize(0);
    SCODE sc = GetScode(hr);
    if (sc == S_OK)
    {
        ogp->ogdid = 1;  // we initialized 
        return(TRUE);
    }
    else if (sc == S_FALSE)   
    {
        ogp->ogdid = 2;  // we didn't, but its running
        return(TRUE);
    }
    else
    {
        ogp->ogdid = 0;  // no ole (some error)    
        return(FALSE);
    }
}

// ----- OShutdown -----------------------------------------------

void OShutdown(void)
{
    oglobal *ogp = ssoo4wGetGlobal();
    
    // shutdown ole, if needed
    if (ogp->ogtried && ogp->ogdid == 1)
    { // we initialized, we should uninitialize
        OleUninitialize();
    }
    
    // go ahead and free the global state
    ssoo4wfree();
    
    return;
}

// ----- Check for Initialization -----------------------------------------------

// check to make sure library is initialized 
/*
    We only need to check whether OLE is initialized from the creation
    of an OSession.  Because if that doesn't result in an open OSession,
    nothing else will get to the point of calling OLE.
*/

oboolean CheckOLE(void)
{
    oglobal *ogp = ssoo4wGetGlobal();
    
    if (ogp->ogtried && ogp->ogdid)
        return(TRUE);
    else
        return(FALSE);
}


// ----- String Utilities -----------------------------------------------

// for the Windows version this needs to use OLE routines 

char *OObjectAllocString(const char *instr)
{
#ifdef WIN32
    return((char *) SysAllocStringA(instr));
#else
   return((char *) SysAllocString(instr));
#endif
}

void OObjectFreeString(char *instr)
{
    if(instr)
       SysFreeString((BSTR) instr);
}

char *OObjectAllocStringLen(char *instr, unsigned int slen)
{
    // allocate string by length (takes care of embedded nulls) 

#ifdef  WIN32
        return((char *) SysAllocStringLenA(instr, slen));
#else
        return((char *) SysAllocStringLen(instr, slen));
#endif
}

unsigned int OObjectStringLen(char *instr)
{
#ifdef WIN32
    return(SysStringByteLen((BSTR) instr));
#else
    return(SysStringLen((BSTR) instr));
#endif
}

