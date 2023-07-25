# Microsoft Visual C++ Generated NMAKE File, Format Version 2.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Application" 0x0101

!IF "$(CFG)" == ""
CFG=Win32 Debug
!MESSAGE No configuration specified.  Defaulting to Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "Win32 Release" && "$(CFG)" != "Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE on this makefile
!MESSAGE by defining the macro CFG on the command line.  For example:
!MESSAGE 
!MESSAGE NMAKE /f "EMPEDT32.MAK" CFG="Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "Win32 Release" (based on "Win32 (x86) Application")
!MESSAGE "Win32 Debug" (based on "Win32 (x86) Application")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

################################################################################
# Begin Project
# PROP Target_Last_Scanned "Win32 Debug"
MTL=MkTypLib.exe
CPP=cl.exe
RSC=rc.exe

!IF  "$(CFG)" == "Win32 Release"

# PROP BASE Use_MFC 1
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "WinRel"
# PROP BASE Intermediate_Dir "WinRel"
# PROP Use_MFC 1
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "WinRel"
# PROP Intermediate_Dir "WinRel"
OUTDIR=.\WinRel
INTDIR=.\WinRel

ALL : $(OUTDIR)/EMPEDT32.exe $(OUTDIR)/EMPEDT32.bsc

$(OUTDIR) : 
    if not exist $(OUTDIR)/nul mkdir $(OUTDIR)

# ADD BASE MTL /nologo /D "NDEBUG" /win32
# ADD MTL /nologo /D "NDEBUG" /win32
MTL_PROJ=/nologo /D "NDEBUG" /win32 
# ADD BASE CPP /nologo /MT /W3 /GX /YX /O1 /I "..\..\include" /I "..\..\mfc\include" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /FR /c
# ADD CPP /nologo /MT /W3 /GX /O1 /I "..\..\include" /I "..\..\mfc\include" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /FR /Yu"STDAFX.H" /c
CPP_PROJ=/nologo /MT /W3 /GX /O1 /I "..\..\include" /I "..\..\mfc\include" /D\
 "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /FR$(INTDIR)/\
 /Fp$(OUTDIR)/"EMPEDT32.pch" /Yu"STDAFX.H" /Fo$(INTDIR)/ /c 
CPP_OBJS=.\WinRel/
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x409 /d "NDEBUG"
RSC_PROJ=/l 0x409 /fo$(INTDIR)/"EMPEDT.res" /d "NDEBUG" 
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o$(OUTDIR)/"EMPEDT32.bsc" 
BSC32_SBRS= \
	$(INTDIR)/STDAFX.SBR \
	$(INTDIR)/EMPEDT.SBR \
	$(INTDIR)/MAINFRM.SBR \
	$(INTDIR)/EMPEDDOC.SBR \
	$(INTDIR)/EMPEDVW.SBR \
	$(INTDIR)/LOGDLG.SBR

$(OUTDIR)/EMPEDT32.bsc : $(OUTDIR)  $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LINK32=link.exe
# ADD BASE LINK32 ..\..\mfc\lib\omfc.lib oldnames.lib ..\..\lib\oraclm.lib /NOLOGO /STACK:0x20240 /SUBSYSTEM:windows /MACHINE:IX86
# ADD LINK32 ..\..\mfc\lib\omfc.lib oldnames.lib ..\..\lib\oraclm.lib /NOLOGO /STACK:0x20240 /SUBSYSTEM:windows /MACHINE:IX86
LINK32_FLAGS=..\..\mfc\lib\omfc.lib oldnames.lib ..\..\lib\oraclm.lib /NOLOGO\
 /STACK:0x20240 /SUBSYSTEM:windows /INCREMENTAL:no /PDB:$(OUTDIR)/"EMPEDT32.pdb"\
 /MACHINE:IX86 /DEF:".\EMPEDT.DEF" /OUT:$(OUTDIR)/"EMPEDT32.exe" 
DEF_FILE=.\EMPEDT.DEF
LINK32_OBJS= \
	$(INTDIR)/EMPEDT.res \
	$(INTDIR)/STDAFX.OBJ \
	$(INTDIR)/EMPEDT.OBJ \
	$(INTDIR)/MAINFRM.OBJ \
	$(INTDIR)/EMPEDDOC.OBJ \
	$(INTDIR)/EMPEDVW.OBJ \
	$(INTDIR)/LOGDLG.OBJ

