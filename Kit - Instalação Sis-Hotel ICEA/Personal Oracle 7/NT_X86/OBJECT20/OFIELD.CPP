/* Copyright (c) Oracle Corporation 1994.  All Rights Reserved */

/*
    This source code is provided as a debugging aid for developers
    who have purchased Oracle Objects for OLE    .  Please see the
    online help for documentation of these classes.
*/

/*
    Oracle Objects for OLE     C++ Classes

    This file implements the OField class
                           
    CREATED    ********   11/22/94
    RWOOLARD	MODIFIED	03/20/95
    			bug#	262209  SetValue(NULL) causes GPF (in OValue)
						263418	GetFieldValue does not work with dates (in ODynaset)
						271184	SetValue succeeds when not in edit mode
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

/*
    Note that the C++ implementation of the field object does not use the _IOraField interface.
    It simply uses the _IOraDynaset
*/

static const IID IID_IOraDynaset =
{0xf0051a80, 0x00b3, 0x101b, { 0xad, 0xf2, 0x04, 0x02, 0x1c, 0x00, 0x70, 0x02 } };

// ----- OField -----------------------------------------------

OField::OField(void)
{
    m_name = 0; // don't know name yet
    m_data = 0; 
    m_index = 0;
} 

OField::OField(const OField &other)
{
    m_name = 0;
    m_data = 0;
    m_index = 0;
    Copy(other);
}
 
OField::~OField(void)
{
    Cleanup();
}

oresult OField::Copy(const OField &other)
{
    m_name = 0;
    m_data = 0;
    
    m_index = other.m_index;
    
    return(OOracleObject::Copy(other));
}

oresult OField::Close(void)
{
    return(Cleanup());
}

oresult OField::Cleanup(void)
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

// overloaded assignment operator
OField &OField::operator=(const OField &other)
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

ODynaset OField::GetDynaset(void) const
{
    ODynaset odyn;
    
    if (ActionGetStart(&odyn) != OSUCCESS)
        return(odyn); // returning unopened object - indicates error
    
    // we just reopen the dynaset
    ((IDispatch *) Internal())->AddRef(); // since we're adding another reference to it
    
    odyn.OpenHelper(Internal(), Internal());
    
    return(odyn);
}

short OField::GetServerType(void) const
{
    if (ActionStart() != OSUCCESS)
        return(0); // indicates error
    
    return (short) (((_IOraDynaset *) (Internal()))->_getFieldServerType(m_index));
}


short OField::GetPrecision(void) const
{
    if (ActionStart() != OSUCCESS)
        return(0);
    
    return (short) (((_IOraDynaset *) (Internal()))->_getFieldPrecision(m_index));
}


short OField::GetScale(void) const
{
    if (ActionStart() != OSUCCESS)
        return(0);
    
    return (short) (((_IOraDynaset *) (Internal()))->_getFieldScale(m_index));
}

oboolean OField::IsTruncated(void) const
{
    if (ActionStart() != OSUCCESS)
        return(FALSE);
    
    int ftype = GetServerType();
    if (ftype != OTYPE_LONG && ftype != OTYPE_LONGRAW)
    { // this field isn't a long
        SetInternalError(OERROR_BADARG);
        return(FALSE);
    }
    
    int istrunc = ((_IOraDynaset *) (Internal()))->_isFieldTruncated(m_index);
    return(istrunc ? TRUE : FALSE);  
}

oboolean OField::IsNullOK(void) const
{
    if (ActionStart() != OSUCCESS)
        return(FALSE);
    
    int isok = ((_IOraDynaset *) (Internal()))->_isFieldNullOK(m_index);
    return(isok ? TRUE : FALSE);
}

long OField::GetSize(void) const
{
    if (ActionStart() != OSUCCESS)
        return(0);
    
    return(((_IOraDynaset *) Internal())->_getFieldSize(m_index));
}

