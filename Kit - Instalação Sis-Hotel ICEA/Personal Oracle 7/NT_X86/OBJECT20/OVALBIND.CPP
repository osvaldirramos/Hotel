/* Copyright (c) Oracle Corporation 1994.  All Rights Reserved */

/*
    Implementation of the Oracle InProc Server C++ classes
    OValue

                           
    CREATED    kwhitley   10/24/94

*/

#include "windows.h"
#include <ole2.h>
#ifdef ORAMS21FIX
#include <winnls.h>
#else
#include <olenls.h>       
#endif

#include <dispatch.h>  

#ifndef ORACL_ORACLE
#include "oracl.h"
#endif

#ifndef ORAOBJI_ORACLE
#include "oraobji.h"
#endif

#ifndef _OracleInProcServer_H_
#include <oratlb.h>
#endif

#ifdef USEOIPGUIDH

#ifndef OIPGUID_ORACLE
#include <oipguid.h>
#endif

#else // USEOIPGUIDH 

static const IID IID_IOraDynaset =
{0xf0051a80, 0x00b3, 0x101b, { 0xad, 0xf2, 0x04, 0x02, 0x1c, 0x00, 0x70, 0x02 } };

static const IID IID_IOraBindVariable =
{0xec8c4200, 0x853a, 0x101b, { 0x91, 0x9e, 0x04, 0x02, 0x1c, 0x00, 0x70, 0x02 } };

static const IID IID_IOraBindContext =
{0xEFB98D20L,0x853A, 0x101B, { 0x91, 0x9E, 0x04, 0x02, 0x1C, 0x00, 0x70, 0x02 } };

#endif  // USEOIPGUIDH

// ------------------  OBindVar -----------------
// internal class to allow binding of OValue instances

class OBindVar : public _IOraBindVariable
{
public:
	// IUnknown methods
	STDMETHOD(QueryInterface)(REFIID riid, LPVOID * iret);
	STDMETHOD_(ULONG, AddRef)(void);
	STDMETHOD_(ULONG, Release)(void);

	// _IOraBindVariable methods
	STDMETHOD(GetPersistentPointer)(VARIANT **pvVal);
	STDMETHOD(SetValue)(VARIANT var);
	STDMETHOD(GetValue)(VARIANT *pvVal);
	STDMETHOD(SetBindIdentifier)(BSTR bstr);
	STDMETHOD_(BSTR,GetBindIdentifier)(void);
	STDMETHOD(BindToContext)(_IOraBindContext *pContext, DWORD dwVid,
				 DWORD *pdwCookie);
	STDMETHOD(Unbind)(DWORD dwCookie);
	STDMETHOD(IsInputVariable)(void);
	STDMETHOD(IsOutputVariable)(void);
	STDMETHOD(IsEnabled)(void);

    
    // implementation methods
    OBindVar(OValue *parent, int iotype);
    ~OBindVar(void);
    
    oresult Orphan(void);  // tell OBindVar that parent is going away
    void SetAutoEnabled(oboolean enabled);
    oresult ContextTellChange(VARIANT *var);
    
private:
    unsigned int m_refcount;
    OValue  *m_parent; // pointer to relevant OValue
    const char *m_bindname; // bind name
    int m_inout;  // 1: in, 2: out, 3: in/out
    oboolean m_autoenabled;
    _IOraBindContext *m_context;
    DWORD         m_vid;  // variable id
    
    oresult Cleanup(void);
    
    OBindVar(const OBindVar &other); // copy constructor - intentionally not implemented
    OBindVar &operator=(const OBindVar &other); // assignment - intentionally not implemented    
};

OBindVar::OBindVar(OValue *parent, int iotype)
{
    m_context = 0;
    m_parent = parent;
    m_bindname = 0;
    m_autoenabled = FALSE;
    
    m_refcount = 1;
        
    m_inout = iotype;
}

OBindVar::~OBindVar(void)
{
    Cleanup();
}

oresult OBindVar::Orphan(void)
{
    m_parent = 0;  // no more parent

    if (m_context)
    { // tell the context that we're going away
        m_context->Detach(m_vid);
        m_context = 0;
    }
    
    /*  Once an OBindVar has been orphaned it isn't good for much, although
        you can still ask for its name, enabled state and whether it's in/out.
        But value get/set doesn't work and it won't be used as a parameter.
        
        Orphaned OBindVars are needed in case the OValue (which is the parent) goes
        away but some other code has gotten a reference to this _IOraBindVariable.
    */
    return(OSUCCESS);
}

