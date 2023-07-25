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
#include "oowl.h"
#endif

// ---------------------------------------
// OBoundEdit member functions

DEFINE_RESPONSE_TABLE1(OBoundEdit, TEdit)
  EV_WM_KEYDOWN,
END_RESPONSE_TABLE;

OBoundEdit::OBoundEdit(TWindow* parent, int Id, const char far* text, int x, int y, int w,
				 int h, UINT textLen, BOOL multiline, TModule* module)
:TEdit(parent, Id, text, x, y, w, h, textLen, multiline, module)
{
	m_mode = OBOUND_READWRITE;
}

OBoundEdit::OBoundEdit(TWindow* parent, int resourceID, UINT textLen, TModule* module)
: TEdit(parent, resourceID, textLen, module)
{
	m_mode = OBOUND_READWRITE;
}

OBoundEdit::~OBoundEdit()
{
}

oresult OBoundEdit::SetProperty(BOOL mode)
{
	m_mode = mode;
	SetReadOnly(m_mode==OBOUND_READONLY);

	return (OSUCCESS);
}

void OBoundEdit::EvKeyDown(UINT nChar, UINT nRepCnt, UINT nFlags)
{
	if (m_mode==OBOUND_READWRITE)
		Changed();  // remember that there's been a change
	TEdit::EvKeyDown(nChar, nRepCnt, nFlags);
}

oresult OBoundEdit::Refresh(const OValue &val)
{
	 // change text in textedit
	 const char *cp = (const char *) val;
	 SetText(cp);

	 return(OSUCCESS);
}

oresult OBoundEdit::SaveChange(void)
{
	// get the value from the text
	int length = GetTextLen();
	char *temps = new char[length+1];
	GetText(temps, length+1);
	OValue val = temps;
	delete temps;
	
	oresult ores = SetValue(val);
	
	if (ores == OSUCCESS) 
	    Changed(FALSE);
	 
	return(ores);
}

// ---------------------------------------
// OBoundStatic member functions

DEFINE_RESPONSE_TABLE1(OBoundStatic, TStatic)
END_RESPONSE_TABLE;

OBoundStatic::OBoundStatic(TWindow* parent, int Id, const char far* title, int x, int y, int w,
				 int h, UINT textLen, TModule* module)
:TStatic(parent, Id, title, x, y, w, h, textLen, module)
{
}

OBoundStatic::OBoundStatic(TWindow* parent, int resourceID, UINT textLen, TModule* module)
: TStatic(parent, resourceID, textLen, module)
{
}

OBoundStatic::~OBoundStatic()
{
}

oresult OBoundStatic::Refresh(const OValue &val)
{
	 // change text in textedit
	 const char *cp = (const char *) val;
	 SetText(cp);

	 return(OSUCCESS);
}

// ---------------------------------------
// OBoundCheckBox member functions

DEFINE_RESPONSE_TABLE1(OBoundCheckBox, TCheckBox)
  EV_WM_LBUTTONUP,
  EV_WM_KEYDOWN,
END_RESPONSE_TABLE;

OBoundCheckBox::OBoundCheckBox(TWindow* parent, int Id, const char far* title, int x, int y, int w,
				 int h, TGroupBox *group, TModule* module)
:TCheckBox(parent, Id, title, x, y, w, h, group, module)
{
	m_onvalue.Clear();
	m_offvalue.Clear();
	m_curvalue.Clear();
	m_tristate = FALSE;
	m_mode = OBOUND_READWRITE;
}

OBoundCheckBox::OBoundCheckBox(TWindow* parent, int resourceID, TGroupBox *group, TModule* module)
: TCheckBox(parent, resourceID, group, module)
{
	m_onvalue.Clear();
	m_offvalue.Clear();
	m_curvalue.Clear();
	m_tristate = FALSE;
	m_mode = OBOUND_READWRITE;
}                                            

OBoundCheckBox::~OBoundCheckBox()
{
}

oresult OBoundCheckBox::Refresh(const OValue &val)
{
	 m_curvalue.Clear();          
	 int check;
	 if (val==m_onvalue)
		check = 1;
	 else if (val==m_offvalue)
		check = 0;
	 else     
	 {
		check = (m_tristate) ? 2 : 0;
		m_curvalue = val;
	 }
	 
	 SetCheck(check);

	 return(OSUCCESS);
}