long OField::GetServerSize(void) const
{
    if (ActionStart() != OSUCCESS)
        return(0);
    
	 return(((_IOraDynaset *) Internal())->_getFieldDataSize(m_index));
}

oboolean OField::IsUpdatable(void) const
{
	return(((_IOraDynaset *) Internal())->_isFieldUpdatable(m_index) ? TRUE : FALSE);
}

oresult OField::SetUpdatable(oboolean upd)
{
	((_IOraDynaset *) Internal())->_setFieldUpdatable(m_index, upd);
	return((OERROR_NONE == ErrorNumber()) ? OSUCCESS : OFAILURE);
}

const char *OField::GetName(void) const
{
    if (ActionStart() != OSUCCESS)
        return(NULL);
    
    if (!m_name)
    {
        char *cp = ((_IOraDynaset *) Internal())->_getFieldName(m_index);
        /*
            we want to change the state of this const field by changing
            the value of m_name.  Note that we're not really changing the
            field, we're only changing what we know about the field
        */
        OField *fp = (OField *) this;
#ifdef  WIN32
        fp->m_name = SysAllocStringA(cp);
#else
		 fp->m_name =  cp;
#endif
    }
    
    return(m_name);
}

oresult OField::GetValue(OValue *val) const
{
	if (! val)
	{
        SetInternalError(OERROR_BADARG);
        return(OFAILURE);
    }
		
    if (ActionStart() != OSUCCESS)
    {
	    val->Clear(); // set value to NULL
        return(OFAILURE); // error
    }
    
	OOLEvar *vres = (OOLEvar *) val->Internal();
	
	((_IOraDynaset *) Internal())->_getFieldValue(vres->GetVariant(), m_index);
	vres->HaveSetVariant();
	
	 return((OERROR_NONE == ErrorNumber()) ? OSUCCESS : OFAILURE);
}

oresult OField::GetValue(int *val) const
{
	if (! val)
	{
        SetInternalError(OERROR_BADARG);
        return(OFAILURE);
    }
		
    *val = (int) (*this);
    return ((ErrorNumber() == OERROR_NONE) ? OSUCCESS : OFAILURE);
}

oresult OField::GetValue(long *val) const
{
	if (! val)
	{
        SetInternalError(OERROR_BADARG);
        return(OFAILURE);
    }
		
    *val = (long) (*this);
    return ((ErrorNumber() == OERROR_NONE) ? OSUCCESS : OFAILURE);
}

oresult OField::GetValue(double *val) const
{
	if (! val)
	{
        SetInternalError(OERROR_BADARG);
        return(OFAILURE);
    }
		
    *val = (double) (*this);
    return ((ErrorNumber() == OERROR_NONE) ? OSUCCESS : OFAILURE);
}

oresult OField::GetValue(void __huge *longval, long len, long *readlen) const
{ // get a long value
	if (! longval || ! readlen)
	{
        SetInternalError(OERROR_BADARG);
        return(OFAILURE);
    }
		
    // this is going to be heavyweight - so just call dynaset's code
    ODynaset tempdyn = GetDynaset();
    if (!tempdyn.IsOpen())
        return(OFAILURE);  // error set in GetDynaset
    
    return(tempdyn.GetFieldValue(m_index, longval, len, readlen));    
}

oresult OField::GetValue(const char **val) const
{
	if (! val)
	{
        SetInternalError(OERROR_BADARG);
        return(OFAILURE);
    }
		
    *val = (const char *) (*this);
    return ((ErrorNumber() == OERROR_NONE) ? OSUCCESS : OFAILURE);
}

oresult OField::SetValue(const OValue &val)
{
    if (ActionStart() != OSUCCESS)
        return(OFAILURE);
    
    VARIANT *vres = ((OOLEvar *) (val.Internal()))->GetVariant();
    
    // set field value 
//BUG #271184
	HRESULT hr = ((_IOraDynaset *) Internal())->_updateFieldValue(vres, m_index);

    if (OERROR_NONE != ErrorNumber())
    	return OFAILURE;
    else if (FAILED(hr))
    {
        SetInternalError(OERROR_INVRECORD);
        return OFAILURE;
    }
    return OSUCCESS;    
}      

