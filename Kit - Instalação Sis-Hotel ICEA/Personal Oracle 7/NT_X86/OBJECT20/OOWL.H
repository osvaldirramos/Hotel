/* Copyright (c) Oracle Corporation 1994.  All Rights Reserved */

/*
    This source code is provided as a debugging aid for developers
    who have purchased Oracle Objects for OLE    .  Please see the
    provided help file for documentation of these classes.

*/

/*
    Oracle Objects for OLE    
    C++ classes for bound Widget support
    MFC version
                           
    CREATED    ********   11/22/94

*/
#ifndef OOWL_ORACLE
#define OOWL_ORACLE

#ifndef	WIN32
#include <owl\owlpch.h>
#endif
#include <owl\edit.h>
#include <owl\static.h>
#include <owl\checkbox.h>
#include <owl\radiobut.h>
#include <owl\slider.h>
#include <owl\gauge.h>

#pragma hdrstop
#ifndef OBOUND_ORACLE
#include "obound.h"
#endif

#define OBOUND_READONLY  TRUE
#define OBOUND_READWRITE FALSE

//-----------------------------
// OBoundEdit: a bound edit control

class OBoundEdit : public TEdit, public OBound
{
// Contruction
public:
	OBoundEdit(TWindow* parent, int Id, const char far* text, int x, int y, 
					 int w, int h, UINT textLen = 0, BOOL multiline = TRUE,
					 TModule* module = 0);
	OBoundEdit(TWindow* parent, int resourceID, UINT textLen = 0,
					 TModule* module = 0);

	// declarations of methods so that compiler won't implement these (which would be wrong)
	// at present we don't implement these either...
	OBoundEdit(const OBoundEdit &other);  // copy constructor
	OBoundEdit &operator=(const OBoundEdit &other);  // overloaded assignment

	// Set control property
	oresult SetProperty(BOOL mode=OBOUND_READWRITE);

// Implementation
public:
	virtual ~OBoundEdit();

//{{OBoundEditVIRTUAL_BEGIN}}
protected:
	 void EvKeyDown(UINT nChar, UINT nRepCnt, UINT nFlags);
//{{OBoundEditVIRTUAL_END}}

private:
	 oresult Refresh(const OValue &val); 
	 oresult SaveChange(void);
	 BOOL    m_mode;  // readonly/readwrite mode

	 DECLARE_RESPONSE_TABLE(OBoundEdit);
};

/////////////////////////////////////////////////////////////////////////////
// OBoundStatic: a bound static control

class OBoundStatic : public TStatic, public OBound
{
// Construction
public:
	OBoundStatic(TWindow* parent, int Id, const char far* title, int x, int y,
					 int w, int h, UINT textLen = 0, TModule* module = 0);
	OBoundStatic(TWindow* parent, int resourceId, UINT textLen = 0, 
					 TModule* module = 0);

	 // declarations of methods so that compiler won't implement these (which would be wrong)
	 // at present we don't implement these either...
	 OBoundStatic(const OBoundStatic &other);  // copy constructor
	 OBoundStatic &operator=(const OBoundStatic &other);  // overloaded assignment

// Implementation
public:
	virtual ~OBoundStatic();

//{{OBoundStaticVIRTUAL_BEGIN}}
protected:
//{{OBoundStaticVIRTUAL_END}}
	
private:
	 oresult Refresh(const OValue &val); 
	 oresult SaveChange(void) {return OSUCCESS;}

	 DECLARE_RESPONSE_TABLE(OBoundStatic);
};

//----------------------------
// OBoundCheckBox: a bound checkbox control

class OBoundCheckBox : public TCheckBox, public OBound
{
// Construction
public:
	OBoundCheckBox(TWindow* parent, int Id, const char far* title, int x, int y, 
						int w, int h, TGroupBox *group = 0, TModule* module = 0);
	OBoundCheckBox(TWindow* parent, int resourceID, TGroupBox *group = 0,
						TModule* module = 0);

	OBoundCheckBox(const OBoundCheckBox &other);  // copy constructor
	OBoundCheckBox &operator=(const OBoundCheckBox &other);  // overloaded assignment

	// Set control properties
	oresult SetProperty(const OValue &onvalue, const OValue &offvalue, BOOL mode=OBOUND_READWRITE);

// Implementation
public:
	virtual ~OBoundCheckBox();                       

//{{OBoundCheckBoxVIRTUAL_BEGIN}}
protected:
	void EvLButtonUp(UINT modKeys, TPoint& point);
	void EvKeyDown(UINT hChar, UINT nRepCnt, UINT nFlags);
//{{OBoundCheckBoxVIRTUAL_END}}	

private:
	 oresult Refresh(const OValue &val); 
	 oresult SaveChange(void);
	 BOOL     m_mode;             // readonly/readwrite mode
	 BOOL    m_tristate;         // 3state flag
	 OValue  m_onvalue;          // represented value when checked
	 OValue  m_offvalue;         // represented value when unchecked
	 OValue  m_curvalue;         // represented current value when neither checked nor unchecked