oresult OBindVar::Cleanup(void)
{
    if (m_bindname)
    {
        OObjectFreeString((char *) m_bindname);
        m_bindname = 0;
    }
    
    if (m_context)
    { // tell the context that we're going away
        m_context->Detach(m_vid);
        m_context = 0;
    }
    
    return(OSUCCESS);
}

void OBindVar::SetAutoEnabled(oboolean enabled)
{
    m_autoenabled = enabled;
}

STDMETHODIMP_(ULONG) 
OBindVar::AddRef() 
{ 
	return ++m_refcount; 
} 
 
STDMETHODIMP_(ULONG) 
OBindVar::Release() 
{ 
	if (--m_refcount == 0) 
	  { 
	    delete this; 
	    return 0; 
	  } 
 
	return m_refcount; 
} 
 
STDMETHODIMP 
OBindVar::QueryInterface(REFIID iid, void **ppv) 
{
    if (!IsEqualGUID(iid, IID_IUnknown) && !IsEqualGUID(iid, IID_IOraBindVariable)) 
	    return ResultFromScode(E_NOINTERFACE);  // unsupported interface
	
	// caller is asking for us
	*ppv = this; 
	AddRef(); 
 
	return NOERROR; 
} 
 
STDMETHODIMP
OBindVar::GetPersistentPointer(VARIANT **pvVal)
{
    // we're only supporting transient values, so:
	return ResultFromScode(S_FALSE);
}

oresult OBindVar::ContextTellChange(VARIANT *var)
{ 
    HRESULT hr;
	int cookie;
	// cvItem *cvi;
    
    if (!m_context)
        return(OSUCCESS);  // nothing to do
    
    // ask all contexts whether we can change value (via DataChangeRequest)
#ifdef NOTYET
	for( cookie = 0; cookie < m_contexts.length(); cookie++ )
	  {
	    cvi = m_contexts[cookie];

	    if (cvi)
	      {
		_IOraBindContext * iobc = (_IOraBindContext*)cvi->pv;

		hr = iobc->DataChangeRequest(cvi->dw, var);

		if (FAILED(hr))
		    return hr;
	      }
	  }
#endif
    hr = m_context->DataChangeRequest(m_vid, *var);
    if (FAILED(hr))
        return(OFAILURE);
        
#ifdef NOTYET    
    // now tell all contexts that we have changed the value
	for( cookie = 0; cookie < m_contexts.length(); cookie++ )
	  {
	    cvi = m_contexts[cookie];

	    if (cvi)
	      {
		_IOraBindContext * iobc = (_IOraBindContext*)cvi->pv;

		hr = iobc->DataChange(cvi->dw, var);

		if (FAILED(hr))
		    return hr;
	      }
	  }
#endif
    m_context->DataChange(m_vid, *var);
    
    return(OSUCCESS);
}

STDMETHODIMP
OBindVar::SetValue(VARIANT var)
{
	HRESULT hr;
    
    if (!m_parent)
        return(ResultFromScode(DISP_E_BADVARTYPE));  // can't set value

#ifdef NOTYET    
    hr = ContextRequestChange(&var);    
    if (FAILED(hr))
        return(hr);
#endif
    
    // we can change the value.  Do it
    OOLEvar *ov = (OOLEvar *) (m_parent->Internal());
    hr = VariantCopy(ov->GetVariant(), &var);
    ov->HaveSetVariant();

	if (FAILED(hr))
	    return hr;
    
    ContextTellChange(&var);
    
	return NOERROR;
}

STDMETHODIMP
OBindVar::GetValue(VARIANT *pvVal)
{
	if (!pvVal)
	    return ResultFromScode(E_INVALIDARG);
    
    // we're expecting an uninitialized VARIANT.  Initialize it
	VariantInit(pvVal);
    
    // get the value
    if (m_parent)
    { // get the value from the parent's VARIANT
        OOLEvar *ov = (OOLEvar *) (m_parent->Internal());
        return(VariantCopy(pvVal, ov->GetVariant()));
    }
    else
        return NOERROR;  // return VARIANT with empty value
}

STDMETHODIMP_(BSTR)
OBindVar::GetBindIdentifier(void)
{
	if (!m_bindname)
	    return NULL;

#ifdef WRAPPER
    return SysAllocStringA(m_bindname);
#else
	return SysAllocString(m_bindname);
#endif
}