oresult OField::SetValue(int val)
{
    if (ActionStart() != OSUCCESS)
        return(OFAILURE);
    
    // set up VARIANT
    OOLEvar vres;
    vres.SetValue(val);
    
    // set field value
	HRESULT hr = ((_IOraDynaset *) Internal())->_updateFieldValue(vres.GetVariant(), m_index);

    if (OERROR_NONE != ErrorNumber())
    	return OFAILURE;
    else if (FAILED(hr))
    {
        SetInternalError(OERROR_INVRECORD);
        return OFAILURE;
    }
    return OSUCCESS;
}

oresult OField::SetValue(long val)
{
    if (ActionStart() != OSUCCESS)
        return(OFAILURE);
    
    // set up VARIANT
    OOLEvar vres;
    vres.SetValue(val);
    
    // set field value
	HRESULT hr = ((_IOraDynaset *) Internal())->_updateFieldValue(vres.GetVariant(), m_index);

    if (OERROR_NONE != ErrorNumber())
    	return OFAILURE;
    else if (FAILED(hr))
    {
        SetInternalError(OERROR_INVRECORD);
        return OFAILURE;
    }
    return OSUCCESS;    
}

oresult OField::SetValue(double val)
{
    if (ActionStart() != OSUCCESS)
        return(OFAILURE);
    
    // set up VARIANT
    OOLEvar vres;
    vres.SetValue(val);
    
    // set field value
	HRESULT hr = ((_IOraDynaset *) Internal())->_updateFieldValue(vres.GetVariant(), m_index);

    if (OERROR_NONE != ErrorNumber())
    	return OFAILURE;
    else if (FAILED(hr))
    {
        SetInternalError(OERROR_INVRECORD);
        return OFAILURE;
    }
    return OSUCCESS;    
}

oresult OField::SetValue(const char *val)
{
    if (ActionStart() != OSUCCESS)
        return(OFAILURE);
    
    // set up VARIANT
    OOLEvar vres;
    vres.SetValue(val);
    
    // set field value
	HRESULT hr = ((_IOraDynaset *) Internal())->_updateFieldValue(vres.GetVariant(), m_index);

    if (OERROR_NONE != ErrorNumber())
    	return OFAILURE;
    else if (FAILED(hr))
    {
        SetInternalError(OERROR_INVRECORD);
        return OFAILURE;
    }
    return OSUCCESS;    
}

oresult OField::SetValue(const void __huge *longval, long len)
{ // set a long value
    // this is going to be heavyweight - so just call dynaset's code
    ODynaset tempdyn = GetDynaset();
    if (!tempdyn.IsOpen())
        return(OFAILURE);  // error set in GetDynaset
    
    return(tempdyn.SetFieldValue(m_index, longval, len));    
}

oresult OField::AppendChunk(const char *chunkp, unsigned short numbytes)
{
	if (numbytes < 1)
	{
		SetInternalError (OERROR_BADARG);
		return(OFAILURE);
	}

	int fieldtype = GetServerType ();
	if (fieldtype != OTYPE_LONG && fieldtype != OTYPE_LONGRAW)
	{
		SetInternalError (OERROR_BADTYPE);
		return(OFAILURE);
	}
	
    if (ActionStart() != OSUCCESS)
        return(OFAILURE);
    
	// create a tempbuffer with the data in it
	BSTR tempb = OObjectAllocStringLen((char *) chunkp, numbytes);
	if (!tempb)
	{
	    SetInternalError(OERROR_MEMORY);
	    return(OFAILURE);
	}
	
    HRESULT hc = ((_IOraDynaset *) Internal())->_appendChunk(tempb, m_index);
    if (FAILED(hc))
    { // couldn't get the interface
        SetInternalError(OERROR_NOINTER);
    }
    
    OObjectFreeString(tempb);
    
    return((ErrorNumber() == OERROR_NONE) ? OSUCCESS : OFAILURE);
}