oresult OBoundCheckBox::SaveChange(void)
{
	int check = GetCheck();
	oresult ores;
	
	if (check == 0)
		ores = SetValue(m_offvalue);
	else if (check == 1)
		ores = SetValue(m_onvalue);
	else
		ores = SetValue(m_curvalue);
	 
	if (ores == OSUCCESS) 
	    Changed(FALSE);

	return(ores);
}

void OBoundCheckBox::EvLButtonUp(UINT modKeys, TPoint& point) 
{
	 if (m_mode==OBOUND_READWRITE)
		 Changed();
	 TCheckBox::EvLButtonUp(modKeys, point);
}

void OBoundCheckBox::EvKeyDown(UINT nChar, UINT nRepCnt, UINT nFlags)
{
	if (m_mode==OBOUND_READWRITE && nChar==VK_SPACE)
		Changed();  // remember that there's been a change
	TCheckBox::EvKeyDown(nChar, nRepCnt, nFlags);
}

oresult OBoundCheckBox::SetProperty(const OValue &onvalue, const OValue &offvalue, BOOL mode)
{
	m_mode = mode;
	m_onvalue = onvalue;
	m_offvalue = offvalue;
	long style = GetWindowLong(GWL_STYLE)&0x0000000F;
	if ((style==BS_3STATE) || (style==BS_AUTO3STATE))
		 m_tristate = TRUE;
	else m_tristate = FALSE;

	if (m_mode==OBOUND_READONLY)
	{
		if (m_tristate)
			SetStyle((UINT)BS_3STATE, TRUE);
		else 
			SetStyle((UINT)BS_CHECKBOX, TRUE);
	}
	else 
	{  
		if (m_tristate)
			SetStyle((UINT)BS_AUTO3STATE, TRUE);
		else
			SetStyle((UINT)BS_AUTOCHECKBOX, TRUE);
	}

	return (OSUCCESS);
}

// ---------------------------------------
// OBoundRadioButton member functions

DEFINE_RESPONSE_TABLE1(OBoundRadioButton, TRadioButton)
  EV_WM_LBUTTONUP,
  EV_WM_KEYDOWN,
END_RESPONSE_TABLE;

OBoundRadioButton::OBoundRadioButton(TWindow* parent, int Id, const char far* title, int x, int y, int w,
				 int h, TGroupBox *group, TModule* module)
:TRadioButton(parent, Id, title, x, y, w, h, group, module)
{
	m_value.Clear();
	m_mode = OBOUND_READWRITE;
}

OBoundRadioButton::OBoundRadioButton(TWindow* parent, int resourceID, TGroupBox *group, TModule* module)
: TRadioButton(parent, resourceID, group, module)
{
	m_value.Clear();
	m_mode = OBOUND_READWRITE;
}                                            

OBoundRadioButton::~OBoundRadioButton()
{
}

oresult OBoundRadioButton::Refresh(const OValue &val)
{
	 if (val==m_value)
		SetCheck(BF_CHECKED);
	else 
		SetCheck(BF_UNCHECKED);
	 return(OSUCCESS);
}

oresult OBoundRadioButton::SaveChange(void)
{
	int check = GetCheck();
	oresult ores = OSUCCESS;
	if (check == 1)
	{
		ores = SetValue(m_value);
		if (ores == OSUCCESS) 
	        Changed(FALSE);
	}
	
	return(ores);
}

void OBoundRadioButton::EvLButtonUp(UINT modKeys, TPoint& point) 
{
	int check = GetCheck();                  // for most cases, even for keystrokes
	TRadioButton::EvLButtonUp(modKeys, point);
	if ((m_mode == OBOUND_READWRITE) &&      // double protection and speeds up 
		 (GetCheck() != check))
		Changed();
}

void OBoundRadioButton::EvKeyDown(UINT nChar, UINT nRepCnt, UINT nFlags)
{
	int check = GetCheck();                   
	TRadioButton::EvKeyDown(nChar, nRepCnt, nFlags); 
	if ((m_mode == OBOUND_READWRITE) &&      // double protection and speeds up
		 (GetCheck() != check))
		Changed();
}

