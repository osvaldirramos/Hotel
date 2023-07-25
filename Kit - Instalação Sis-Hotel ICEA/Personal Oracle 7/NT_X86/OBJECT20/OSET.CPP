/* Copyright (c) Oracle Corporation 1994.  All Rights Reserved */

/*
    This source code is provided as a debugging aid for developers
    who have purchased Oracle Objects for OLE    .  Please see the
    online help for documentation of these classes.
*/

/*
    Oracle Objects for OLE     C++ Classes
    
    This file implements the OFieldCollection, OConnectionCollection and
    OSessionCollection classes
                           
    CREATED    ********   11/22/94
    RWOOLARD	MODIFIED	03/20/95
    			bug#
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

static const IID IID_IOraFields =
{0xedbe6700, 0x0562, 0x101b, { 0xad, 0xf2, 0x04, 0x02, 0x1c, 0x00, 0x70, 0x02 } };
static const IID IID_IOraCollection =
{0xdadfdec0, 0x134a, 0x101b, { 0x91, 0x9e, 0x04, 0x02, 0x1c, 0x00, 0x70, 0x02 } };
static const IID IID_IOraConnection =
{0xbea85c00, 0x134a, 0x101b, { 0x91, 0x9e, 0x04, 0x02, 0x1c, 0x00, 0x70, 0x02 } };   
static const IID IID_IOraSession =
{0xa16bec60, 0x134a, 0x101b, { 0x91, 0x9e, 0x04, 0x02, 0x1c, 0x00, 0x70, 0x02 } };
static const IID IID_IOraField =
{0x145f9fa0, 0x0563, 0x101b, { 0xad, 0xf2, 0x04, 0x02, 0x1c, 0x00, 0x70, 0x02 } };

// Set type defines (internal use only)
#define SET_TYPE_NONE 0
#define SET_TYPE_SESSION 1
#define SET_TYPE_CONNECTION 2
#define SET_TYPE_FIELD 3

// ----- OOracleCollection -----------------------------------------------

OOracleCollection::OOracleCollection()
{
    m_settype = SET_TYPE_NONE;
}

OOracleCollection::OOracleCollection(const OOracleCollection &other)
{
    m_settype = SET_TYPE_NONE;
    Copy(other);
}

OOracleCollection::~OOracleCollection(void) 
{
    Cleanup();
}

// overloaded assignment operator
OOracleCollection &OOracleCollection::operator=(const OOracleCollection &other)
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

oresult OOracleCollection::Copy(const OOracleCollection &other)
{
    m_settype = other.m_settype;
    
    return(OOracleObject::Copy(other));
}

oresult OOracleCollection::Close(void)
{
    return(Cleanup());
}

oresult OOracleCollection::Cleanup(void)
{
    m_settype = SET_TYPE_NONE; 

    return(OOracleObject::Cleanup());        
}

oresult OOracleCollection::OpenSetHelper(void *connect, void *otheri, unsigned char stype)
{
	if (!connect)
    { // couldn't create set - error is on other object
        SetOtherError(otheri);
        return(OFAILURE);
    }
	
	Cleanup();  // drop previous state
    
    HRESULT hc;
    void *tempi;
    if (stype == SET_TYPE_FIELD)
	    hc = ((IDispatch *) connect)->QueryInterface(IID_IOraFields, &tempi);
    else    
	    hc = ((IDispatch *) connect)->QueryInterface(IID_IOraCollection, &tempi);
	((IDispatch *) connect)->Release();
	if (FAILED(hc))
    { // couldn't get the interface
        SetInternalError(OERROR_NOINTER);
        return(OFAILURE);
    }
    
    // set object interface (only fields support error interface)
	oresult ores = SetObjectInterface(tempi, stype == SET_TYPE_FIELD);
	
	if (ores == OSUCCESS)
	{ // we successfully created the object
	    m_settype = stype;    
    }
    
	return(ores);
} 

long OOracleCollection::GetCount(void) const
{
    if (ActionStart() != OSUCCESS)
        return(0); // error
    
    long nitems;
    if (m_settype == SET_TYPE_FIELD)
        nitems = ((_IOraFields *) Internal())->get_Count();
    else
        nitems = ((_IOraCollection *) Internal())->get_Count();
    
    return(nitems);
}

void *OOracleCollection::GetItem(unsigned char stype, int index) const
{
    void *itemP;
    
    if (stype != m_settype || !IsOpen())
    {
        SetInternalError(OERROR_NOINTER);
        return(0);
    }
    
    // get the dispatch pointer
    VARIANT vres;
    VariantInit(&vres); 

    vres.vt = VT_I2;
    vres.iVal = (short) index;          
    IDispatch *connect;
    
    if (m_settype == SET_TYPE_FIELD)
	    connect = ((_IOraFields *) Internal())->get_Item(vres); 
	else
	    connect = ((_IOraCollection *) Internal())->get_Item(vres); 
	
	if (!connect)
    {  // we know what the error is (caller will refer to us)
        return(0);
    }
	
	// now get the actual interface
	
	HRESULT hc;
	
	if (m_settype == SET_TYPE_CONNECTION)
	    hc = connect->QueryInterface(IID_IOraConnection, &itemP);
	else if (m_settype == SET_TYPE_SESSION)
	    hc = connect->QueryInterface(IID_IOraSession, &itemP);
	else if (m_settype == SET_TYPE_FIELD)
	    hc = connect->QueryInterface(IID_IOraField, &itemP);	 
	    
	connect->Release();
	if (FAILED(hc))
    { // couldn't get the interface
        SetInternalError(OERROR_NOINTER);
        return(0);
        // now caller will refer to our error interface - will that know what the error is?
    }
	
	return(itemP);
}

// ----- OFieldCollection -----------------------------------------------

oresult OFieldCollection::OpenHelper(void *connect, void *otheri)
{
    return(OpenSetHelper(connect, otheri, SET_TYPE_FIELD));
}

OField OFieldCollection::GetField(int index) const
{
    OField of;
    
    if (ActionGetStart(&of) != OSUCCESS)
        return(of); // returning unopened object - indicates error
    
    // get new field from collection
    void *tempi = GetItem(SET_TYPE_FIELD, index);    
    
    of.OpenHelper(tempi, Internal());
    return(of);   
}

// ----- OConnectionCollection -----------------------------------------------

oresult OConnectionCollection::OpenHelper(void *connect, void *otheri)
{
    return(OpenSetHelper(connect, otheri, SET_TYPE_CONNECTION));
}

OConnection OConnectionCollection::GetConnection(int index) const
{                                             
    OConnection conn;
    
    if (ActionGetStart(&conn) != OSUCCESS)
        return(conn); // returning unopened object - indicates error
    
    // get new session from collection
    void *tempi = GetItem(SET_TYPE_CONNECTION, index);
    
    conn.OpenHelper(tempi, Internal());
    
    return(conn);
}

// ----- OSessionCollection -----------------------------------------------

oresult OSessionCollection::OpenHelper(void *connect, void *otheri)
{
    return(OpenSetHelper(connect, otheri, SET_TYPE_SESSION));
}

OSession OSessionCollection::GetSession(int index) const
{
    OSession sess;
    
    if (ActionGetStart(&sess) != OSUCCESS)
        return(sess); // returning unopened object - indicates error
    
    // get new session from collection
    void *tempi = GetItem(SET_TYPE_SESSION, index);
    sess.OpenHelper(tempi, Internal());
    
    return(sess);
}

