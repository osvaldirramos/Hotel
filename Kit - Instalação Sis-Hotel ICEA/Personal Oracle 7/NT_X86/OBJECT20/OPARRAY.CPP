/* Copyright (c) Oracle Corporation 1994.  All Rights Reserved */

/*
    This source code is provided as a debugging aid for developers
    who have purchased Oracle Objects for OLE    .  Please see the
    online help for documentation of these classes.
*/

/*
    Oracle Objects for OLE     C++ Classes
    
    This file implements the OParamArray and OParameterCollection classes
                           
    CREATED    RWOOLARD   11/09/95
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

static const IID IID_IOraParamArray =
{0x8FAA1DE0, 0xEAB1, 0x101C, { 0x95, 0xC6, 0xC6, 0xA5, 0x55, 0xD0, 0x41, 0x1F } };
static const IID IID_IOraBindVariable =
{0xec8c4200, 0x853a, 0x101b, { 0x91, 0x9e, 0x04, 0x02, 0x1c, 0x00, 0x70, 0x02 } };

// ----- OParamArray -----------------------------------------------

OParamArray::OParamArray(void)
{
    m_name = 0;
    m_data = 0;
    m_errtext = 0;
}

OParamArray::OParamArray(const OParamArray &other)
{
    m_name = 0;
	m_errtext = 0;

	if(!m_data && other.Internal())
	{
		//m_data = (char **)malloc( ( (OParamArray *)(&other))->GetArraySize()*sizeof(char *));
		m_data = new char * [((OParamArray *)(&other))->GetArraySize()];
		memset(m_data,NULL, ( (OParamArray *)(&other))->GetArraySize()*sizeof(char *));
	}
	else
	    m_data = other.m_data;


    Copy(other);
}
 
OParamArray::~OParamArray(void)
{
    Cleanup();
}

oresult OParamArray::Close(void)
{
    return(Cleanup());
}

// overloaded assignment operator
OParamArray &OParamArray::operator=(const OParamArray &other)
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

oresult OParamArray::Cleanup(void)
{
    if (m_name)
    {
        OObjectFreeString(m_name);
        m_name = 0;
    }
	 if (m_data)
    {
	    for(int index=0;index < GetArraySize();index++)
		{
            OObjectFreeString(m_data[index]);
            m_data[index] = 0;
		 }
		// free(m_data);
		delete [] m_data;
	   m_data = 0;
    }
    if (m_errtext)
    {
        OObjectFreeString(m_errtext);
        m_errtext = 0;
    }
    return(OOracleObject::Cleanup());
}

oresult OParamArray::Copy(const OParamArray &other)
{
    // don't copy name
    m_name = 0;
    m_errtext = 0;
    if(!m_data && other.Internal())
	{
		//m_data = (char **)malloc( ( (OParamArray *)(&other))->GetArraySize()*sizeof(char *));
		long size = ((OParamArray *)(&other))->GetArraySize();
		m_data = new char * [size];
		memset(m_data,NULL, size * sizeof(char *));
	}
	else
	{
	  if(other.m_data)  
	    m_data = other.m_data;
	 }

    return(OOracleObject::Copy(other));
}

oresult OParamArray::OpenHelper(void *idisp, void *otheri)
{ 
    Cleanup();
        
	if (!idisp)
    {  // couldn't create connection.  error is on parent object
        SetOtherError(otheri);
		  return(OFAILURE);
    }
    IDispatch *connect = (IDispatch *) idisp;  // cast, for convenience
	
	void *tempi;
	HRESULT hc = connect->QueryInterface(IID_IOraParamArray, &tempi);
	connect->Release();
	if (FAILED(hc))
    { // couldn't get the interface
        SetInternalError(OERROR_NOINTER);
        return(OFAILURE);
    }
    
	return(SetObjectInterface(tempi));
}

const char *OParamArray::GetName(void) const
{
    if (ActionStart() != OSUCCESS)
        return(NULL); // error
    
    if (!m_name)
    {
        char *cp = ((_IOraParameter *) Internal())->get_Name();
        /*
            we want to change the state of this const parameter by changing
            the value of m_name.  Note that we're not really changing the
            parameter, we're only changing what we know about the parameter
        */
        OParamArray *dbp = (OParamArray *) this;  // un-const this
        dbp->m_name = cp;
	 }

	 return(m_name);
}


oresult OParamArray::GetValue(OValue *val, int index) const
{
	if (! val)
	{
		  SetInternalError(OERROR_BADARG);
		  return(OFAILURE);
	 }

    return(HelpGetValue((OOLEvar *) val->Internal(), index));
}

oresult OParamArray::GetValue(int *val, int index) const
{
    OOLEvar tempv;

	if (! val)
	{
        SetInternalError(OERROR_BADARG);
        return(OFAILURE);
	 }

    if (HelpGetValue(&tempv, index) != OSUCCESS)
        return(OFAILURE);
    
    return(tempv.GetValue(val));
}

