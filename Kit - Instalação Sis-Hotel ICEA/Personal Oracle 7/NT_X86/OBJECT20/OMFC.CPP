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

#include <afxwin.h>         // MFC core and standard components
#include <afxext.h>         // MFC extensions (including VB)

#ifndef ORACL_ORACLE
#include "oracl.h"
#endif

#ifndef OMFC_ORACLE
#include "omfc.h"
#endif

//----------------------------
// OraRadioButton: a derived button class (used by OBoundGroupButton)

class OraRadioButton : public CButton
{
// Construction
public:
	OraRadioButton();

    oresult BindToControl(CWnd *wnd, int itemid, OBoundGroupButton *parent); 
    oresult SetProperty(BOOL mode=OBOUND_READWRITE); 

// Attributes
public:

// Operations
public:

// Overrides
	// ClassWizard generate virtual function overrides
	//{{AFX_VIRTUAL(OraRadioButton)
		// NOTE - the ClassWizard will add and remove member functions here.
	//}}AFX_VIRTUAL

// Implementation
public:
	virtual ~OraRadioButton();

	// Generated message map functions
protected:
	//{{AFX_MSG(OraRadioButton)
	afx_msg void OnLButtonUp(UINT nFlags, CPoint point);
	afx_msg void OnKeyUp(UINT nChar, UINT nRepCnt, UINT nFlags);
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
private:
    OBoundGroupButton  *m_group;    // pointer to the button group
    BOOL m_mode;                       // readonly/readwrite mode
};

//-----------------------------
// OraScrollBar: a derived scrollbar class (used by OBoundSlider)

class OraScrollBar : public CScrollBar
{
// Construction
public:
	OraScrollBar();

    BindToControl(CWnd *wnd, int itemid);
    SetProperty(int minvalue, int maxvalue, BOOL mode=OBOUND_READWRITE);
// Attributes
public:

// Operations
public:

// Overrides
	// ClassWizard generate virtual function overrides
	//{{AFX_VIRTUAL(OraScrollBar)
		// NOTE - the ClassWizard will add and remove member functions here.
	//}}AFX_VIRTUAL

// Implementation
public:
	virtual ~OraScrollBar();

	// Generated message map functions
protected:
	//{{AFX_MSG(OraScrollBar)
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
private:
    BOOL m_mode;      // readonly/readwrite mode
};


//---------------------------
// OMFCBound member functions

OMFCBound::OMFCBound(void)
{
    m_isbound = FALSE;
}

OMFCBound::~OMFCBound(void)
{
}

oresult OMFCBound::Subclass(CWnd *bwnd, CWnd *wnd, int itemid)
{
    if (m_isbound)
    { // already bound
        return(OFAILURE);
    }
    
    // try getting the dialog item
    if (!wnd->GetDlgItem(itemid))
    { // couldn't get textedit
        return(OFAILURE);
    }
    
    bwnd->SubclassDlgItem(itemid, wnd);

    m_isbound = TRUE;
        
    return(OSUCCESS);
}


// -----------------------------
// OBoundEdit member functions

OBoundEdit::OBoundEdit()
{
   m_mode = OBOUND_READWRITE;
}

OBoundEdit::~OBoundEdit()
{
}

oresult OBoundEdit::Refresh(const OValue &val)
{
    if (!IsBound())
        return(OFAILURE);  // we're not attached to the UI yet

    // change text in textedit
    const char *cp = (const char *) val;
    SetWindowText(cp);
    
    return(OSUCCESS);
}

oresult OBoundEdit::SaveChange(void)
{
    // get the value from the text
    CString temps;
    GetWindowText(temps);
    
    OValue val = (const char *) temps;
    oresult ores = SetValue(val);
    
    if (ores == OSUCCESS)
        Changed(FALSE);
    
    return(ores);
}

oresult OBoundEdit::SetProperty(BOOL mode/* =OBOUND_READWRITE */)
{
    m_mode = mode;    
    return (SetReadOnly(mode) ? OSUCCESS : OFAILURE);
}

BEGIN_MESSAGE_MAP(OBoundEdit, CWnd)
	//{{AFX_MSG_MAP(OBoundEdit)
	ON_WM_KEYUP()
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// OBoundEdit message handlers

