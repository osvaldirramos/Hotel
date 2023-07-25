//+--------------------------------------------------------------------------
//
//  Copyright (C) 1994, Microsoft Corporation.  All Rights Reserved.
//
//  File:       convert.cpp
//
//  Contents:   ANSI/UNICODE Internal convertion routines.
//
//  History:    01-Nov-93   v-kentc     Created.
//				07-Oct-94	deanm		removed C-runtime dependencies
//				16-Oct-94	deanm		fixed SNB conversion
//
//---------------------------------------------------------------------------

#define _DEBUG_HOOKS
#ifdef  OLE2ANSI
#undef  OLE2ANSI
#endif

#ifndef ORACL_ORACLE
#include "oracl.h"
#endif

#include <dispatch.h>

#ifndef ORAOBJI_ORACLE
#include "oraobji.h"
#endif

#define ConvertStringFree(x) CoTaskMemFree(x)
#define ConvertDVTARGETDEVICEFree(x) CoTaskMemFree(x)


HRESULT ConvertStringToW(LPWSTR *);
HRESULT ConvertStringToW(LPCSTR, LPWSTR *);
VOID    ConvertStringToW(LPCSTR, LPWSTR);
HRESULT ConvertStringToW(LPCSTR, LCID, LPWSTR *);
HRESULT ConvertStringToA(LPSTR *);
VOID    ConvertStringToA(LPCWSTR, LPSTR);
HRESULT ConvertStringToA(LPCWSTR, LPSTR *);
HRESULT ConvertStringArrayToA(LPSTR *, ULONG);
HRESULT ConvertStringArrayToW(LPWSTR *, ULONG);
HRESULT ConvertStringArrayToA(LPWSTR *, LPSTR * *, ULONG);
HRESULT ConvertStringArrayToW(LPSTR *, LPWSTR * *, ULONG);
HRESULT ConvertStringArrayToW(LPSTR *, LCID, LPWSTR * *, ULONG);

HRESULT ConvertStringAlloc(ULONG, LPVOID *);
VOID    ConvertStringArrayFree(LPSTR *, ULONG);


HRESULT ConvertDispStringToW(LPBSTR);
HRESULT ConvertDispStringToW(BSTRA, LPBSTR);
HRESULT ConvertDispStringToW(BSTRA, LCID, LPBSTR);
HRESULT ConvertDispStringToA(LPBSTRA);
HRESULT ConvertDispStringToA(BSTR, LPBSTRA);
HRESULT ConvertDispStringArrayToA(LPBSTRA, ULONG);
HRESULT ConvertDispStringArrayToW(LPBSTR, ULONG);

HRESULT ConvertDispStringAlloc(ULONG, LPBSTR);
#define ConvertDispStringFreeA  SysFreeStringA
#define ConvertDispStringFreeW  SysFreeString
VOID ConvertDispStringArrayFree(BSTRA * ptr, ULONG ulSize);

inline VOID ConvertStringArrayFree(LPWSTR * ptr, ULONG ulSize)
	{ ConvertStringArrayFree((LPSTR*)ptr, ulSize); }



/* cheap atoi -- define here to avoid use of C-runtime version
int __cdecl atoi(const char * psz)
{
	register int i = 0;
	for (; *psz >= '0' && *psz <= '9'; ++psz)
		i = (i * 10) + (*psz - '0');
	return i;
}
*/
//+--------------------------------------------------------------------------
//
//  Routine:    ConvertStringToW
//
//  Synopsis:
//
//  Returns:    HRESULT Error code.
//
//---------------------------------------------------------------------------
HRESULT ConvertStringToW(LPWSTR * ppStrW)
{
	// If input is null then just return.
	if (*ppStrW == NULL)
		return ResultFromScode(S_OK);

	LPSTR pStrA = (LPSTR)*ppStrW;

	ULONG Count = lstrlen(pStrA) + 1;
	HRESULT hResult = ConvertStringAlloc(Count * sizeof(WCHAR), (LPVOID *)ppStrW);
	if (FAILED(hResult))
		return (hResult);

	MultiByteToWideChar(CP_ACP, 0, pStrA, Count, *ppStrW, Count);
	ConvertStringFree(pStrA);

	return NOERROR;
}