oresult OParamArray::GetValue(long *val, int index) const
{
    OOLEvar tempv;

	if (! val)
	{
        SetInternalError(OERROR_BADARG);
        return(OFAILURE);
    }

    if (HelpGetValue(&tempv, index) != OSUCCESS)
        return(OFAILURE);
    
    return(tempv.GetValue(val));
}

oresult OParamArray::GetValue(double *val, int index) const
{
    OOLEvar tempv;

	if (! val)
	{
        SetInternalError(OERROR_BADARG);
        return(OFAILURE);
    }

    if (HelpGetValue(&tempv, index) != OSUCCESS)
        return(OFAILURE);
    
    return(tempv.GetValue(val));
}

oresult OParamArray::GetValue(const char **valp, int index) const
{
    OOLEvar tempv;

	if (! valp)
	{
        SetInternalError(OERROR_BADARG);
        return(OFAILURE);
    }

    if (HelpGetValue(&tempv, index) != OSUCCESS)
        return(OFAILURE);
    
    // now the string is owned by tempv, but will disappear when
    //   tempv is destroyed.  So copy the string
    
    const char *vp;
    if (tempv.GetValue(&vp) != OSUCCESS)
        return(OFAILURE);
    
    OParamArray *p2p = (OParamArray *) this;  // non-const version of "this"

	 if (m_data[index])
    {
        OObjectFreeString(p2p->m_data[index]);
        p2p->m_data[index] = 0;
    }
    if (vp)
    {
        p2p->m_data[index] = OObjectAllocString(vp);
        if (!m_data[index])
            SetInternalError(OERROR_MEMORY);

        *valp = m_data[index];
        return(m_data ? OSUCCESS : OFAILURE);
    }
    else
    {
		*valp = NULL;
		return OSUCCESS;
	}
	
}

oresult OParamArray::HelpGetValue(OOLEvar *tempv, unsigned int index) const
{
	 if (ActionStart() != OSUCCESS)
    {
        tempv->Clear(); // set to NULL value
		  return(OFAILURE); // error
    }
    
	((_IOraParamArray *) Internal())->
				_getParameterValue(tempv->GetVariant(), index);
	tempv->HaveSetVariant();
	
	return((ErrorNumber() == OERROR_NONE) ? OSUCCESS : OFAILURE);
}

oresult OParamArray::Clear(void)
{
    if (ActionStart() != OSUCCESS)
        return(OFAILURE); // error
    
    VARIANT nullvar;
    VariantInit(&nullvar);
    // set to database null value
    V_VT(&nullvar) = VT_NULL;
    
	 for (int index=0;index<GetArraySize();index++)
	     ((_IOraParamArray *) Internal())->_putParameterValue(&nullvar, index);

    VariantClear(&nullvar);
    
    return(ErrorNumber() ? OFAILURE : OSUCCESS);
}
    
oresult OParamArray::SetValue(const OValue &val, int index)
{
    if (ActionStart() != OSUCCESS)
        return(OFAILURE); // error
    
	// get OLE VARIANT from val
	OOLEvar *vres = (OOLEvar *) val.Internal();
	VARIANT *vr = vres->GetVariant();

	 ((_IOraParamArray *) Internal())->_putParameterValue(vr, index);
    
    return(ErrorNumber() ? OFAILURE : OSUCCESS);
}

oresult OParamArray::SetValue(int val, int index)
{
    OValue ov(val);
    return(SetValue(ov, index));
}
    
oresult OParamArray::SetValue(long val, int index)
{
    OValue ov(val);
    return(SetValue(ov, index));
}

oresult OParamArray::SetValue(double val, int index)
{
    OValue ov(val);
    return(SetValue(ov, index));
}
    
oresult OParamArray::SetValue(const char *val, int index)
{
    OValue ov(val);
    return(SetValue(ov, index));
}
    
short OParamArray::GetServerType(void) const
{
    if (ActionStart() != OSUCCESS)
        return(OFAILURE); // error
    
    return (short) (((_IOraParameter *) Internal())->get_ServerType());
}

int OParamArray::GetStatus(void) const
{
    if (ActionStart() != OSUCCESS)
        return(OFAILURE); // error
    
    int status = ((_IOraParameter *) Internal())->get_Status();
    return(ErrorNumber() ? 0 : status);
}

oresult OParamArray::AutoEnable(oboolean enable)
{
    if (ActionStart() != OSUCCESS)
        return(OFAILURE); // error
    
    if (enable)
        ((_IOraParameter *) Internal())->AutoBindEnable();
    else
        ((_IOraParameter *) Internal())->AutoBindDisable();
    return(ErrorNumber() ? OFAILURE : OSUCCESS);
}