oresult OBoundRadioButton::SetProperty(const OValue &value, BOOL mode)
{
	m_mode = mode;
	m_value = value;

	if (m_mode==OBOUND_READONLY)
		SetStyle((UINT)BS_RADIOBUTTON, TRUE);
	else 
		SetStyle((UINT)BS_AUTORADIOBUTTON, TRUE);

	return (OSUCCESS);
}

// ---------------------------------------
// OBoundHSlider member functions

DEFINE_RESPONSE_TABLE1(OBoundHSlider, THSlider)
  EV_WM_HSCROLL,
END_RESPONSE_TABLE;

OBoundHSlider::OBoundHSlider(TWindow* parent, int Id, int x, int y, int w,
				 int h, TResId thumbResId, TModule* module)
:THSlider(parent, Id, x, y, w, h, thumbResId, module)
{
	m_mode = OBOUND_READWRITE;
}

OBoundHSlider::~OBoundHSlider()
{
}

oresult OBoundHSlider::Refresh(const OValue &val)
{
	 SetPosition((int)val);
 
	 return(OSUCCESS);
}

oresult OBoundHSlider::SaveChange(void)
{
    oresult ores = OSUCCESS;
    
	if (m_mode == OBOUND_READWRITE)
	{
		OValue val = GetPosition();
		ores = SetValue(val);           
		if (ores == OSUCCESS) 
	        Changed(FALSE);
	}   
	
	return(ores);
}

void OBoundHSlider::EvHScroll(UINT scrollCode, UINT thumbPos, HWND hWndCtl)
{
	if (m_mode==OBOUND_READWRITE)
	{
		Changed();  // remember that there's been a change
		THSlider::EvHScroll(scrollCode, thumbPos, hWndCtl);
	}
}

oresult OBoundHSlider::SetProperty(const OValue &min, const OValue &max, BOOL mode)
{
	m_mode = mode;
	SetRange((int)min, (int)max);
	
	return (OSUCCESS);
}

// ---------------------------------------
// OBoundVSlider member functions

DEFINE_RESPONSE_TABLE1(OBoundVSlider, TVSlider)
  EV_WM_VSCROLL,
END_RESPONSE_TABLE;

OBoundVSlider::OBoundVSlider(TWindow* parent, int Id, int x, int y, int w,
				 int h, TResId thumbResId, TModule* module)
:TVSlider(parent, Id, x, y, w, h, thumbResId, module)
{
	m_mode = OBOUND_READWRITE;
}

OBoundVSlider::~OBoundVSlider()
{
}

oresult OBoundVSlider::Refresh(const OValue &val)
{
	 SetPosition((int)val);
 
	 return(OSUCCESS);
}

oresult OBoundVSlider::SaveChange(void)
{
    oresult ores = OSUCCESS;
    
	if (m_mode == OBOUND_READWRITE)
	{
		OValue val = GetPosition();
		ores = SetValue(val);           
		if (ores == OSUCCESS) 
	        Changed(FALSE);
	}   
	
	return(ores);
}

void OBoundVSlider::EvVScroll(UINT scrollCode, UINT thumbPos, HWND hWndCtl)
{
	if (m_mode==OBOUND_READWRITE)
	{
		Changed();  // remember that there's been a change
		TVSlider::EvVScroll(scrollCode, thumbPos, hWndCtl);
	}
}

oresult OBoundVSlider::SetProperty(const OValue &min, const OValue &max, BOOL mode)
{
	m_mode = mode;
	SetRange((int)min, (int)max);
	
	return (OSUCCESS);
}

// ---------------------------------------
// OBoundGauge member functions

DEFINE_RESPONSE_TABLE1(OBoundGauge, TGauge)
END_RESPONSE_TABLE;

OBoundGauge::OBoundGauge(TWindow* parent, const char far* title,int Id, int x, int y, int w,
				 int h,BOOL isHorizontal, int margin, TModule* module)
:TGauge(parent, title, Id, x, y, w, h, isHorizontal, margin, module)
{
}

OBoundGauge::~OBoundGauge()
{
}

oresult OBoundGauge::Refresh(const OValue &val)
{
	int current = (int)val;
	int min, max;
	GetRange(min, max);
	if (current<min) current = min;
	if (current>max) current = max;
	TGauge::SetValue(current);
 
	return(OSUCCESS);
}

oresult OBoundGauge::SetProperty(const OValue &min, const OValue &max)
{
	SetRange((int)min, (int)max);
	
	return (OSUCCESS);
}