//+--------------------------------------------------------------------------
//
//  Routine:    ConvertStringToW
//
//  Synopsis:
//
//  Returns:    HRESULT Error code.
//
//---------------------------------------------------------------------------
VOID ConvertStringToW(LPCSTR pStrA, LPWSTR pStrW)
{
	//Assert(pStrA != NULL);

	ULONG Count = lstrlen(pStrA) + 1;
	MultiByteToWideChar(CP_ACP, 0, pStrA, Count, pStrW, Count);
}

//+--------------------------------------------------------------------------
//
//  Routine:    ConvertStringToW
//
//  Synopsis:
//
//  Returns:    HRESULT Error code.
//
//---------------------------------------------------------------------------
HRESULT ConvertStringToW(LPCSTR pStrA, LPWSTR * ppStrW)
{
	// If input is null then just return the same.
	if (pStrA == NULL)
	{
		*ppStrW = NULL;
		return ResultFromScode(S_OK);
	}

	ULONG Count = lstrlen(pStrA) + 1;
	HRESULT hResult = ConvertStringAlloc(Count * sizeof(WCHAR), (LPVOID *)ppStrW);
	if (FAILED(hResult))
		return (hResult);

	MultiByteToWideChar(CP_ACP, 0, pStrA, Count, *ppStrW, Count);

	return NOERROR;
}

//+--------------------------------------------------------------------------
//
//  Routine:    ConvertStringToW
//
//  Synopsis:
//
//  Returns:    HRESULT Error code.
//
//---------------------------------------------------------------------------
HRESULT ConvertStringToW(LPCSTR pStrA, LCID lcid, LPWSTR * ppStrW)
{
	static LCID lcidCache = (LCID)~0;
	static UINT cpCache;
	char  szCodePage[16];    	// string of LCID code page number.
	UINT  cpLCID;               // Integer value of LCID code page.

	// If input is null then just return the same.
	if (pStrA == NULL)
	{
		*ppStrW = NULL;
		return ResultFromScode(S_OK);
	}

	ULONG Count = lstrlen(pStrA) + 1;
	HRESULT hResult = ConvertStringAlloc(Count * sizeof(WCHAR), (LPVOID *)ppStrW);
	if (FAILED(hResult))
		return (hResult);

	//
	//  Due to the slowness of GetLocaleInfoA(), cache the code page.
	//
	if (lcidCache != lcid)
	{
		GetLocaleInfoA(lcid, LOCALE_IDEFAULTANSICODEPAGE,
			szCodePage, sizeof(szCodePage));
		cpLCID = atoi(szCodePage);

		// Code pages are non-zero values.
//		Assert(cpLCID);

		lcidCache = lcid;
		cpCache   = cpLCID;
	}
	else
		cpLCID = cpCache;

	MultiByteToWideChar(cpLCID, 0, pStrA, Count, *ppStrW, Count);

	return NOERROR;
}

//+--------------------------------------------------------------------------
//
//  Routine:    ConvertStringToA
//
//  Synopsis:
//
//  Returns:    HRESULT Error code.
//
//---------------------------------------------------------------------------
HRESULT ConvertStringToA(LPSTR * ppStrA)
{
	// If input is null then just return.
	if (*ppStrA == NULL)
		return ResultFromScode(S_OK);

	LPWSTR pStrW = (LPWSTR)*ppStrA;

	HRESULT hResult = ConvertStringToA(pStrW, ppStrA);
	if (FAILED(hResult))
		return (hResult);

	ConvertStringFree(pStrW);

	return (NOERROR);
}

//+--------------------------------------------------------------------------
//
//  Routine:    ConvertStringToA
//
//  Synopsis:
//
//  Returns:    HRESULT Error code.
//
//---------------------------------------------------------------------------
VOID ConvertStringToA(LPCWSTR pStrW, LPSTR pStrA)
{
//	Assert(pStrW != NULL);

/*	ULONG Count = wcslen(pStrW);
	WideCharToMultiByte(CP_ACP, 0, pStrW, Count+1, pStrA, Count*2+1, NULL, NULL);*/
	ULONG Count = WideCharToMultiByte(CP_ACP, 0, pStrW, -1, NULL, 0, NULL, NULL);
	WideCharToMultiByte(CP_ACP, 0, pStrW, -1, pStrA, Count+1, NULL, NULL);

}