STDMETHODIMP
OBindVar::SetBindIdentifier(BSTR bstr)
{
	if (m_bindname)
	{ // get rid of old bind name
	    OObjectFreeString((char *) m_bindname);
	    m_bindname = 0;
	}
    
    if (bstr)
        m_bindname = OObjectAllocString(bstr);
    
	return NOERROR;
}

STDMETHODIMP
OBindVar::BindToContext(_IOraBindContext *pContext,
		DWORD dwVid, DWORD *pdwCookie)
{
	if (m_bindname && m_inout != 0)
    {
        m_context = pContext;
	    m_vid = dwVid;
	    *pdwCookie = (DWORD) 82;
	      
	    //cvItem cvi(pContext, dwVid);
	    //*pdwCookie = (DWORD) m_contexts.add(cvi);

	    //pContext->AddRef();   /* AddRef() the context */
	  }
	else
	    return ResultFromScode(E_INVALIDARG);

	return NOERROR;
}

STDMETHODIMP
OBindVar::Unbind(DWORD dwCookie)
{
    // context is telling us that it's going away
    if ((int) dwCookie == 82)
        m_context = 0;  // we're not attached
    
	return NOERROR;
}

STDMETHODIMP
OBindVar::IsInputVariable()
{
	return ResultFromScode((m_inout & OPARAMETER_INVAR) ? S_OK : S_FALSE );
}

STDMETHODIMP
OBindVar::IsOutputVariable()
{
	return ResultFromScode((m_inout & OPARAMETER_OUTVAR) ? S_OK : S_FALSE );
}
	
STDMETHODIMP
OBindVar::IsEnabled()
{
    // various things mean that the context won't use us
    BOOL unable = !m_bindname || !m_autoenabled || m_inout == 0;
    
    return(ResultFromScode(unable ? S_FALSE : S_OK));
}

// ------------------  OOLEvar ------------------
// internal class to help with OLE variants (for ODynaset, OValue, OField)

OOLEvar::OOLEvar(void)
{
    m_pmain = &m_mainv;
    m_pconv = &m_convertedv;
    VariantInit(m_pmain);
    VariantInit(m_pconv);
    m_isconv = FALSE;
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
    m_isconv = FALSE;
    
    return(OSUCCESS);
}
                     
oresult OOLEvar::Copy(const OOLEvar &other)
{
    HRESULT hr;
    
    VariantInit(m_pmain);
    VariantInit(m_pconv);
    hr = VariantCopy(m_pmain, (VARIANT *) other.m_pmain);
    if (FAILED(hr))
        return(OFAILURE);
    
    if (other.m_isconv)
    {
        hr = VariantCopy(m_pconv, (VARIANT *) other.m_pconv);
        if (FAILED(hr))
            return(OFAILURE);
        m_isconv = TRUE;
    }
    else
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
        return(FALSE);
    }
    
    return(FALSE);  // shouldn't get here
}
                     
oresult OOLEvar::SetValue(int val)
{
    VariantClear(m_pmain);
    m_isconv = FALSE;
    V_VT(m_pmain) = VT_I2;
	V_I2(m_pmain) = val;
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
    if (!val)
    { // null string - let's make it an empty string
        cp = "";  // DBCS problem - assumption of single byte null
    }
    else
    {
#ifdef  WRAPPER
        cp = SysAllocStringA(val);
#else
       cp = SysAllocString(val);
#endif
        if (!cp)
            return(OFAILURE);  // out of memory
    }
    
    // set value
	V_VT(m_pmain) = VT_BSTR;
	V_BSTR(m_pmain) = cp;
	return(OSUCCESS);
}