oresult OField::AppendChunk(const void *chunkp, unsigned short numbytes)
{
	if (numbytes < 1)
	{
		SetInternalError (OERROR_BADARG);
		return(OFAILURE);
	}

	int fieldtype = GetServerType ();
	if (fieldtype != OTYPE_LONG && fieldtype != OTYPE_LONGRAW)
	{
		SetInternalError (OERROR_BADTYPE);
		return(OFAILURE);
	}
	
    if (ActionStart() != OSUCCESS)
        return(OFAILURE);
    
    HRESULT hc = ((_IOraDynaset *) Internal())->_appendChunkByte((void*)chunkp, m_index, numbytes);
    if (FAILED(hc))
    { // couldn't get the interface
        SetInternalError(OERROR_NOINTER);
    }
    
    return((ErrorNumber() == OERROR_NONE) ? OSUCCESS : OFAILURE);
}

oresult OField::GetChunk(const char **chunkp, long offset, unsigned short numbytes) const
{
	unsigned short	read;
	return GetChunk (chunkp, offset, numbytes, &read);
}

oresult OField::GetChunk(const void **chunkp, long offset, 
							unsigned short numbytes, unsigned short *bytesread) const
{
	*chunkp = NULL;  // in case of error
	long	read;

	*bytesread = 0;

	if (offset < 0 || numbytes < 1)		// bug, cannot get first byte of chunk
	{
		SetInternalError (OERROR_BADARG);
		return(OFAILURE);
	}
	
	int fieldtype = GetServerType ();
	if (fieldtype != OTYPE_LONG && fieldtype != OTYPE_LONGRAW)
	{
		SetInternalError (OERROR_BADTYPE);
		return(OFAILURE);
	}
    
    if (ActionStart() != OSUCCESS)
		  return(OFAILURE);
    
	// we need a non-const version of "this" to manipulate m_data
	OField *this2p = (OField *) this;
	
    if (m_data)
    {
        OObjectFreeString(this2p->m_data);
        this2p->m_data = 0;
    }
	this2p->m_data = OObjectAllocStringLen((char *) chunkp, numbytes);
	if (! this2p->m_data)
	{
		SetInternalError(OERROR_MEMORY);
		return OFAILURE;
	}
    
	HRESULT hc = ((_IOraDynaset *) Internal())->_getFieldChunkByte(this2p->m_data,
							m_index, offset,numbytes, &read);
    if (FAILED(hc))
    { // couldn't get the interface
		  SetInternalError(OERROR_NOINTER);
    }

    if (ErrorNumber() != OERROR_NONE)
    {
        // free the memory, if any
        OObjectFreeString(this2p->m_data);
        this2p->m_data = 0;
        
        return(OFAILURE);
    }
    else
    { // success
		  *chunkp = m_data;
		  *bytesread = (unsigned short) read;
		  return(OSUCCESS);
    }
}

oresult OField::GetChunk(const char **chunkp, long offset,
			unsigned short numbytes, unsigned short *bytesread) const
{
	*chunkp = NULL;  // in case of error
	long	read;

	*bytesread = 0;

	if (offset < 0 || numbytes < 1)		// bug, cannot get first byte of chunk
	{
		SetInternalError (OERROR_BADARG);
		return(OFAILURE);
	}
	
	int fieldtype = GetServerType ();
	if (fieldtype != OTYPE_LONG && fieldtype != OTYPE_LONGRAW)
	{
		SetInternalError (OERROR_BADTYPE);
		return(OFAILURE);
	}
    
    if (ActionStart() != OSUCCESS)
		  return(OFAILURE);
    
	// we need a non-const version of "this" to manipulate m_data
	OField *this2p = (OField *) this;
	
    if (m_data)
    {
        OObjectFreeString(this2p->m_data);
        this2p->m_data = 0;
    }
    
	 HRESULT hc = ((_IOraDynaset *) Internal())->_getFieldChunk(&(this2p->m_data),
							m_index, offset,numbytes, &read);
    if (FAILED(hc))
    { // couldn't get the interface
		  SetInternalError(OERROR_NOINTER);
    }

    if (ErrorNumber() != OERROR_NONE)
    {
        // free the memory, if any
        OObjectFreeString(this2p->m_data);
        this2p->m_data = 0;
        
        return(OFAILURE);
    }
    else
    { // success
		  *chunkp = m_data;
		  *bytesread = (unsigned short) read;
		  return(OSUCCESS);
    }
}                                           