//+--------------------------------------------------------------------------
//
//  Routine:    ConvertStringToA
//
//  Synopsis:
//
//  Returns:    HRESULT Error code.
//
//---------------------------------------------------------------------------
HRESULT ConvertStringToA(LPCWSTR pStrW, LPSTR * ppStrA)
{
	// If input is null then just return the same.
	if (pStrW == NULL)
	{
		*ppStrA = NULL;
		return ResultFromScode(S_OK);
	}

	ULONG Count = WideCharToMultiByte(CP_ACP, 0, pStrW, -1, NULL, 0, NULL, NULL);
	HRESULT hResult = ConvertStringAlloc(Count, (LPVOID *)ppStrA);
	if (FAILED(hResult))
		return (hResult);

	WideCharToMultiByte(CP_ACP, 0, pStrW, -1, *ppStrA, Count, NULL, NULL);
	return NOERROR;
}

//+--------------------------------------------------------------------------
//
//  Routine:    ConvertStringArrayToA
//
//  Synopsis:
//
//  Returns:    HRESULT Error code.
//
//---------------------------------------------------------------------------
HRESULT ConvertStringArrayToA(LPSTR * ppstr, ULONG ulSize)
{
	for (ULONG i = 0; i < ulSize; i++)
	{
		HRESULT hResult = ConvertStringToA(ppstr);
		if (FAILED(hResult))
			return (hResult);

		ppstr++;
	}
	return NOERROR;
}

//+--------------------------------------------------------------------------
//
//  Routine:    ConvertStringArrayToW
//
//  Synopsis:
//
//  Returns:    HRESULT Error code.
//
//---------------------------------------------------------------------------
HRESULT ConvertStringArrayToW(LPWSTR * ppstr, ULONG ulSize)
{
	for (ULONG i = 0; i < ulSize; i++)
	{
		HRESULT hResult = ConvertStringToW(ppstr);
		if (FAILED(hResult))
			return (hResult);

		ppstr++;
	}

	return NOERROR;
}

//+--------------------------------------------------------------------------
//
//  Routine:    ConvertStringArrayToA
//
//  Synopsis:
//
//  Returns:    HRESULT Error code.
//
//---------------------------------------------------------------------------
HRESULT ConvertStringArrayToA(LPWSTR * ppstr, LPSTR** pppstrA, ULONG ulSize)
{
	ULONG i;
	HRESULT hResult;


	hResult = NOERROR;

	*pppstrA = (LPSTR*)CoTaskMemAlloc(ulSize*sizeof(LPSTR));

	for (i = 0; i < ulSize; i++)
		(*pppstrA)[i] = NULL;

	for (i = 0; i < ulSize; i++)
	{
		hResult = ConvertStringToA(ppstr[i], &((*pppstrA)[i]));
		if (FAILED(hResult))
		{
			ConvertStringArrayFree(*pppstrA, ulSize);
			break;
		}
	}

	return hResult;
}

//+--------------------------------------------------------------------------
//
//  Routine:    ConvertStringArrayToW
//
//  Synopsis:
//
//  Returns:    HRESULT Error code.
//
//---------------------------------------------------------------------------
HRESULT ConvertStringArrayToW(LPSTR * ppstrA, LPWSTR** pppstr, ULONG ulSize)
{
	ULONG i;
	HRESULT hResult;


	hResult = NOERROR;

	*pppstr = (LPWSTR*)CoTaskMemAlloc(ulSize*sizeof(LPWSTR));

	for (i = 0; i < ulSize; i++)
		(*pppstr)[i] = NULL;

	for (i = 0; i < ulSize; i++)
	{
		hResult = ConvertStringToW(ppstrA[i], &((*pppstr)[i]));
		if (FAILED(hResult))
		{
			ConvertStringArrayFree(*pppstr, ulSize);
			break;
		}
	}

	return hResult;
}