void OBoundEdit::OnKeyUp(UINT nChar, UINT nRepCnt, UINT nFlags) 
{
	if (m_mode == OBOUND_READWRITE)
	{     
	  Changed();  // remember that there's been a change
	}	
	CWnd::OnKeyUp(nChar, nRepCnt, nFlags);
}

//--------------------------------
// OBoundStatic member functions

OBoundStatic::OBoundStatic()
{
}

OBoundStatic::~OBoundStatic()
{
}

oresult OBoundStatic::Refresh(const OValue &val)
{
    if (!IsBound())
        return(OFAILURE);  // we're not attached to the UI yet

    // change text in textedit
    const char *cp = (const char *) val;
    SetWindowText(cp);
    
    return(OSUCCESS);
}

BEGIN_MESSAGE_MAP(OBoundStatic, CStatic)
	//{{AFX_MSG_MAP(OBoundStatic)
		// NOTE - the ClassWizard will add and remove mapping macros here.
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// OBoundStatic message handlers


//-----------------------------------
// OBoundCheckBox member functions

OBoundCheckBox::OBoundCheckBox()
{
    m_mode = OBOUND_READWRITE;
    m_tristate = FALSE;
    m_onvalue = NULL;
    m_offvalue = NULL;
    m_curvalue = NULL;  
}

OBoundCheckBox::~OBoundCheckBox()
{
}

oresult OBoundCheckBox::Refresh(const OValue &val)
{
    if (!IsBound())
        return(OFAILURE);  // we're not attached to the UI yet

    int check;
    m_curvalue = (const char*)"";
    if ((OValue)val == (OValue)m_onvalue)
    {
      check = 1;
    }
    else
    if ((OValue)val == (OValue)m_offvalue)
    {
      check = 0;
    }
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
    {
        ores = SetValue(m_offvalue);
    }
    else
    if (check == 1)
    {
        ores = SetValue(m_onvalue);
    }
    else
    {           
        ores = SetValue(m_curvalue);
    }
    
    if (ores == OSUCCESS)
        Changed(FALSE);
        
    return(ores);
}

oresult OBoundCheckBox::SetProperty(const OValue &onvalue, 
                                    const OValue &offvalue, 
                                    BOOL mode /* =OBOUND_READWRITE */)
{                         
    if (mode == OBOUND_READONLY)      //  readonly
    {
      if (GetButtonStyle() == (UINT)BS_AUTO3STATE)
        SetButtonStyle((UINT)BS_3STATE);
      if (GetButtonStyle() == (UINT)BS_AUTOCHECKBOX)
        SetButtonStyle((UINT)BS_CHECKBOX);
    }
    else                              // readwrite
    {
      if (GetButtonStyle() == (UINT)BS_3STATE)
        SetButtonStyle((UINT)BS_AUTO3STATE);
      if (GetButtonStyle() == (UINT)BS_CHECKBOX)
        SetButtonStyle((UINT)BS_AUTOCHECKBOX);
    }

    if ((GetButtonStyle() == (UINT)BS_AUTO3STATE) ||
        (GetButtonStyle() == (UINT)BS_3STATE))
    {
      m_tristate = TRUE;
    }
        
    m_mode = mode;
    m_onvalue = onvalue;
    m_offvalue = offvalue;
    return(OSUCCESS);    // TODO: more accurate error checking
}

BEGIN_MESSAGE_MAP(OBoundCheckBox, CButton)
	//{{AFX_MSG_MAP(OBoundCheckBox)
	ON_WM_LBUTTONUP()
	ON_WM_KEYUP()
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// OBoundCheckBox message handlers

void OBoundCheckBox::OnLButtonUp(UINT nFlags, CPoint point) 
{
    int check = GetCheck();
    CButton::OnLButtonUp(nFlags, point);
	if ((m_mode == OBOUND_READWRITE) &&      // double protection
	    (GetCheck() != check))
	{
      Changed();
    }  
}

void OBoundCheckBox::OnKeyUp(UINT nChar, UINT nRepCnt, UINT nFlags) 
{
    int check = GetCheck();
	CButton::OnKeyUp(nChar, nRepCnt, nFlags);
	if ((m_mode == OBOUND_READWRITE) &&      // double protection
	    (GetCheck() != check))
	{
      Changed();
    }  
}