oresult OField::OpenHelper(void *obji, void *otheri)
{    
    Cleanup();
	if (!obji)
	{ // some error
        SetOtherError(otheri);
        return(OFAILURE);
	}
	
	// obji is the field interface pointer.  We also want the dynaset interface and an index
	
	// get the dynaset & index
	
	IDispatch *idisp = ((_IOraField *) obji)->getDynaset();
	
	void *tempi;
	HRESULT hc = idisp->QueryInterface(IID_IOraDynaset, &tempi);
	idisp->Release();
	if (FAILED(hc))
    { // couldn't get the interface
	    ((IDispatch *) obji)->Release(); // we don't want field interface anymore
        SetInternalError(OERROR_NOINTER);
        return(OFAILURE);
    }
    
	if (SetObjectInterface(tempi) != OSUCCESS)
	{
	    ((IDispatch *) obji)->Release(); // we don't want field interface anymore
	    SetInternalError(OERROR_NOINTER);
	    return(OFAILURE);
	}
	
    // now we have the dynaset - get the field's index
    // we aren't going to keep the name
    char *fname = ((_IOraField *) obji)->get_Name();
    m_index = (short) ((_IOraDynaset *) Internal())->_getFieldIndex(fname);
    OObjectFreeString(fname);
    
    // we're done
	((IDispatch *) obji)->Release(); // we don't want field interface anymore
    	
    return(OSUCCESS);
}

OField::operator int() const
{
    if (ActionStart() != OSUCCESS)
        return(0);
    
	int val;
	OOLEvar vres;
	((_IOraDynaset *) Internal())->_getFieldValue(vres.GetVariant(), m_index);
	vres.HaveSetVariant();
	
	vres.GetValue(&val);
	return(val);
}

OField::operator long() const
{
    if (ActionStart() != OSUCCESS)
        return(0);
    
	long val;
	OOLEvar vres;
	((_IOraDynaset *) Internal())->_getFieldValue(vres.GetVariant(), m_index);
	vres.HaveSetVariant();
	
	vres.GetValue(&val);
	return(val);
}

OField::operator double() const
{
    if (ActionStart() != OSUCCESS)
        return(0.0);
    
	double val;
	OOLEvar vres;
	((_IOraDynaset *) Internal())->_getFieldValue(vres.GetVariant(), m_index);
	vres.HaveSetVariant();
	
	vres.GetValue(&val);
	return(val);
}

OField::operator const char *() const
{
    if (ActionStart() != OSUCCESS)
        return(NULL);
    
	// for memory management we need non-const version of "this"
	OField *of2 = (OField *) this;
	
	if (m_data)
	{
	    OObjectFreeString(m_data);
	    of2->m_data = 0;
	}
	
	OOLEvar vres;
	const char *val;
	((_IOraDynaset *) Internal())->_getFieldValue(vres.GetVariant(), m_index);
	vres.HaveSetVariant();
	// now the string is in a BSTR owned by the VARIANT in vres
	
	vres.GetValue(&val); // get a pointer to the string
	
	// copy it so we don't lose it when vres is destroyed
	of2->m_data = OObjectAllocString((const char *) val);
	return(m_data);
}