//+--------------------------------------------------------------------------
//
//  Routine:    ConvertStringArrayToW
//
//  Synopsis:
//
//  Returns:    HRESULT Error code.
//
//---------------------------------------------------------------------------
HRESULT ConvertStringArrayToW(LPSTR * ppstrA, LCID lcid, LPWSTR** pppstr, ULONG ulSize)
{
	ULONG i;
	HRESULT hResult;


	hResult = NOERROR;

	*pppstr = (LPWSTR*)CoTaskMemAlloc(ulSize*sizeof(LPWSTR));

	for (i = 0; i < ulSize; i++)
		(*pppstr)[i] = NULL;

	for (i = 0; i < ulSize; i++)
	{
		hResult = ConvertStringToW(ppstrA[i], lcid, &((*pppstr)[i]));
		if (FAILED(hResult))
		{
			ConvertStringArrayFree(*pppstr, ulSize);
			break;
		}
	}

	return hResult;
}

//+--------------------------------------------------------------------------
//
//  Routine:    ConvertStringAlloc
//
//  Synopsis:
//
//  Returns:    HRESULT Error code.
//
//---------------------------------------------------------------------------
HRESULT ConvertStringAlloc(ULONG ulSize, LPVOID * pptr)
{
	*pptr = CoTaskMemAlloc(ulSize);
	if (*pptr == NULL)
		return ResultFromScode(E_OUTOFMEMORY);

	return NOERROR;
}

//+--------------------------------------------------------------------------
//
//  Routine:    ConvertStringArrayFree
//
//  Synopsis:
//
//  Returns:    HRESULT Error code.
//
//---------------------------------------------------------------------------
VOID ConvertStringArrayFree(LPSTR * ptr, ULONG ulSize)
{
	while (ulSize)
		ConvertStringFree(ptr[--ulSize]);

	CoTaskMemFree(ptr);
}


//+--------------------------------------------------------------------------
//
//  Routine:    ConvertVariantToA
//
//  Synopsis:
//
//  Returns:    None.
//
//---------------------------------------------------------------------------
HRESULT ConvertVariantToA(LPVARIANTA pVariantA)
{

	HRESULT hResult = NOERROR;
	VARTYPE vt;

	if (pVariantA == NULL)
		return NOERROR;

	vt = V_VT(pVariantA);

	{   // not an array
		switch (vt)
		{
		case VT_BSTR:
			hResult = ConvertDispStringToA(&pVariantA->bstrVal);
			break;

		case VT_BYREF|VT_BSTR:
			// can't convert to a byref BSTR, so must convert to a byval BSTR
			BSTRA bstrTmp;
			hResult = ConvertDispStringToA((BSTR)*pVariantA->bstrVal, &bstrTmp);
			if (hResult == NOERROR)
			{
				V_VT(pVariantA) = VT_BSTR;      // no longer byref
				pVariantA->bstrVal = bstrTmp;
			}
			break;

		
		default:
			break;
		}
	}
	return hResult;
}

//+--------------------------------------------------------------------------
//
//  Routine:    ConvertVariantToW
//
//  Synopsis:
//
//  Returns:    None.
//
//---------------------------------------------------------------------------
HRESULT ConvertVariantToW(LPVARIANT pVariant)
{
	HRESULT hResult = NOERROR;
	VARTYPE vt;


	if (pVariant == NULL)
		return NOERROR;

	vt = V_VT(pVariant);

	{   // not an array
		switch (vt)
		{
		case VT_BSTR:
			hResult = ConvertDispStringToW(&pVariant->bstrVal);
			break;

		case VT_BYREF|VT_BSTR:
			// can't convert to a byref BSTR, so must convert to a byval BSTR
			BSTR bstrTmp;
			hResult = ConvertDispStringToW((BSTRA)*pVariant->pbstrVal, &bstrTmp);
			if (hResult == NOERROR)
			{
				V_VT(pVariant) = VT_BSTR;       // no longer byref
				pVariant->bstrVal = bstrTmp;
			}
			break;

	
		default:
			break;
		}
	}
	return hResult;
}


//+--------------------------------------------------------------------------
//
//  Routine:    ConvertDispStringToW
//
//  Synopsis:
//
//  Returns:    HRESULT Error code.
//
//---------------------------------------------------------------------------
HRESULT ConvertDispStringToW(LPBSTR ppStrW)
{
	// If input is null then just return.
	if (*ppStrW == NULL)
		return NOERROR;

	BSTRA pStrA = (BSTRA)*ppStrW;
	HRESULT hResult = ConvertDispStringToW(pStrA, ppStrW);
	if (FAILED(hResult))
		return (hResult);

	SysFreeStringA(pStrA);

	return NOERROR;
}

