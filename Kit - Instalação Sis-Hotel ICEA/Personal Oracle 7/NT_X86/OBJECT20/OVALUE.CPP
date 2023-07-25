/* Copyright (c) Oracle Corporation 1994.  All Rights Reserved */

/*
    This source code is provided as a debugging aid for developers
    who have purchased Oracle Objects for OLE    .  Please see the
    online help for documentation of these classes.
*/

/*
    Oracle Objects for OLE     C++ Classes

	 This file implements the OValue class
    It also implements the internal OOLEvar class
                           
    CREATED    ********   11/22/94
    RWOOLARD	MODIFIED	03/20/95
    			bug#	260396	SetValue() does not allocate for empty string
    					262214	Various GPF's when dealing with NULL pointers
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


// ----- OValue -----------------------------------------------

OValue::OValue(void)
{
    m_value = new OOLEvar;
}

OValue::OValue(const OValue &other)
{
    m_value = new OOLEvar;
    Copy(other);
}

OValue::OValue(int intvalue)
{
    m_value = new OOLEvar;
    m_value->SetValue(intvalue);
}

OValue::OValue(long longvalue)
{
    m_value = new OOLEvar;
    m_value->SetValue(longvalue);
}

OValue::OValue(double doublevalue)
{
    m_value = new OOLEvar;
    m_value->SetValue(doublevalue);
}

OValue::OValue(const char *tval)
{
    m_value = new OOLEvar;
    m_value->SetValue(tval);
}
OValue::OValue(short *intvalue)
{
    m_value = new OOLEvar;
    m_value->SetValue(intvalue);
}

OValue::OValue(int *intvalue)
{
	 m_value = new OOLEvar;
    m_value->SetValue(intvalue);
}

OValue::OValue(long *longvalue)
{
    m_value = new OOLEvar;
    m_value->SetValue(longvalue);
}

OValue::OValue(double *doublevalue)
{
    m_value = new OOLEvar;
    m_value->SetValue(doublevalue);
}

OValue::OValue( char **tval)
{
    m_value = new OOLEvar;
    m_value->SetValue(tval);
}

OValue::~OValue(void)
{
    Cleanup();
    
    // cleanup doesn't free m_value pointer - so get rid of it
    if (m_value)
    {
		  delete m_value;
    }
    
}

OValue &OValue::operator=(const OValue &other)
{
    if (&other == this)
        return(*this);
    
    // clear current value
    m_value->Clear();
    
    Copy(other);
    
    return(*this);
}

int OValue::operator==(const OValue &other) const
{
    return(m_value->IsEqual(other.m_value));
}

int OValue::operator!=(const OValue &other) const
{
    return(!(m_value->IsEqual(other.m_value)));
}

oresult OValue::Copy(const OValue &other)
{ 
    // we are copying only the other's value
    
    return(FromLocalType((void *) ((other.m_value)->GetVariant())));
}

oresult OValue::Cleanup(void)
{
    // clean out the value (but nothing else)
	 return(m_value->Clear());
}

oresult OValue::Clear(void)
{
    return(m_value->Clear());
}

oresult OValue::SetValue(const OValue &val)
{
    // clear current value
    m_value->Clear();
    
    return(Copy(val));
}

oresult OValue::SetValue(int val)
{
    OOLEvar var;
    var.SetValue(val);
    
    return(FromLocalType((void *) &var));
}

oresult OValue::SetValue(long val)
{   
    OOLEvar var;
    var.SetValue(val);
    
    return(FromLocalType((void *) &var));
}

oresult OValue::SetValue(double val)
{   
    OOLEvar var;
    var.SetValue(val);
    
	 return(FromLocalType((void *) &var));
}

oresult OValue::SetValue(const char *val)
{
    OOLEvar var;
    var.SetValue(val);
    
    return(FromLocalType((void *) &var));
}

oresult OValue::SetValue(short *val)
{
	 OOLEvar var;
	 var.SetValue(val);

    return(FromLocalType((void *) &var));
}

oresult OValue::SetValue(int *val)
{
    OOLEvar var;
    var.SetValue(val);
    
    return(FromLocalType((void *) &var));
}

oresult OValue::SetValue(long *val)
{   
	 OOLEvar var;
    var.SetValue(val);
    
    return(FromLocalType((void *) &var));
}

oresult OValue::SetValue(double *val)
{   
    OOLEvar var;
    var.SetValue(val);
    
    return(FromLocalType((void *) &var));
}

oresult OValue::SetValue(char **val)
{
    OOLEvar var;
    var.SetValue(val);

    return(FromLocalType((void *) &var));
}

// copy local representation (VARIANT in Windows case) to OValue
oresult OValue::FromLocalType(void *localv)
{
    if (m_value->SetValue((VARIANT *) localv) != OSUCCESS)
        return(OFAILURE);

    return(OSUCCESS);
}

oboolean OValue::IsNull(void) const
{
    return(m_value->IsNull());
}

OValue::operator long() const
{
    long val;
    m_value->GetValue(&val);
    return(val);
}

OValue::operator int() const
{
    int val;
    m_value->GetValue(&val);
    return(val);
}

OValue::operator double() const
{
    double val;
    m_value->GetValue(&val);
    return(val);
}

OValue::operator const char *() const
{
    const char *val;
    m_value->GetValue(&val);
    return(val);
}

void *OValue::Internal(void) const
{
    return((void *) m_value);
}

// ----- OOLEvar -----------------------------------------------

OOLEvar::OOLEvar(void)
{
    m_pmain = &m_mainv;
    m_pconv = &m_convertedv;
	 VariantInit(m_pmain);
    VariantInit(m_pconv);
    m_isconv = FALSE;

    // set to database null value
    V_VT(m_pmain) = VT_NULL;
}

OOLEvar::~OOLEvar(void)
{
    Clear();
}

VARIANT *OOLEvar::GetVariant(void)
{
    return(m_pmain);
}

void OOLEvar::HaveSetVariant(void)
{
    m_isconv = FALSE;  // the converted variant is no longer valid
    
    return;
}

oresult OOLEvar::Clear(void)
{
    VariantClear(m_pmain);
    VariantClear(m_pconv);
    
	 // set to database null value
    V_VT(m_pmain) = VT_NULL;
    
    m_isconv = FALSE;
    
    return(OSUCCESS);
}

oboolean OOLEvar::IsNull(void) const
{
    return (V_VT(m_pmain) == VT_NULL || V_VT(m_pmain) == VT_EMPTY);
}

oboolean OOLEvar::IsEqual(OOLEvar *other)
{ 
    // handle case of NULL
    if (IsNull())
    {
        return(other->IsNull());
    }
    
    switch(V_VT(m_pmain))
    {
	 case VT_I2:
        int ii;
        other->GetValue(&ii);
        return(V_I2(m_pmain) == ii);
    case VT_I4:
        long ll;
        other->GetValue(&ll);
        return(V_I4(m_pmain) == ll);
    case VT_R8:
        double dd;
        other->GetValue(&dd);
        return(V_R8(m_pmain) == dd);
    case VT_BSTR:
        const char *cp;
        other->GetValue(&cp);
        return(0 == strcmp(V_BSTR(m_pmain), cp));
	 default:
		  // huh?
        break;
	 }
    
    return(FALSE);  // shouldn't get here
}
                     
oresult OOLEvar::SetValue(int val)
{
    VariantClear(m_pmain);
    m_isconv = FALSE;
    V_VT(m_pmain) = VT_I2;
	V_I2(m_pmain) = (short) val;
	return(OSUCCESS);
}																							

oresult OOLEvar::SetValue(long val)
{
    VariantClear(m_pmain);
    m_isconv = FALSE;
	 V_VT(m_pmain) = VT_I4;
	V_I4(m_pmain) = val;
	return(OSUCCESS);
}

oresult OOLEvar::SetValue(double val)
{
    VariantClear(m_pmain);
    m_isconv = FALSE;
    V_VT(m_pmain) = VT_R8;
	V_R8(m_pmain) = val;
	return(OSUCCESS);
}

oresult OOLEvar::SetValue(const char *val)
{
    VariantClear(m_pmain);
    m_isconv = FALSE;
    char *cp;
//BUG #262214 and 260396    
	 if (!val)
    {
#ifdef  WIN32
		  cp = SysAllocStringA("");
#else
		  cp = SysAllocString("");
#endif
        // cp = "";
    }
    else
    {
#ifdef  WIN32
        cp = SysAllocStringA(val);
#else
        cp = SysAllocString(val);
#endif
    }
    if (!cp)
    {
        return(OFAILURE);  // out of memory
    }
    
    // set value
	V_VT(m_pmain) = VT_BSTR;
	V_BSTR(m_pmain) = cp;
	return(OSUCCESS);
}

oresult OOLEvar::SetValue(VARIANT *val)
{
    HRESULT hr = VariantCopy(m_pmain, val);
	 VariantClear(m_pconv);
    m_isconv = FALSE;
    return(FAILED(hr) ? OFAILURE : OSUCCESS);
}

oresult OOLEvar::SetValue(short *val)
{
    VariantClear(m_pmain);
    m_isconv = FALSE;
    V_VT(m_pmain) = VT_I2 | VT_BYREF;
	V_BYREF(m_pmain) =  val;
	return(OSUCCESS);
}																							

oresult OOLEvar::SetValue(int *val)
{
    VariantClear(m_pmain);
    m_isconv = FALSE;
#ifdef WIN32
    V_VT(m_pmain) = VT_I4 | VT_BYREF;
#else    //for MS-Windows  16-bit port
	V_VT(m_pmain) = VT_I2 | VT_BYREF;
#endif
	V_BYREF(m_pmain) =  val;
	return(OSUCCESS);
}																							

oresult OOLEvar::SetValue(long *val)
{
    VariantClear(m_pmain);
    m_isconv = FALSE;
    V_VT(m_pmain) = VT_I4| VT_BYREF;
	V_BYREF(m_pmain) = val;
	return(OSUCCESS);
}

oresult OOLEvar::SetValue(double *val)
{
    VariantClear(m_pmain);
    m_isconv = FALSE;
    V_VT(m_pmain) = VT_R8| VT_BYREF;
	V_BYREF(m_pmain) = val;
	return(OSUCCESS);
}

oresult OOLEvar::SetValue( char **val)
{
    VariantClear(m_pmain);
    m_isconv = FALSE;
	V_VT(m_pmain) = VT_BSTR | VT_BYREF;
	V_BYREF(m_pmain) = val;
	return(OSUCCESS);
}

oresult OOLEvar::GetValue(int *val)
{
    oresult ores = OSUCCESS;
    
    if (IsNull())
    {
        *val = 0;
        ores = OSUCCESS;
    }
    else if (V_VT(m_pmain) == VT_I2)
        *val = V_I2(m_pmain);
    else if (m_isconv && V_VT(m_pconv) == VT_I2)
        *val = V_I2(m_pconv);
    else
    { // we need to do a conversion

#ifdef WIN32
		 HRESULT hr = VariantChangeTypeA((VARIANTA *)m_pconv, (VARIANTA *)m_pmain, 0, VT_I2);
#else
			HRESULT hr = VariantChangeType((VARIANT *)m_pconv, (VARIANT *)m_pmain, 0, VT_I2);
#endif
	    if (FAILED(hr))
	    {
			  ores = OFAILURE;
			  *val = 0;
	    }
	    else
	    { // succesful conversion
	        m_isconv = TRUE;
	        *val = V_I2(m_pconv);
	    }
	}
	
	return(ores);
}

oresult OOLEvar::GetValue(long *val)
{
    oresult ores = OSUCCESS;
    
    if (IsNull())
    {
        *val = 0;
        ores = OSUCCESS;
    }
    else if (V_VT(m_pmain) == VT_I4)
        *val = V_I4(m_pmain);
    else if (m_isconv && V_VT(m_pconv) == VT_I4)
        *val = V_I4(m_pconv);
    else if (V_VT(m_pmain) == VT_I2)
		  *val = V_I2(m_pmain);
	 else if (m_isconv && V_VT(m_pconv) == VT_I2)
		  *val = V_I2(m_pconv);
	 else
	 { // we need to do a conversion

#ifdef WIN32    
		 HRESULT hr = VariantChangeTypeA((VARIANTA *)m_pconv, (VARIANTA *)m_pmain, 0, VT_I4);
#else
			HRESULT hr = VariantChangeType((VARIANT *)m_pconv, (VARIANT *)m_pmain, 0, VT_I4);
#endif

	    if (FAILED(hr))
	    {
	        ores = OFAILURE;
	        *val = 0;
	    }
	    else
	    { // succesful conversion
	        m_isconv = TRUE;
	        *val = V_I4(m_pconv);
	    }
	}
	
	return(ores);
}

oresult OOLEvar::GetValue(double *val)
{
    oresult ores = OSUCCESS;
    
    if (IsNull())
	 {
        *val = 0.0;
        ores = OSUCCESS;
    }
    else if (V_VT(m_pmain) == VT_R8)
        *val = V_R8(m_pmain);
    else if (m_isconv && V_VT(m_pconv) == VT_R8)
        *val = V_R8(m_pconv);
    else
    { // we need to do a conversion
    
#ifdef  WIN32    
		 HRESULT hr = VariantChangeTypeA((VARIANTA *)m_pconv, (VARIANTA *)m_pmain, 0, VT_R8);
#else
			HRESULT hr = VariantChangeType((VARIANT *)m_pconv, (VARIANT *)m_pmain, 0, VT_R8);
#endif

	    if (FAILED(hr))
	    {
	        ores = OFAILURE;
	        *val = 0;
	    }
	    else
	    { // succesful conversion
	        m_isconv = TRUE;
	        *val = V_R8(m_pconv);
	    }
	}
	
	return(ores);
}

oresult OOLEvar::GetValue(const char **val)
{
    oresult ores = OSUCCESS;
    
    if (IsNull())
    {
        *val = NULL;
        ores = OSUCCESS;
    }
    else if (V_VT(m_pmain) == VT_BSTR)
        *val = V_BSTR(m_pmain);
    else if (m_isconv && V_VT(m_pconv) == VT_BSTR)
        *val = V_BSTR(m_pconv);
    else
    { // we need to do a conversion

#ifdef  WIN32    
		 HRESULT hr = VariantChangeTypeA((VARIANTA *)m_pconv, (VARIANTA *)m_pmain, 0, VT_BSTR);
#else
			HRESULT hr = VariantChangeType((VARIANT *)m_pconv, (VARIANT *)m_pmain, 0, VT_BSTR);
#endif

	    if (FAILED(hr))
	    {
	        ores = OFAILURE;
	        *val = NULL;
	    }
	    else
	    { // succesful conversion
	        m_isconv = TRUE;
	        *val = V_BSTR(m_pconv);
	    }
	}
	
	return(ores);
}

unsigned int OOLEvar::GetStringLength(void) const
{
    if (V_VT(m_pmain) == VT_BSTR)
#ifdef WIN32
         return(SysStringByteLen(V_BSTR(m_pmain)));
#else
        return(SysStringLen(V_BSTR(m_pmain)));
#endif
    else if (m_isconv && V_VT(m_pconv) == VT_BSTR)
#ifdef WIN32
         return(SysStringByteLen(V_BSTR(m_pconv)));
#else
        return(SysStringLen(V_BSTR(m_pconv)));
#endif
    else
        return(0);
}