//-------------------------------------
// OBoundGroupButton member functions

OBoundGroupButton::OBoundGroupButton()
{
    m_mode = OBOUND_READWRITE;
    m_head = NULL;
    m_tail = NULL;
    m_current = NULL;
    
}

OBoundGroupButton::~OBoundGroupButton()
{
    buttonlist *tmp;
    while(tmp = m_head)
    {
      m_head = m_head->next;
      delete (OraRadioButton *) (tmp->button);
      delete tmp->value;
      delete tmp;
    }  
}

oresult OBoundGroupButton::BindToControl(CWnd *wnd, int itemid)
{
    buttonlist *tmp = m_head;              // pointer to the head of button list
    while(tmp)                             // detect whether already bounded
    {
      if (tmp->itemid == itemid)
        return (OFAILURE);                
      tmp = tmp->next;  
    }

    // try getting the dialog item
    if (!wnd->GetDlgItem(itemid))
    { // couldn't get this item
        return(OFAILURE);
    }
    
    OraRadioButton *button = new OraRadioButton;    // dynamically create c++ radio button
    button->BindToControl(wnd, itemid, this);       // Bind to windows control
    tmp = new buttonlist;                           // create a button list element
    tmp->button = (void *) button;                           
    tmp->itemid = itemid;
    tmp->next = NULL;
    if (m_tail)                                     // add the new element onto the button list
    {
      m_tail->next = tmp;
      m_tail = tmp;
    }
    else
    {  
      m_head = m_tail = tmp;
    }
    return (OSUCCESS);      
}                                  

oresult OBoundGroupButton::SetProperty(int itemid, const OValue &value, BOOL mode /* =OBOUND_READWRITE */)
{
    buttonlist *tmp = m_head;              // pointer to the head of button list
    while(tmp)                             // detect whether already bounded
    {
      if (tmp->itemid == itemid)
        break;                
      tmp = tmp->next;  
    }

    if (tmp == NULL)
    { // couldn't get this item
        return(OFAILURE);
    }
    
    OraRadioButton *button = (OraRadioButton *)(tmp->button);
    if (!m_isbound)                        // use m_isbound to indicate if this is the 1st radio button      
      m_mode = mode;          
    button->SetProperty(m_mode);
    OValue *butvalue = new OValue;
    *butvalue = value;
    tmp->value = butvalue;
    m_isbound = TRUE;                      // so far the groupbutton is so-called bounded
    return (OSUCCESS);      
}                                  

oresult OBoundGroupButton::Refresh(const OValue &val)
{
    if (!IsBound())
        return(OFAILURE);  // we're not attached to the UI yet

    buttonlist *tmp = m_head;
    while (tmp)
    {
      if ((OValue)val == (OValue)*(tmp->value))
        break;
      tmp = tmp->next;  
    }
    
    if (tmp)                                    // There is a matched value
    {
      if (m_current && (m_current != tmp))
        ((OraRadioButton *)(m_current->button))->SetCheck(0);         // Uncheck the current radio button
      ((OraRadioButton *)(tmp->button))->SetCheck(1);                 // Check the new radio button
      m_current = tmp;                          // Bookmark the currently checked radio button 
    }
    else
    {                                           // No matched value
        if (m_current)
        {
          ((OraRadioButton *)(m_current->button))->SetCheck(0);       // Uncheck the current radio button
          m_current = NULL;                     // Curently no checked radio buton
        }       
    }

    return(OSUCCESS);
}

oresult OBoundGroupButton::SaveChange(void)
{
    buttonlist *tmp = m_head;
    while (tmp)
    {
      if (((OraRadioButton *)(tmp->button))->GetCheck())
        break;
      tmp = tmp->next;  
    }
    
    oresult ores;   
    if (tmp)
        ores = SetValue(*(tmp->value));
    else
    { // no button was set.  Make value NULL
        OValue nullv;  // construct null value
        ores = SetValue(nullv);
    }
    
    if (ores == OSUCCESS)
        Changed(FALSE);
    
    return(ores);
}


void OBoundGroupButton::ButtonChanged(void *button)
{
    buttonlist *tmp = m_head;
    while (tmp)
    {
      if (tmp->button == button)
        break;
      tmp = tmp->next;  
    }
    m_current = tmp;
    Changed();
}

