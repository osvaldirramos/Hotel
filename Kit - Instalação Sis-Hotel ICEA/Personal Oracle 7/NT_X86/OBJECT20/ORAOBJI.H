/* Copyright (c) Oracle Corporation 1994.  All Rights Reserved */

/*
    This source code is provided as a debugging aid for developers
    who have purchased Oracle Objects for OLE    .  Please see the
    online help for documentation of these classes.
*/

/*
    Oracle Objects for OLE     C++ Classes
    
    This file is the header for some internal utilities and the
    internally used OOLEvar class.
                           
    CREATED    ********   11/22/94

*/

#ifndef ORAOBJI_ORACLE
#define ORAOBJI_ORACLE

// ----- String Utilities -----------------------------------------------
char *OObjectAllocString(const char *instr);
char *OObjectAllocStringLen(char *instr, unsigned int len);
unsigned int OObjectStringLen(char *str); 
void OObjectFreeString(char *instr);

// ----- Global Memory -----------------------------------------------
struct oglobal
{
    unsigned char ogtried;  // tried to initialize ole
    unsigned char ogdid;    // 1: we initialized, 2: we didn't (but it's there), 0: no ole
};

// routine for maintaining global state per process
oglobal *ssoo4wGetGlobal(void);
// routine to free global state
void ssoo4wfree();

// routine to check that OLE is initialized
oboolean CheckOLE(void);

// ----- OOLEvar -----------------------------------------------
class OOLEvar
{
public:
    OOLEvar(void);
    ~OOLEvar(void);
    
    // to make sure compiler doesn't supply these:
    OOLEvar(const OOLEvar &other);  // copy constructor
    OOLEvar &operator=(const OOLEvar &other);
    
    oboolean IsEqual(OOLEvar *other);
    
    oboolean IsNull(void) const;
    
    // access to variant
    VARIANT *GetVariant(void);
    void HaveSetVariant(void);  // to tell OOLEvar that VARIANT has been touched
    
    // set values
    oresult SetValue(int val);
    oresult SetValue(long val);
    oresult SetValue(double val);
    oresult SetValue(const char *val);
    oresult SetValue(VARIANT *val); 
	 oresult SetValue(short *val);	// For ARRAYINSERT
	 oresult SetValue(int *val);		// For ARRAYINSERT
	 oresult SetValue(long *val);		// For ARRAYINSERT
	 oresult SetValue(double *val);	// For ARRAYINSERT
	 oresult SetValue(char **val);	// For ARRAYINSERT
	 oresult Clear(void);
    
    // get values
    oresult GetValue(int *val);
    oresult GetValue(long *val);
    oresult GetValue(double *val);
    oresult GetValue(const char **val);
    
    // get length of current string result
    unsigned int GetStringLength(void) const;

private:
    VARIANT  m_mainv;       // where we store our copy of the data
    VARIANT  m_convertedv;  // storage of most recently converted copy of data
    VARIANT *m_pmain;       // pointer to m_mainv
    VARIANT *m_pconv;       // pointer to m_convertedv
    char    m_isconv;     // TRUE when m_converted has a copy of m_main
};

#endif