//+--------------------------------------------------------------------------
//
//  Routine:    ConvertDispStringToW
//
//  Synopsis:
//
//  Returns:    HRESULT Error code.
//
//---------------------------------------------------------------------------
HRESULT ConvertDispStringToW(BSTRA bstrA, BSTR * ppStrW)
{
	// If input is null then just return the same.
	if (bstrA == NULL)
	{
		*ppStrW = NULL;
		return NOERROR;
	}

	ULONG CountA = SysStringByteLen((BSTR)bstrA);
	ULONG CountW = MultiByteToWideChar(CP_ACP, 0, bstrA, CountA, NULL, 0);
	HRESULT hResult = ConvertDispStringAlloc(CountW*sizeof(WCHAR), ppStrW);
	if (FAILED(hResult))
		return (hResult);

	MultiByteToWideChar(CP_ACP, 0, bstrA, CountA, *ppStrW, CountW);

	return NOERROR;
}

//+--------------------------------------------------------------------------
//
//  Routine:    ConvertDispStringToW
//
//  Synopsis:
//
//  Returns:    HRESULT Error code.
//
//---------------------------------------------------------------------------
HRESULT ConvertDispStringToW(BSTRA bstrA, LCID lcid, LPBSTR ppStrW)
{
	static LCID lcidCache = (LCID)~0;
	static UINT cpCache;
	char szCodePage[16];        // string of LCID code page number.
	UINT  cpLCID;               // Integer value of LCID code page.

	// If input is null then just return the same.
	if (bstrA == NULL)
	{
		*ppStrW = NULL;
		return NOERROR;
	}

	ULONG CountA = SysStringByteLen((BSTR)bstrA);
	ULONG CountW = MultiByteToWideChar(CP_ACP, 0, bstrA, CountA, NULL, 0);
	HRESULT hResult = ConvertDispStringAlloc(CountW*sizeof(WCHAR), ppStrW);
	if (FAILED(hResult))
		return (hResult);

	//
	//  Due to the slowness of GetLocaleInfoA(), cache the code page.
	//
	if (lcidCache != lcid)
	{
		GetLocaleInfoA(lcid, LOCALE_IDEFAULTANSICODEPAGE,
			szCodePage, sizeof(szCodePage));
		cpLCID = atoi(szCodePage);

		// Code pages are non-zero values.
	//	Assert(cpLCID);

		lcidCache = lcid;
		cpCache   = cpLCID;
	}
	else
		cpLCID = cpCache;

	MultiByteToWideChar(cpLCID, 0, bstrA, CountA, *ppStrW, CountW);

	return NOERROR;
}

//+--------------------------------------------------------------------------
//
//  Routine:    ConvertDispStringToA
//
//  Synopsis:
//
//  Returns:    HRESULT Error code.
//
//---------------------------------------------------------------------------
HRESULT ConvertDispStringToA(LPBSTRA ppStrA)
{
	// If input is null then just return.
	if (*ppStrA == NULL)
		return NOERROR;

	BSTR pStrW = (BSTR)*ppStrA;
	HRESULT hResult = ConvertDispStringToA(pStrW, ppStrA);
	if (FAILED(hResult))
		return (hResult);
	SysFreeString(pStrW);

	return NOERROR;
}

//+--------------------------------------------------------------------------
//
//  Routine:    ConvertDispStringToA
//
//  Synopsis:
//
//  Returns:    HRESULT Error code.
//
//---------------------------------------------------------------------------
HRESULT ConvertDispStringToA(BSTR pStrW, LPBSTRA ppStrA)
{
	// If input is null then just return the same.
	if (pStrW == NULL)
	{
		*ppStrA = NULL;
		return NOERROR;
	}

	ULONG CountW = SysStringLen(pStrW);
	ULONG CountA = WideCharToMultiByte(CP_ACP, 0, pStrW, CountW, NULL, 0, NULL, NULL);
	HRESULT hResult = ConvertDispStringAlloc(CountA, (LPBSTR)ppStrA);
	if (FAILED(hResult))
		return (hResult);

	WideCharToMultiByte(CP_ACP, 0, pStrW, CountW, *ppStrA, CountA, NULL, NULL);

	return NOERROR;
}