	 DECLARE_RESPONSE_TABLE(OBoundCheckBox);
};

//----------------------------
// OBoundRadioButton: a bound radio button control

class OBoundRadioButton : public TRadioButton, public OBound
{
// Construction
public:
	OBoundRadioButton(TWindow* parent, int Id, const char far* title, int x, int y, 
							int w, int h, TGroupBox *group = 0, TModule* module = 0);
	OBoundRadioButton(TWindow* parent, int resourceID, TGroupBox *group = 0,
							TModule* module = 0);

	OBoundRadioButton(const OBoundRadioButton &other);  // copy constructor
	OBoundRadioButton &operator=(const OBoundRadioButton &other);  // overloaded assignment

	// Set control properties
	oresult SetProperty(const OValue &value, BOOL mode=OBOUND_READWRITE);

// Implementation
public:
	virtual ~OBoundRadioButton();                       

//{{OBoundCheckBoxVIRTUAL_BEGIN}}
protected:
	void EvLButtonUp(UINT modKeys, TPoint& point);
	void EvKeyDown(UINT hChar, UINT nRepCnt, UINT nFlags);
//{{OBoundCheckBoxVIRTUAL_END}}	

private:
	 oresult Refresh(const OValue &val); 
	 oresult SaveChange(void);
	 BOOL    m_mode;             // readonly/readwrite mode
	 OValue  m_value;          // represented value when checked
	 OValue  m_curvalue;         // represented current value when neither checked nor unchecked

	 DECLARE_RESPONSE_TABLE(OBoundRadioButton);
};

//----------------------------
// OBoundHSlider: a horizontal bound slider

class OBoundHSlider : public THSlider, public OBound
{
// Construction
public:
	OBoundHSlider(TWindow* parent, int Id, int x, int y, int w, int h, 
					  TResId thumbResId = IDB_HSLIDERTHUMB, TModule* module = 0);
	
	OBoundHSlider(const OBoundHSlider &other);  // copy constructor
	OBoundHSlider &operator=(const OBoundHSlider &other);  // overloaded assignment

	// Set Property
	oresult SetProperty(const OValue &min, const OValue &max, BOOL mode=OBOUND_READWRITE);
	
// Implementation
public:
	virtual ~OBoundHSlider();

//{{OBoundHSliderVIRTUAL_BEGIN}}
protected:
	void EvHScroll(UINT scrollCode, UINT thumbPos, HWND hWndCtl);
//{{OBoundHSliderVIRTUAL_END}}	
	
private:
	 oresult Refresh(const OValue &val); 
	 oresult SaveChange(void);
	 BOOL    m_mode;                     // readonly/readwrite mode
	 
	 DECLARE_RESPONSE_TABLE(OBoundHSlider);
};

//----------------------------
// OBoundVSlider: a vertical bound slider

class OBoundVSlider : public TVSlider, public OBound
{
// Construction
public:
	OBoundVSlider(TWindow* parent, int Id, int x, int y, int w, int h, 
					  TResId thumbResId = IDB_VSLIDERTHUMB, TModule* module = 0);
	
	OBoundVSlider(const OBoundVSlider &other);  // copy constructor
	OBoundVSlider &operator=(const OBoundVSlider &other);  // overloaded assignment

	// Set Property
	oresult SetProperty(const OValue &min, const OValue &max, BOOL mode=OBOUND_READWRITE);
	
// Implementation
public:
	virtual ~OBoundVSlider();

//{{OBoundHSliderVIRTUAL_BEGIN}}
protected:
	void EvVScroll(UINT scrollCode, UINT thumbPos, HWND hWndCtl);
//{{OBoundHSliderVIRTUAL_END}}	
	
private:
	 oresult Refresh(const OValue &val); 
	 oresult SaveChange(void);
	 BOOL    m_mode;                     // readonly/readwrite mode
	 
	 DECLARE_RESPONSE_TABLE(OBoundVSlider);
};

//----------------------------
// OBoundGauge: a display-only bound gauge 

class OBoundGauge : public TGauge, public OBound
{
// Construction
public:
	OBoundGauge(TWindow* parent, const char far* title, int Id, int x, int y, int w, int h, 
					BOOL isHorizontal = TRUE, int margin = 0, TModule* module = 0);
	
	OBoundGauge(const OBoundGauge &other);  // copy constructor
	OBoundGauge &operator=(const OBoundGauge &other);  // overloaded assignment

	// Set Property
	oresult SetProperty(const OValue &min, const OValue &max);
	
// Implementation
public:
	virtual ~OBoundGauge();

//{{OBoundGaugeVIRTUAL_BEGIN}}
protected:
//{{OBoundGaugeVIRTUAL_END}}	
	
private:
	 oresult Refresh(const OValue &val); 
	 oresult SaveChange(void) { return (OSUCCESS); }
	 
	 DECLARE_RESPONSE_TABLE(OBoundGauge);
};

#endif