oresult OParamArray::MinimumSize (long size)
{
    if (ActionStart() != OSUCCESS)
        return(OFAILURE); // error
    ((_IOraParameter *) Internal())->put_MinimumSize(size);
    
    return(ErrorNumber() ? OFAILURE : OSUCCESS);
}

long OParamArray::MinimumSize (void)
{
	if (ActionStart() != OSUCCESS)
		return(OFAILURE); // error
	long size = ((_IOraParameter *) Internal())->get_MinimumSize();

	return ErrorNumber() ? -1 : size;
}


// added on 3 aug 95.	PLSQL TABLE support
OParamArray OParameterCollection::AddTable(const char *name,  int iotype, int serverType, int Dimension, int Size)
{
   OParamArray param;
	VARIANT	pSize;

	if (!name)
	 {
		  SetInternalError(OERROR_BADARG);
		  return(param);
	 }

	 if (ActionStart() != OSUCCESS)
		  return(param); // error

	 BSTR tempname = OObjectAllocString(name);
		if (!tempname)
	 {  // couldn't get parameter name - maybe it was NULL
		  SetInternalError(OERROR_MEMORY);
		  return(param);
	 }

	 // add the parameter
	 VariantInit (&pSize);
	 pSize.vt = VT_I2;
     pSize.iVal = Size;          

	 ((_IOraParameters *) Internal())->AddTable(tempname,  iotype, serverType, Dimension, pSize);
	 
	VariantClear(&pSize);
	 if (ErrorNumber() != OERROR_NONE)
	 {
		  OObjectFreeString(tempname);
		  return(param);
	 }

	 // now set the parameter's server type

	 // get the parameter we just added
	 VARIANT vres;
	 VariantInit(&vres);

    V_VT(&vres) = VT_BSTR;
	V_BSTR(&vres) = tempname;
	
	 IDispatch *paramd;
    
	 paramd = ((_IOraParameters *) Internal())->get_Item(vres);
    VariantClear(&vres); // frees tempname

    // get parameter pointer
	if (!paramd)
    {  // couldn't get parameter (that we just succesfully added?!?)
		  SetInternalError(OERROR_SYSTEM);
        return(param);
	 }
	
	void *tempi;
	HRESULT hc = paramd->QueryInterface(IID_IOraParamArray, &tempi);
	// paramd isn't released because it is used in call to OpenHelper
	if (FAILED(hc))
	 { // couldn't get the interface
		  SetInternalError(OERROR_SYSTEM);
		  return(param);
	 }
    
	 // set the type
    ((_IOraParameter *) tempi)->put_ServerType(serverType);
	 ((_IOraParameter *) tempi)->Release();
    
	 // now open the parameter
	param.OpenHelper((void *) paramd, Internal());

	return(param);
}

OParamArray OParameterCollection::GetParamArray(int index) const
{
	 OParamArray param;

    if (ActionGetStart(&param) != OSUCCESS)
        return(param); // returning unopened object - indicates error
    
    // get the dispatch pointer
    VARIANT vres;
    VariantInit(&vres); 

    vres.vt = VT_I2;
    vres.iVal = (short) index;          
    IDispatch *connect;
    
    connect = ((_IOraParameters *) Internal())->get_Item(vres);
	 VariantClear(&vres);

	param.OpenHelper((void *) connect, Internal());
	
	return(param);
}

OParamArray OParameterCollection::GetParamArray(const char *pname) const
{
	 OParamArray param;
    
    if (ActionGetStart(&param) != OSUCCESS)
        return(param); // returning unopened object - indicates error
    
    // get the dispatch pointer
    VARIANT vres;
    VariantInit(&vres); 
    
    BSTR cp = OObjectAllocString(pname);
	V_VT(&vres) = VT_BSTR;
	V_BSTR(&vres) = cp;
	
    IDispatch *connect;
    
    connect = ((_IOraParameters *) Internal())->get_Item(vres);
    VariantClear(&vres); // frees cp

	param.OpenHelper((void *) connect, Internal());
	
	return(param);
}

const char *OParamArray::GetLastErrorText( void )
{

	 /*
		  we want to change the state of this const database by changing
		  the value of m_errtext.  Note that we're not really changing the
		  database, we're only changing what we know about the database
	 */
	 OParamArray *pOparam = (OParamArray *) this;  // un-const the this pointer

	 if (m_errtext)
	 { // discard old error text (to make sure we always get latest error)
		  OObjectFreeString(m_errtext);
		  pOparam->m_errtext = 0;
	 }

	 char *cp = ((_IOraParamArray *) Internal())->get_LastErrorText();

	 pOparam->m_errtext = cp;

	 return(m_errtext);
}

int OParamArray::GetArraySize(void )
{
	 return  ((_IOraParamArray *) Internal())->get_ArraySize();
}