//+--------------------------------------------------------------------------
//
//  Routine:    ConvertDispStringArrayToA
//
//  Synopsis:
//
//  Returns:    HRESULT Error code.
//
//---------------------------------------------------------------------------
HRESULT ConvertDispStringArrayToA(LPBSTRA ppstr, ULONG ulSize)
{
	for (ULONG i = 0; i < ulSize; i++)
	{
		HRESULT hResult = ConvertDispStringToA(ppstr);
		if (FAILED(hResult))
			return (hResult);

		ppstr++;
	}

	return NOERROR;
}

//+--------------------------------------------------------------------------
//
//  Routine:    ConvertDispStringArrayToW
//
//  Synopsis:
//
//  Returns:    HRESULT Error code.
//
//---------------------------------------------------------------------------
HRESULT ConvertDispStringArrayToW(LPBSTR ppstr, ULONG ulSize)
{
	for (ULONG i = 0; i < ulSize; i++)
	{
		HRESULT hResult = ConvertDispStringToW(ppstr);
		if (FAILED(hResult))
			return (hResult);

		ppstr++;
	}

	return NOERROR;
}

//+--------------------------------------------------------------------------
//
//  Routine:    ConvertDispStringArrayToA
//
//  Synopsis:
//
//  Returns:    HRESULT Error code.
//
//---------------------------------------------------------------------------
HRESULT ConvertDispStringArrayToA(LPBSTR ppstr, LPBSTRA ppstrA, ULONG ulSize)
{
	ULONG i;
	HRESULT hResult;


	hResult = NOERROR;

	for (i = 0; i < ulSize; i++)
		ppstrA[i] = NULL;

	for (i = 0; i < ulSize; i++)
	{
		hResult = ConvertDispStringToA(ppstr[i], &ppstrA[i]);
		if (FAILED(hResult))
		{
			ConvertDispStringArrayFree(ppstrA, ulSize);
			break;
		}
	}

	return hResult;
}

//+--------------------------------------------------------------------------
//
//  Routine:    ConvertDispStringArrayToW
//
//  Synopsis:
//
//  Returns:    HRESULT Error code.
//
//---------------------------------------------------------------------------
HRESULT ConvertDispStringArrayToW(LPBSTRA ppstrA, LPBSTR ppstr, ULONG ulSize)
{
	ULONG i;
	HRESULT hResult;


	hResult = NOERROR;

	for (i = 0; i < ulSize; i++)
		ppstr[i] = NULL;

	for (i = 0; i < ulSize; i++)
	{
		hResult = ConvertDispStringToW(ppstrA[i], &ppstr[i]);
		if (FAILED(hResult))
		{
			ConvertDispStringArrayFree((char **)ppstr, ulSize);
			break;
		}
	}

	return hResult;
}

//+--------------------------------------------------------------------------
//
//  Routine:    ConvertDispStringArrayToW
//
//  Synopsis:
//
//  Returns:    HRESULT Error code.
//
//---------------------------------------------------------------------------
HRESULT ConvertDispStringArrayToW(LPBSTRA ppstrA, LCID lcid, LPBSTR ppstr, ULONG ulSize)
{
	ULONG i;
	HRESULT hResult;


	hResult = NOERROR;

	for (i = 0; i < ulSize; i++)
		ppstr[i] = NULL;

	for (i = 0; i < ulSize; i++)
	{
		hResult = ConvertDispStringToW(ppstrA[i], lcid, &ppstr[i]);
		if (FAILED(hResult))
		{
			ConvertDispStringArrayFree((char **)ppstr, ulSize);
			break;
		}
	}

	return hResult;
}

//+--------------------------------------------------------------------------
//
//  Routine:    ConvertDispStringAlloc
//
//  Synopsis:
//
//  Returns:    HRESULT Error code.
//
//---------------------------------------------------------------------------
HRESULT ConvertDispStringAlloc(ULONG ulSize, LPBSTR pptr)
{
	*pptr = SysAllocStringByteLen(NULL, ulSize);
	if (*pptr == NULL)
		return ResultFromScode(E_OUTOFMEMORY);

	return NOERROR;
}