$(OUTDIR)/EMPEDT32.exe : $(OUTDIR)  $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Win32 Debug"

# PROP BASE Use_MFC 1
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "WinDebug"
# PROP BASE Intermediate_Dir "WinDebug"
# PROP Use_MFC 1
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "WinDebug"
# PROP Intermediate_Dir "WinDebug"
OUTDIR=.\WinDebug
INTDIR=.\WinDebug

ALL : $(OUTDIR)/EMPEDT32.exe $(OUTDIR)/EMPEDT32.bsc

$(OUTDIR) : 
    if not exist $(OUTDIR)/nul mkdir $(OUTDIR)

# ADD BASE MTL /nologo /D "_DEBUG" /win32
# ADD MTL /nologo /D "_DEBUG" /win32
MTL_PROJ=/nologo /D "_DEBUG" /win32 
# ADD BASE CPP /nologo /MT /W3 /GX /Zi /YX /Od /I "..\..\include" /I "..\..\mfc\include" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /FR /c
# ADD CPP /nologo /MT /W3 /GX /Zi /Od /I "..\..\include" /I "..\..\mfc\include" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /FR /Yu"STDAFX.H" /c
CPP_PROJ=/nologo /MT /W3 /GX /Zi /Od /I "..\..\include" /I "..\..\mfc\include"\
 /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /FR$(INTDIR)/\
 /Fp$(OUTDIR)/"EMPEDT32.pch" /Yu"STDAFX.H" /Fo$(INTDIR)/\
 /Fd$(OUTDIR)/"EMPEDT32.pdb" /c 
CPP_OBJS=.\WinDebug/
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG"
RSC_PROJ=/l 0x409 /fo$(INTDIR)/"EMPEDT.res" /d "_DEBUG" 
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o$(OUTDIR)/"EMPEDT32.bsc" 
BSC32_SBRS= \
	$(INTDIR)/STDAFX.SBR \
	$(INTDIR)/EMPEDT.SBR \
	$(INTDIR)/MAINFRM.SBR \
	$(INTDIR)/EMPEDDOC.SBR \
	$(INTDIR)/EMPEDVW.SBR \
	$(INTDIR)/LOGDLG.SBR

$(OUTDIR)/EMPEDT32.bsc : $(OUTDIR)  $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LINK32=link.exe
# ADD BASE LINK32 ..\..\mfc\lib\dbg\omfc.lib oldnames.lib ..\..\lib\oraclm.lib /NOLOGO /STACK:0x20240 /SUBSYSTEM:windows /DEBUG /MACHINE:IX86
# ADD LINK32 ..\..\mfc\lib\dbg\omfc.lib oldnames.lib ..\..\lib\oraclm.lib /NOLOGO /STACK:0x20240 /SUBSYSTEM:windows /DEBUG /MACHINE:IX86
LINK32_FLAGS=..\..\mfc\lib\dbg\omfc.lib oldnames.lib ..\..\lib\oraclm.lib\
 /NOLOGO /STACK:0x20240 /SUBSYSTEM:windows /INCREMENTAL:yes\
 /PDB:$(OUTDIR)/"EMPEDT32.pdb" /DEBUG /MACHINE:IX86 /DEF:".\EMPEDT.DEF"\
 /OUT:$(OUTDIR)/"EMPEDT32.exe" 
DEF_FILE=.\EMPEDT.DEF
LINK32_OBJS= \
	$(INTDIR)/EMPEDT.res \
	$(INTDIR)/STDAFX.OBJ \
	$(INTDIR)/EMPEDT.OBJ \
	$(INTDIR)/MAINFRM.OBJ \
	$(INTDIR)/EMPEDDOC.OBJ \
	$(INTDIR)/EMPEDVW.OBJ \
	$(INTDIR)/LOGDLG.OBJ

$(OUTDIR)/EMPEDT32.exe : $(OUTDIR)  $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ENDIF 

.c{$(CPP_OBJS)}.obj:
   $(CPP) $(CPP_PROJ) $<  

.cpp{$(CPP_OBJS)}.obj:
   $(CPP) $(CPP_PROJ) $<  

.cxx{$(CPP_OBJS)}.obj:
   $(CPP) $(CPP_PROJ) $<  

################################################################################
# Begin Group "Source Files"