//--------------------------------
// OraRadioButton member functions

OraRadioButton::OraRadioButton()
{
  m_group = NULL;
  m_mode = OBOUND_READWRITE;
}

OraRadioButton::~OraRadioButton()
{
}

oresult OraRadioButton::BindToControl(CWnd *wnd, 
                                      int itemid, 
                                      OBoundGroupButton *parent)
{
    SubclassDlgItem(itemid, wnd);
    m_group = parent;
    return (OSUCCESS);
}                                      

oresult OraRadioButton::SetProperty(BOOL mode /*=OBOUND_READWRITE*/) 
{
    m_mode = mode;  
    if (mode == OBOUND_READONLY)      //  readonly
    {
      if (GetButtonStyle() == (UINT)BS_AUTORADIOBUTTON)
        SetButtonStyle((UINT)BS_RADIOBUTTON);
    }
    else                              // readwrite
    {
      if (GetButtonStyle() == (UINT)BS_RADIOBUTTON)
        SetButtonStyle((UINT)BS_AUTORADIOBUTTON);
    }
    return (OSUCCESS);
}                                      

BEGIN_MESSAGE_MAP(OraRadioButton, CButton)
	//{{AFX_MSG_MAP(OraRadioButton)
	ON_WM_LBUTTONUP()
	ON_WM_KEYUP()
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// OraRadioButton message handlers

void OraRadioButton::OnLButtonUp(UINT nFlags, CPoint point) 
{
    int check = GetCheck();                  // for most cases, even for keystrokes
	CButton::OnLButtonUp(nFlags, point);
	if ((m_mode == OBOUND_READWRITE) &&      // double protection and speeds up 
	    (GetCheck() != check))
	{
      m_group->ButtonChanged((void *) this);
    }  
}

void OraRadioButton::OnKeyUp(UINT nChar, UINT nRepCnt, UINT nFlags) 
{
    int check = GetCheck();                   
	CButton::OnKeyUp(nChar, nRepCnt, nFlags); 
	if ((m_mode == OBOUND_READWRITE) &&      // double protection and speeds up
	    (GetCheck() != check))
	{    
      m_group->ButtonChanged((void *) this);
    }  
}

//-----------------------------
// OraScrollBar member functions

OraScrollBar::OraScrollBar()
{
  m_mode = OBOUND_READWRITE;
}

OraScrollBar::~OraScrollBar()
{
}

oresult OraScrollBar::BindToControl(CWnd *wnd, int itemid)
{
    SubclassDlgItem(itemid, wnd);
    return (OSUCCESS);
}                                      

oresult OraScrollBar::SetProperty(int minvalue,
                                  int maxvalue,
                                  BOOL mode /*=OBOUND_READWRITE*/)
{
    SetScrollRange(minvalue, maxvalue);
    m_mode = mode;
    return (OSUCCESS);
}                                      

BEGIN_MESSAGE_MAP(OraScrollBar, CScrollBar)
	//{{AFX_MSG_MAP(OraScrollBar)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// OraScrollBar message handlers
//--------------------------------
// OBoundSlider member functions

OBoundSlider::OBoundSlider()
{
    m_mode = OBOUND_READWRITE;
    m_minvalue = 0;
    m_maxvalue = 0;
    m_currentvalue = 0;
    
    OraScrollBar *sbar = new OraScrollBar;
    m_scrollbar = (void *) sbar;    
}

OBoundSlider::~OBoundSlider()
{
    delete ((OraScrollBar *) m_scrollbar);
}

oresult OBoundSlider::BindToControl(CWnd *wnd, int scrollbarid, int staticid)
{
    // try getting the dialog item
    if (!wnd->GetDlgItem(scrollbarid))
    { // couldn't get this item
        return(OFAILURE);
    }
    
    // try getting the dialog item
    if (!wnd->GetDlgItem(staticid))
    { // couldn't get this item
        return(OFAILURE);
    }
    OraScrollBar *sbar = (OraScrollBar *) m_scrollbar;           
    sbar->BindToControl(wnd, scrollbarid);
    RECT rect;
    sbar->GetWindowRect(&rect);    
    sbar->GetParent()->ScreenToClient(&rect);
    // right now just give it a random id
    Create(NULL, "OBoundSLIDER", WS_CHILD | WS_VISIBLE, rect, sbar->GetParent(), 12121);
    sbar->SetParent(this);
    sbar->SetWindowPos(NULL, 0, 0, rect.right - rect.left, rect.bottom - rect.top, SWP_NOSIZE);
    m_static.SubclassDlgItem(staticid, wnd);    
    m_isbound = TRUE;                               // so far the slider is so-called bounded
    return (OSUCCESS);      
}                                  