//+--------------------------------------------------------------------------
//
//  Routine:    ConvertDispStringArrayFree
//
//  Synopsis:
//
//  Returns:    HRESULT Error code.
//
//---------------------------------------------------------------------------
VOID ConvertDispStringArrayFree(BSTRA * ptr, ULONG ulSize)
{
	while (ulSize--)
		ConvertDispStringFreeA(*ptr++);
}

//+--------------------------------------------------------------------------
//
//  Routine:    ConvertDispStringArrayFree
//
//  Synopsis:
//
//  Returns:    HRESULT Error code.
//
//---------------------------------------------------------------------------
VOID ConvertDispStringArrayFree(BSTR * ptr, ULONG ulSize)
{
	while (ulSize--)
		ConvertDispStringFreeW(*ptr++);
}

void DebugAssert(PCSTR pText, PCSTR pFile, UINT uLineNo)
{
}

extern "C" int __cdecl _fltused = 1; // avoid dragging in C-runtime

/*---------------------------------------------------------------------*/
/*                         ANSI BSTR API                               */
/*---------------------------------------------------------------------*/

STDAPI_(BSTRA) SysAllocStringA(const char * psz)
{

	if (psz == NULL)
		return NULL;

	return (BSTRA)SysAllocStringByteLen(psz, lstrlen(psz));
}

STDAPI_(int) SysReAllocStringA(BSTRA * pbstr, const char * psz)
{

	return SysReAllocStringLenA(pbstr, psz, (psz ? lstrlen(psz) : 0));
}

STDAPI_(int) SysReAllocStringLenA(BSTRA * pbstr, const char * psz, unsigned int len)
{

	BSTRA bstrNew = (BSTRA) SysAllocStringLenA(psz, len);
	if (bstrNew == NULL)
		return FALSE;

	SysFreeString((BSTR) *pbstr);
	*pbstr = bstrNew;

	return TRUE;
}

/*---------------------------------------------------------------------*/
/*                         ANSI VARIANT API                            */
/*---------------------------------------------------------------------*/

STDAPI VariantChangeTypeA(
	VARIANTARGA * pvargDestA,
	VARIANTARGA * pvargSrcA,
	unsigned short wFlags,
	VARTYPE vt)
{
	

	HRESULT hResult;
	VARIANT varTempW;

	// CONSIDER: optimize this for the case of simple Variants (src, dest,
	// CONSIDER: and vt all non-string, non-array, non-object variants)
	VariantInit(&varTempW);
	hResult = VariantCopy((VARIANT *) &varTempW, (VARIANTARG *) pvargSrcA);
	if (hResult == NOERROR)
	{
		hResult = ConvertVariantToW(&varTempW);
		if (hResult == NOERROR)
		{
		  hResult = VariantChangeType(&varTempW, &varTempW, wFlags, vt);
			if (hResult == NOERROR)
			{
				hResult = ConvertVariantToA((VARIANTA *)&varTempW);
				if (hResult == NOERROR)
					hResult = VariantCopy((VARIANT *)pvargDestA, &varTempW);
			}
		}
	}

	VariantClear(&varTempW);
	return hResult;
}

STDAPI VariantChangeTypeExA(
	VARIANTARGA * pvargDestA,
	VARIANTARGA * pvargSrcA,
	LCID lcid,
	unsigned short wFlags,
	VARTYPE vt)
{

	HRESULT hResult;
	VARIANT varTempW;

	// CONSIDER: optimize this for the case of simple Variants (src, dest,
	// CONSIDER: and vt all non-string, non-array, non-object variants)
	VariantInit(&varTempW);
	hResult = VariantCopy((VARIANT *) &varTempW, (VARIANTARG *) pvargSrcA);
	if (hResult == NOERROR)
	{
		hResult = ConvertVariantToW(&varTempW);
		if (hResult == NOERROR)
		{
			hResult = VariantChangeTypeEx(&varTempW, &varTempW, lcid, wFlags, vt);
			if (hResult == NOERROR)
			{
				hResult = ConvertVariantToA((VARIANTA *)&varTempW);
				if (hResult == NOERROR)
					hResult = VariantCopy((VARIANT *)pvargDestA, &varTempW);
			}
		}
	}

	VariantClear(&varTempW);
	return hResult;
}

