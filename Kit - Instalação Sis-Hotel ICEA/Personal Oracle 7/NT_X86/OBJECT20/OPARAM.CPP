/* Copyright (c) Oracle Corporation 1994.  All Rights Reserved */

/*
    This source code is provided as a debugging aid for developers
    who have purchased Oracle Objects for OLE    .  Please see the
    online help for documentation of these classes.
*/

/*
    Oracle Objects for OLE     C++ Classes
    
    This file implements the OParameter and OParameterCollection classes
                           
    CREATED    ********   11/22/94
    RWOOLARD	MODIFIED	03/20/95
    			bug#	260323	Add(NULL) causes GPF
    					260879	Remove() should error when given NULL param.
    					262723	Added overloaded OParameter.Add(..., OValue)
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

static const IID IID_IOraParameters =
{0xf2ddb080, 0x853a, 0x101b, { 0x91, 0x9e, 0x04, 0x02, 0x1c, 0x00, 0x70, 0x02 } };
static const IID IID_IOraParameter =
{0x68c1d160, 0x8553, 0x101b, { 0x91, 0x9e, 0x04, 0x02, 0x1c, 0x00, 0x70, 0x02 } };

// ----- OParameter -----------------------------------------------

OParameter::OParameter(void)
{
    m_name = 0;
    m_data = 0;
}

OParameter::OParameter(const OParameter &other)
{
    m_name = 0;
    m_data = 0;
	 Copy(other);
}
 
OParameter::~OParameter(void)
{
    Cleanup();
}

oresult OParameter::Close(void)
{
    return(Cleanup());
}

// overloaded assignment operator
OParameter &OParameter::operator=(const OParameter &other)
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

oresult OParameter::Cleanup(void)
{
    if (m_name)
    {
        OObjectFreeString(m_name);
        m_name = 0;
    }
	 if (m_data)
    {
        OObjectFreeString(m_data);
        m_data = 0;
    }
	     return(OOracleObject::Cleanup());
}

oresult OParameter::Copy(const OParameter &other)
{
    // don't copy name
    m_name = 0;
    m_data = 0;

	 return(OOracleObject::Copy(other));
}

oresult OParameter::OpenHelper(void *idisp, void *otheri)
{
	 Cleanup();

	if (!idisp)
	 {  // couldn't create connection.  error is on parent object
		  SetOtherError(otheri);
		  return(OFAILURE);
	 }
    IDispatch *connect = (IDispatch *) idisp;  // cast, for convenience
	
	void *tempi;
	HRESULT hc = connect->QueryInterface(IID_IOraParameter, &tempi);
	connect->Release();
	if (FAILED(hc))
    { // couldn't get the interface
        SetInternalError(OERROR_NOINTER);
        return(OFAILURE);
    }
    
	return(SetObjectInterface(tempi));
}

const char *OParameter::GetName(void) const
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
        OParameter *dbp = (OParameter *) this;  // un-const this
        dbp->m_name = cp;
	 }

	 return(m_name);
}


oresult OParameter::GetValue(OValue *val) const
{
	if (! val)
	{
		  SetInternalError(OERROR_BADARG);
		  return(OFAILURE);
	 }

	 return(HelpGetValue((OOLEvar *) val->Internal()));
}

oresult OParameter::GetValue(int *val) const
{
    OOLEvar tempv;

	if (! val)
	{
        SetInternalError(OERROR_BADARG);
        return(OFAILURE);
	 }

	 if (HelpGetValue(&tempv) != OSUCCESS)
        return(OFAILURE);
    
    return(tempv.GetValue(val));
}

oresult OParameter::GetValue(long *val) const
{
    OOLEvar tempv;

	if (! val)
	{
        SetInternalError(OERROR_BADARG);
        return(OFAILURE);
    }

	 if (HelpGetValue(&tempv) != OSUCCESS)
        return(OFAILURE);
    
    return(tempv.GetValue(val));
}

oresult OParameter::GetValue(double *val) const
{
    OOLEvar tempv;

	if (! val)
	{
        SetInternalError(OERROR_BADARG);
        return(OFAILURE);
    }

	 if (HelpGetValue(&tempv) != OSUCCESS)
        return(OFAILURE);
    
    return(tempv.GetValue(val));
}

oresult OParameter::GetValue(const char **valp) const
{
    OOLEvar tempv;

	if (! valp)
	{
        SetInternalError(OERROR_BADARG);
        return(OFAILURE);
    }

	 if (HelpGetValue(&tempv) != OSUCCESS)
        return(OFAILURE);
    
    // now the string is owned by tempv, but will disappear when
    //   tempv is destroyed.  So copy the string
    
    const char *vp;
    if (tempv.GetValue(&vp) != OSUCCESS)
        return(OFAILURE);
    
    OParameter *p2p = (OParameter *) this;  // non-const version of "this"
	 if (m_data)
    {
        OObjectFreeString(p2p->m_data);
        p2p->m_data = 0;
    }
    if (vp)
    {
        p2p->m_data = OObjectAllocString(vp);
        if (!m_data)
            SetInternalError(OERROR_MEMORY);

        *valp = m_data;
        return(m_data ? OSUCCESS : OFAILURE);
    }
    else
    {
		*valp = NULL;
		return OSUCCESS;
	}
}

OParameter::operator int() const
{
    int val;
    if (GetValue(&val) != OSUCCESS)
        val = 0;
    return(val);
}

OParameter::operator long() const
{
    long val;
    if (GetValue(&val) != OSUCCESS)
        val = 0;
    return(val);
}

OParameter::operator double() const
{
    double val;
    if (GetValue(&val) != OSUCCESS)
        val = 0.0;
    return(val);
}

OParameter::operator const char *() const
{
    const char *val;
    if (GetValue(&val) != OSUCCESS)
        val = NULL;
    return(val);
}

oresult OParameter::HelpGetValue(OOLEvar *tempv) const
{
	 if (ActionStart() != OSUCCESS)
    {
        tempv->Clear(); // set to NULL value
		  return(OFAILURE); // error
    }
    
	((_IOraParameter *) Internal())->
				_getParameterValue(tempv->GetVariant());
	tempv->HaveSetVariant();
	
	return((ErrorNumber() == OERROR_NONE) ? OSUCCESS : OFAILURE);
}

oresult OParameter::Clear(void)
{
    if (ActionStart() != OSUCCESS)
        return(OFAILURE); // error
    
    VARIANT nullvar;
    VariantInit(&nullvar);
    // set to database null value
    V_VT(&nullvar) = VT_NULL;
    
    ((_IOraParameter *) Internal())->_putParameterValue(&nullvar);
    VariantClear(&nullvar);
    
    return(ErrorNumber() ? OFAILURE : OSUCCESS);
}
    
oresult OParameter::SetValue(const OValue &val)
{
    if (ActionStart() != OSUCCESS)
        return(OFAILURE); // error
    
	// get OLE VARIANT from val
	OOLEvar *vres = (OOLEvar *) val.Internal();
	VARIANT *vr = vres->GetVariant();

	 ((_IOraParameter *) Internal())->_putParameterValue(vr);
    
    return(ErrorNumber() ? OFAILURE : OSUCCESS);
}

oresult OParameter::SetValue(int val)
{
    OValue ov(val);
	 return(SetValue(ov));
}
    
oresult OParameter::SetValue(long val)
{
    OValue ov(val);
	 return(SetValue(ov));
}

oresult OParameter::SetValue(double val)
{
    OValue ov(val);
	 return(SetValue(ov));
}
    
oresult OParameter::SetValue(const char *val)
{
    OValue ov(val);
    return(SetValue(ov));
}
    
short OParameter::GetServerType(void) const
{
    if (ActionStart() != OSUCCESS)
        return(OFAILURE); // error
    
    return (short) (((_IOraParameter *) Internal())->get_ServerType());
}

int OParameter::GetStatus(void) const
{
    if (ActionStart() != OSUCCESS)
        return(OFAILURE); // error
    
    int status = ((_IOraParameter *) Internal())->get_Status();
    return(ErrorNumber() ? 0 : status);
}

oresult OParameter::AutoEnable(oboolean enable)
{
    if (ActionStart() != OSUCCESS)
        return(OFAILURE); // error
    
    if (enable)
        ((_IOraParameter *) Internal())->AutoBindEnable();
    else
        ((_IOraParameter *) Internal())->AutoBindDisable();
    return(ErrorNumber() ? OFAILURE : OSUCCESS);
}

oresult OParameter::MinimumSize (long size)
{
    if (ActionStart() != OSUCCESS)
        return(OFAILURE); // error
    ((_IOraParameter *) Internal())->put_MinimumSize(size);
    
    return(ErrorNumber() ? OFAILURE : OSUCCESS);
}

long OParameter::MinimumSize (void)
{
	if (ActionStart() != OSUCCESS)
		return(OFAILURE); // error
	long size = ((_IOraParameter *) Internal())->get_MinimumSize();
		    
	return ErrorNumber() ? -1 : size;
}

// ----- OParameterCollection -----------------------------------------------

OParameterCollection::OParameterCollection(void)
{
	m_arraysize = 0;
}

OParameterCollection::OParameterCollection(const OParameterCollection &other)
{
    Copy(other);
}
 
OParameterCollection::~OParameterCollection(void)
{
    Cleanup();
}

// overloaded assignment operator
OParameterCollection &OParameterCollection::operator=(const OParameterCollection &other)
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

oresult OParameterCollection::Close(void)
{
    return(Cleanup());
}

oresult OParameterCollection::Cleanup(void)
{
    return(OOracleObject::Cleanup());
}

oresult OParameterCollection::Copy(const OParameterCollection &other)
{
    return(OOracleObject::Copy(other));
}

oresult OParameterCollection::OpenHelper(void *idisp, void *otheri)
{ 
    Cleanup();
        
	if (!idisp)
    {  // couldn't create connection.  error is on parent object
        SetOtherError(otheri);
        return(OFAILURE);
    }
    IDispatch *connect = (IDispatch *) idisp;  // cast, for convenience
	
	void *tempi;
	HRESULT hc = connect->QueryInterface(IID_IOraParameters, &tempi);
	connect->Release();
	if (FAILED(hc))
    { // couldn't get the interface
        SetInternalError(OERROR_NOINTER);
        return(OFAILURE);
    }
    
	return(SetObjectInterface(tempi));
}

OParameter OParameterCollection::Add(const char *name, int value, int iotype, int serverType)
{
	 return(AddHelp(name, value, iotype, serverType));
}

OParameter OParameterCollection::Add(const char *name, long value, int iotype, int serverType)
{
	 return(AddHelp(name, value, iotype, serverType));
}
    
OParameter OParameterCollection::Add(const char *name, double value, int iotype, int serverType)
{
	 return(AddHelp(name, value, iotype, serverType));
}

OParameter OParameterCollection::Add(const char *name, const char *value, int iotype, int serverType)
{
	if (iotype != OPARAMETER_OUTVAR && value == (const char*) 0)
	{
		OParameter param;
		SetInternalError(OERROR_BADARG);
		return(param);
	}

	return(AddHelp(name, value, iotype, serverType));
}

//BUG #262723	Added overloaded OParameter.Add(..., OValue)
OParameter OParameterCollection::Add(const char *name, const OValue &value, int iotype, int serverType)
{
	 return(AddHelp(name, value, iotype, serverType));
}

OParameter OParameterCollection::AddHelp(const char *name, const OValue &val, int iotype, int serverType)
{
	 OParameter param; // closed parameter (so far)
	m_arraysize = 0;
//BUG # 260323 outdated by bug 287410
//	if (!name || val == (const OValue) 0)
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

	 OOLEvar *vresp = (OOLEvar *) val.Internal();
	VARIANT *vr = vresp->GetVariant();

	 // add the parameter
	 ((_IOraParameters *) Internal())->Add(tempname, *vr, iotype);
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
	HRESULT hc = paramd->QueryInterface(IID_IOraParameter, &tempi);
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

long OParameterCollection::GetCount(void) const
{
	 if (ActionStart() != OSUCCESS)
		  return(0); // error

    long count = ((_IOraParameters *) Internal())->get_Count(); 
    return((ErrorNumber() == OERROR_NONE) ? count : 0);   
}

OParameter OParameterCollection::GetParameter(int index) const
{
    OParameter param;

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

OParameter OParameterCollection::GetParameter(const char *pname) const
{
    OParameter param;
    
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

oresult OParameterCollection::Remove(int index)
{
    if (ActionStart() != OSUCCESS)
        return(OFAILURE);
    
    VARIANT vres;
    VariantInit(&vres); 

    vres.vt = VT_I2;
    vres.iVal = (short) index;
    
    ((_IOraParameters *) Internal())->Remove(vres);          
    VariantClear(&vres);

    return((ErrorNumber() == OERROR_NONE) ? OSUCCESS : OFAILURE);   
}

oresult OParameterCollection::Remove(const char *pname)
{
//BUG #260879
	if (! pname)
	{
		SetInternalError (OERROR_BADARG);
		return(OFAILURE);
	}

    if (ActionStart() != OSUCCESS)
        return(OFAILURE);
    
    // get the dispatch pointer
    VARIANT vres;
    VariantInit(&vres); 
    
    BSTR cp = OObjectAllocString(pname);
	V_VT(&vres) = VT_BSTR;
	V_BSTR(&vres) = cp;
	
    ((_IOraParameters *) Internal())->Remove(vres);          
    VariantClear(&vres);

    return((ErrorNumber() == OERROR_NONE) ? OSUCCESS : OFAILURE);   
}