oresult OBoundSlider::SetProperty(const OValue &minvalue,
                                  const OValue &maxvalue,
                                  BOOL mode /* =OBOUND_READWRITE */)
{
    m_minvalue = min((int)minvalue, (int)maxvalue);
    m_maxvalue = max((int)maxvalue, (int)maxvalue);
    OraScrollBar * sbar = (OraScrollBar *)m_scrollbar;
    sbar->SetProperty(m_minvalue, m_maxvalue, mode);
    m_mode = mode;                                  // set read/write mode
    return (OSUCCESS);      
}                                  

oresult OBoundSlider::Refresh(const OValue &val)
{
    if (!IsBound())
        return(OFAILURE);  // we're not attached to the UI yet

    int value = (int)val;
    if (value < m_minvalue)
      value = m_minvalue;
    if (value > m_maxvalue)
      value = m_maxvalue;
    char valbuf[256];
    wsprintf(valbuf, "%d", value);    
    m_static.SetWindowText(valbuf);
    ((OraScrollBar *) m_scrollbar)->SetScrollPos(value);

    return(OSUCCESS);
}

oresult OBoundSlider::SaveChange(void)
{
    OValue val = (int)m_currentvalue;
    oresult ores = SetValue(val);           
    
    if (ores == OSUCCESS)
        Changed(FALSE);
    
    return(ores);
}


BEGIN_MESSAGE_MAP(OBoundSlider, CWnd)
	//{{AFX_MSG_MAP(OBoundSlider)
	ON_WM_HSCROLL()
	ON_WM_VSCROLL()
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()


/////////////////////////////////////////////////////////////////////////////
// OBoundSlider message handlers

void OBoundSlider::OnHScroll(UINT nSBCode, UINT nPos, CScrollBar* pScrollBar) 
{
  if (m_mode == OBOUND_READWRITE)
  {
    switch (nSBCode)
    {
        case SB_LEFT:
             m_currentvalue = m_minvalue;
             break;
             
//      case SB_ENDSCROLL
        case SB_PAGELEFT:
             m_currentvalue -= 9;
        case SB_LINELEFT:
             m_currentvalue = max(m_minvalue, m_currentvalue - 1);
             break;
             
        case SB_PAGERIGHT:
             m_currentvalue += 9;
        case SB_LINERIGHT:
             m_currentvalue = min(m_maxvalue, m_currentvalue + 1);
             break;
             
        case SB_RIGHT:
             m_currentvalue = m_maxvalue;
             break;
             
        case SB_THUMBPOSITION:
        case SB_THUMBTRACK:
             m_currentvalue = (int)nPos;
             break;
        
        default:
             break;     
    }
    OValue val = (int)m_currentvalue;
    Refresh(val);
    Changed();
  }  
}

void OBoundSlider::OnVScroll(UINT nSBCode, UINT nPos, CScrollBar* pScrollBar) 
{
  if (m_mode == OBOUND_READWRITE)
  {
    switch (nSBCode)
    {
        case SB_TOP:
             m_currentvalue = m_minvalue;
             break;
             
//      case SB_ENDSCROLL
        case SB_PAGEUP:
             m_currentvalue -= 9;
        case SB_LINEUP:
             m_currentvalue = max(m_minvalue, m_currentvalue - 1);
             break;
             
        case SB_PAGEDOWN:
             m_currentvalue += 9;
        case SB_LINEDOWN:
             m_currentvalue = min(m_maxvalue, m_currentvalue + 1);
             break;
             
        case SB_BOTTOM:
             m_currentvalue = m_maxvalue;
             break;
             
        case SB_THUMBPOSITION:
        case SB_THUMBTRACK:
             m_currentvalue = (int)nPos;
             break;
        
        default:
             break;     
    }
    OValue val = (int)m_currentvalue;
    Refresh(val);
    Changed();
  }  
}