oresult OOLEvar::SetValue(VARIANT *val)
{
    m_isconv = FALSE;
    HRESULT hr = VariantCopy(m_pmain, val);
    return(FAILED(hr) ? OFAILURE : OSUCCESS);
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

#ifdef  WRAPPER    
	    HRESULT hr = VariantChangeTypeA(m_pconv, m_pmain, 0, VT_I2);
#else
        HRESULT hr = VariantChangeType(m_pconv, m_pmain, 0, VT_I2);
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
    
#ifdef  WRAPPER    
	    HRESULT hr = VariantChangeTypeA(m_pconv, m_pmain, 0, VT_I4);
#else
        HRESULT hr = VariantChangeType(m_pconv, m_pmain, 0, VT_I4);
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
    
#ifdef  WRAPPER    
	    HRESULT hr = VariantChangeTypeA(m_pconv, m_pmain, 0, VT_R8);
#else
        HRESULT hr = VariantChangeType(m_pconv, m_pmain, 0, VT_R8);
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
    
#ifdef  WRAPPER    
	    HRESULT hr = VariantChangeTypeA(m_pconv, m_pmain, 0, VT_BSTR);
#else
        HRESULT hr = VariantChangeType(m_pconv, m_pmain, 0, VT_BSTR);
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

#ifdef NOMORE
// routines to get values from an unassociated VARIANT (code reuse)
oresult OOLEvar::GetValue(VARIANT *vr, int *val)
{
    // save current state
    char tempisconv = m_isconv;
    VARIANT *tempvar = m_pmain;
    int temptype = m_maintype;
    
    // make our state "use" the foreign VARIANT
    m_isconv = FALSE;
    m_pmain = vr;    
    m_maintype = V_VT(vr);

    oresult ores = GetValue(val);
    
    // restore state
    m_isconv = m_isconv ? FALSE : tempisconv; // if we converted, we don't want new value
    m_pmain = tempvar;
    m_maintype = temptype;
    return(ores);   
}

oresult OOLEvar::GetValue(VARIANT *vr, long *val)
{
    // save current state
    char tempisconv = m_isconv;
    VARIANT *tempvar = m_pmain;
    int temptype = m_maintype;
    
    // make our state "use" the foreign VARIANT
    m_isconv = FALSE;
    m_pmain = vr;
    m_maintype = V_VT(vr);
    
    oresult ores = GetValue(val);
    
    // restore state
    m_isconv = m_isconv ? FALSE : tempisconv; // if we converted, we don't want new value
    m_pmain = tempvar;
    m_maintype = temptype;
    
    return(ores);   
}

oresult OOLEvar::GetValue(VARIANT *vr, double *val)
{
    // save current state
    char tempisconv = m_isconv;
    VARIANT *tempvar = m_pmain;
    int temptype = m_maintype;
    
    // make our state "use" the foreign VARIANT
    m_isconv = FALSE;
    m_pmain = vr;
    m_maintype = V_VT(vr);
    
    oresult ores = GetValue(val);
    
    // restore state
    m_isconv = m_isconv ? FALSE : tempisconv; // if we converted, we don't want new value
    m_pmain = tempvar;
    m_maintype = temptype;
    
    return(ores);   
}

oresult OOLEvar::GetValue(VARIANT *vr, const char **val)
{
    // save current state
    char tempisconv = m_isconv;
    VARIANT *tempvar = m_pmain;
    int temptype = m_maintype;
    
    // make our state "use" the foreign VARIANT
    m_isconv = FALSE;
    m_pmain = vr;
    m_maintype = V_VT(vr);
    
    oresult ores = GetValue(val);
    
    // restore state
    m_isconv = m_isconv ? FALSE : tempisconv; // if we converted, we don't want new value
    m_pmain = tempvar;
    m_maintype = temptype;
    
    return(ores);   
}
#endif // NOMORE

// ------------------  OValue ------------------
/*
    In the Windows/OLE implementation of oraobj the OValue type
    is implemented on top of the VARIANT datatype of OLE (via OOLEvar)
*/

OValue::OValue(void)
{
    m_value = (void *) new OOLEvar;
    m_bind = 0;
}

OValue::OValue(const OValue &other)
{
    m_value = (void *) new OOLEvar;
    m_bind = 0;
    Copy(other);
}

OValue::OValue(int intvalue)
{
    OOLEvar *ov = new OOLEvar;
    m_value = (void *) ov;
    m_bind = 0;
    ov->SetValue(intvalue);
}

OValue::OValue(long longvalue)
{
    OOLEvar *ov = new OOLEvar;
    m_value = (void *) ov;
    m_bind = 0;
    ov->SetValue(longvalue);
}

OValue::OValue(double doublevalue)
{
    OOLEvar *ov = new OOLEvar;
    m_value = (void *) ov;
    m_bind = 0;
    ov->SetValue(doublevalue);
}

OValue::OValue(const char *tval)
{
    OOLEvar *ov = new OOLEvar;
    m_value = (void *) ov;
    m_bind = 0;
    ov->SetValue(tval);
}

OValue::~OValue(void)
{
    Cleanup();
    
    // cleanup doesn't free m_value pointer - so get rid of it
    if (m_value)
    {
        delete m_value;
    }
    
    if (m_bind)
    { // we don't need binding anymore
        Unbind();
    }    
}

OValue &OValue::operator=(const OValue &other)
{
    if (&other == this)
        return(*this);
    
    // clear current value
    ((OOLEvar *) m_value)->Clear();
    
    Copy(other);
    
    return(*this);
}

int OValue::operator==(const OValue &other) const
{
    OOLEvar *ov = (OOLEvar *) m_value;
    OOLEvar *otherov = (OOLEvar *) other.m_value;
    
    return(ov->IsEqual(otherov));
}

int OValue::operator!=(const OValue &other) const
{
    OOLEvar *ov = (OOLEvar *) m_value;
    OOLEvar *otherov = (OOLEvar *) other.m_value;
    
    return(!(ov->IsEqual(otherov)));
}

oresult OValue::Copy(const OValue &other)
{ 
    // we are copying only the other's value
    
    // what is other value
    OOLEvar *otherov = (OOLEvar *) other.m_value;
    
    return(FromLocalType((void *) (otherov->GetVariant())));
}

oresult OValue::Cleanup(void)
{
    // clean out the value (but nothing else)
    VARIANT tempv;
    
    VariantInit(&tempv);
    VariantClear(&tempv);
    return(FromLocalType((void *) &tempv));
}

oresult OValue::Clear(void)
{
    return(Cleanup());
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

// copy local representation (VARIANT in Windows case) to OValue
oresult OValue::FromLocalType(void *localv)
{
    VARIANT *var;
    HRESULT hr;

#ifdef NOTYET    
    if (m_bind)
    { // we have to see whether we can change the value
        var = ((OOLEvar *) m_value)->GetVariant();
        hr = ((OBindVar *) m_bind)->ContextRequestChange((VARIANT *) localv);
        if (FAILED(hr))
            return(OFAILURE);    
    }
#endif
    
    if (((OOLEvar *) m_value)->SetValue((VARIANT *) localv) != OSUCCESS)
        return(OFAILURE);

    if (m_bind)
    { // tell bind contexts that we've changed the value
        oresult ores = ((OBindVar *) m_bind)->ContextTellChange((VARIANT *) localv);
        if (ores != OSUCCESS)
            return(OFAILURE);
    }
    
    return(OSUCCESS);
}

oboolean OValue::IsNull(void) const
{
    return(((OOLEvar *) m_value)->IsNull());
}

OValue::operator long() const
{
    long val;
    ((OOLEvar *) m_value)->GetValue(&val);
    return(val);
}

OValue::operator int() const
{
    int val;
    ((OOLEvar *) m_value)->GetValue(&val);
    return(val);
}

OValue::operator double() const
{
    double val;
    ((OOLEvar *) m_value)->GetValue(&val);
    return(val);
}

OValue::operator const char *() const
{
    const char *val;
    ((OOLEvar *) m_value)->GetValue(&val);
    return(val);
}

oresult OValue::Bind(const ODynaset odyn, const char *bindname, int iotype)
{
    // get _IOraContext from dynaset
	void *tempi;	
	HRESULT hc = ((IDispatch *) odyn.Internal())->QueryInterface(IID_IOraBindContext, &tempi);
	if (FAILED(hc))
    { // couldn't get the interface
        //SetInternalError(OERROR_NO_INTERFACE);
        return(OFAILURE);
    }    
    
    // create binder
    if (m_bind)
        Unbind();  // get rid of old binding
    
    OBindVar *binder = new OBindVar(this, iotype);
    m_bind = (void *) binder; 
    
    // start setting up binder
    binder->SetBindIdentifier((char *) bindname);
    binder->SetAutoEnabled(TRUE);
    
    // tell context about binder
    ((_IOraBindContext *) tempi)->RequestAttach(binder);
    
    return(OSUCCESS);
}

oresult OValue::Unbind(void)
{
    if (m_bind)
    { // we don't need binding anymore
        // tell the binding that we're going away
        ((OBindVar *) m_bind)->Orphan();
        
        // and release our ref on the binding (which will probably make it go away)
        ((OBindVar *) m_bind)->Release();
        m_bind = 0;
    }
    // note that if somebody else has gotten an interface to that binder it will have
    //   no way of getting or setting a value.  But it won't crash.
    
    return(OSUCCESS);    
}

oresult OValue::BindEnable(oboolean enable)
{
    if (m_bind)
        ((OBindVar *) m_bind)->SetAutoEnabled(enable);
    
    return(OSUCCESS);   
}

oboolean OValue::IsBound(void) const
{
    return(m_bind ? TRUE : FALSE);
}

void *OValue::Internal(void) const
{
    return(m_value);
}