################################################################################
# Begin Source File

SOURCE=.\EMPEDT.RC
DEP_EMPED=\
	.\RES\EMPEDT.ICO\
	.\res\empedt.rc2

$(INTDIR)/EMPEDT.res :  $(SOURCE)  $(DEP_EMPED) $(INTDIR)
   $(RSC) $(RSC_PROJ)  $(SOURCE) 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\STDAFX.CPP
DEP_STDAF=\
	.\stdafx.h

!IF  "$(CFG)" == "Win32 Release"

# ADD BASE CPP /Yc"STDAFX.H"
# ADD CPP /Yc"STDAFX.H"

$(INTDIR)/STDAFX.OBJ :  $(SOURCE)  $(DEP_STDAF) $(INTDIR)
   $(CPP) /nologo /MT /W3 /GX /O1 /I "..\..\include" /I "..\..\mfc\include" /D\
 "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /FR$(INTDIR)/\
 /Fp$(OUTDIR)/"EMPEDT32.pch" /Yc"STDAFX.H" /Fo$(INTDIR)/ /c  $(SOURCE) 

!ELSEIF  "$(CFG)" == "Win32 Debug"

# ADD BASE CPP /Yc"STDAFX.H"
# ADD CPP /Yc"STDAFX.H"

$(INTDIR)/STDAFX.OBJ :  $(SOURCE)  $(DEP_STDAF) $(INTDIR)
   $(CPP) /nologo /MT /W3 /GX /Zi /Od /I "..\..\include" /I "..\..\mfc\include"\
 /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /FR$(INTDIR)/\
 /Fp$(OUTDIR)/"EMPEDT32.pch" /Yc"STDAFX.H" /Fo$(INTDIR)/\
 /Fd$(OUTDIR)/"EMPEDT32.pdb" /c  $(SOURCE) 

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\EMPEDT.CPP
DEP_EMPEDT=\
	.\stdafx.h\
	.\empedt.h\
	.\mainfrm.h\
	.\empeddoc.h\
	.\empedvw.h\
	\v2dev\cpp\include\oracl.h\
	\v2dev\cpp\include\obound.h\
	\v2dev\cpp\omfc\include\omfc.h

$(INTDIR)/EMPEDT.OBJ :  $(SOURCE)  $(DEP_EMPEDT) $(INTDIR) $(INTDIR)/STDAFX.OBJ

# End Source File
################################################################################
# Begin Source File

SOURCE=.\MAINFRM.CPP
DEP_MAINF=\
	.\stdafx.h\
	.\empedt.h\
	.\mainfrm.h

$(INTDIR)/MAINFRM.OBJ :  $(SOURCE)  $(DEP_MAINF) $(INTDIR) $(INTDIR)/STDAFX.OBJ

# End Source File
################################################################################
# Begin Source File

SOURCE=.\EMPEDDOC.CPP
DEP_EMPEDD=\
	.\stdafx.h\
	.\empedt.h\
	.\empeddoc.h

$(INTDIR)/EMPEDDOC.OBJ :  $(SOURCE)  $(DEP_EMPEDD) $(INTDIR)\
 $(INTDIR)/STDAFX.OBJ

# End Source File
################################################################################
# Begin Source File

SOURCE=.\EMPEDVW.CPP
DEP_EMPEDV=\
	.\stdafx.h\
	.\empedt.h\
	.\empeddoc.h\
	.\empedvw.h\
	\v2dev\cpp\include\oracl.h\
	.\logdlg.h\
	\v2dev\cpp\include\obound.h\
	\v2dev\cpp\omfc\include\omfc.h

$(INTDIR)/EMPEDVW.OBJ :  $(SOURCE)  $(DEP_EMPEDV) $(INTDIR)\
 $(INTDIR)/STDAFX.OBJ

# End Source File
################################################################################
# Begin Source File

SOURCE=.\LOGDLG.CPP
DEP_LOGDL=\
	.\stdafx.h\
	.\logdlg.h\
	\v2dev\cpp\include\oracl.h

$(INTDIR)/LOGDLG.OBJ :  $(SOURCE)  $(DEP_LOGDL) $(INTDIR) $(INTDIR)/STDAFX.OBJ

# End Source File
################################################################################
# Begin Source File

SOURCE=.\EMPEDT.DEF
# End Source File
# End Group
# End Project
################################################################################
