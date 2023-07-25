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
!MESSAGE NMAKE /f "VSDEPT32.MAK" CFG="Win32 Debug"
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

ALL : .\WinRel\VSDEPT32.exe .\WinRel\VSDEPT32.bsc

$(OUTDIR) : 
    if not exist $(OUTDIR)/nul mkdir $(OUTDIR)

# ADD BASE MTL /nologo /D "NDEBUG" /win32
# ADD MTL /nologo /D "NDEBUG" /win32
MTL_PROJ=/nologo /D "NDEBUG" /win32 
# ADD BASE CPP /nologo /MT /W3 /GX /YX /O1 /I "..\..\..\include" /I "..\..\include" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /FR /c
# ADD CPP /nologo /MT /W3 /GX /O1 /I "..\..\..\include" /I "..\..\include" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /FR /Yu"STDAFX.H" /c
CPP_PROJ=/nologo /MT /W3 /GX /O1 /I "..\..\..\include" /I "..\..\include" /D\
 "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /FR$(INTDIR)/\
 /Fp$(OUTDIR)/"VSDEPT32.pch" /Yu"STDAFX.H" /Fo$(INTDIR)/ /c 
CPP_OBJS=.\WinRel/
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x409 /d "NDEBUG"
RSC_PROJ=/l 0x409 /fo$(INTDIR)/"VSDEPT2.res" /d "NDEBUG" 
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o$(OUTDIR)/"VSDEPT32.bsc" 
BSC32_SBRS= \
	.\WinRel\STDAFX.SBR \
	.\WinRel\VSDEPT2.SBR \
	.\WinRel\MAINFRM.SBR \
	.\WinRel\VSDEPDOC.SBR \
	.\WinRel\VSDEPVW.SBR

.\WinRel\VSDEPT32.bsc : $(OUTDIR)  $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LINK32=link.exe
# ADD BASE LINK32 ..\..\lib\omfc.lib oldnames.lib ..\..\..\lib\oraclm.lib /NOLOGO /STACK:0x20000 /SUBSYSTEM:windows /MACHINE:IX86
# ADD LINK32 ..\..\lib\omfc.lib oldnames.lib ..\..\..\lib\oraclm.lib /NOLOGO /STACK:0x20000 /SUBSYSTEM:windows /MACHINE:IX86
LINK32_FLAGS=..\..\lib\omfc.lib oldnames.lib ..\..\..\lib\oraclm.lib /NOLOGO\
 /STACK:0x20000 /SUBSYSTEM:windows /INCREMENTAL:no /PDB:$(OUTDIR)/"VSDEPT32.pdb"\
 /MACHINE:IX86 /DEF:".\VSDEPT2.DEF" /OUT:$(OUTDIR)/"VSDEPT32.exe" 
DEF_FILE=.\VSDEPT2.DEF
LINK32_OBJS= \
	.\WinRel\VSDEPT2.res \
	.\WinRel\STDAFX.OBJ \
	.\WinRel\VSDEPT2.OBJ \
	.\WinRel\MAINFRM.OBJ \
	.\WinRel\VSDEPDOC.OBJ \
	.\WinRel\VSDEPVW.OBJ

.\WinRel\VSDEPT32.exe : $(OUTDIR)  $(DEF_FILE) $(LINK32_OBJS)
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

ALL : .\WinDebug\VSDEPT32.exe .\WinDebug\VSDEPT32.bsc

$(OUTDIR) : 
    if not exist $(OUTDIR)/nul mkdir $(OUTDIR)

# ADD BASE MTL /nologo /D "_DEBUG" /win32
# ADD MTL /nologo /D "_DEBUG" /win32
MTL_PROJ=/nologo /D "_DEBUG" /win32 
# ADD BASE CPP /nologo /MT /W3 /GX /Zi /YX /Od /I "..\..\..\include" /I "..\..\include" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /FR /c
# ADD CPP /nologo /MT /W3 /GX /Zi /Od /I "..\..\..\include" /I "..\..\include" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /FR /Yu"STDAFX.H" /c
CPP_PROJ=/nologo /MT /W3 /GX /Zi /Od /I "..\..\..\include" /I "..\..\include"\
 /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /FR$(INTDIR)/\
 /Fp$(OUTDIR)/"VSDEPT32.pch" /Yu"STDAFX.H" /Fo$(INTDIR)/\
 /Fd$(OUTDIR)/"VSDEPT32.pdb" /c 
CPP_OBJS=.\WinDebug/
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG"
RSC_PROJ=/l 0x409 /fo$(INTDIR)/"VSDEPT2.res" /d "_DEBUG" 
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o$(OUTDIR)/"VSDEPT32.bsc" 
BSC32_SBRS= \
	.\WinDebug\STDAFX.SBR \
	.\WinDebug\VSDEPT2.SBR \
	.\WinDebug\MAINFRM.SBR \
	.\WinDebug\VSDEPDOC.SBR \
	.\WinDebug\VSDEPVW.SBR

.\WinDebug\VSDEPT32.bsc : $(OUTDIR)  $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LINK32=link.exe
# ADD BASE LINK32 ..\..\lib\dbg\omfc.lib oldnames.lib ..\..\..\lib\oraclm.lib /NOLOGO /STACK:0x20000 /SUBSYSTEM:windows /DEBUG /MACHINE:IX86
# ADD LINK32 ..\..\lib\dbg\omfc.lib oldnames.lib ..\..\..\lib\oraclm.lib /NOLOGO /STACK:0x20000 /SUBSYSTEM:windows /DEBUG /MACHINE:IX86
LINK32_FLAGS=..\..\lib\dbg\omfc.lib oldnames.lib ..\..\..\lib\oraclm.lib\
 /NOLOGO /STACK:0x20000 /SUBSYSTEM:windows /INCREMENTAL:yes\
 /PDB:$(OUTDIR)/"VSDEPT32.pdb" /DEBUG /MACHINE:IX86 /DEF:".\VSDEPT2.DEF"\
 /OUT:$(OUTDIR)/"VSDEPT32.exe" 
DEF_FILE=.\VSDEPT2.DEF
LINK32_OBJS= \
	.\WinDebug\VSDEPT2.res \
	.\WinDebug\STDAFX.OBJ \
	.\WinDebug\VSDEPT2.OBJ \
	.\WinDebug\MAINFRM.OBJ \
	.\WinDebug\VSDEPDOC.OBJ \
	.\WinDebug\VSDEPVW.OBJ

.\WinDebug\VSDEPT32.exe : $(OUTDIR)  $(DEF_FILE) $(LINK32_OBJS)
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

SOURCE=.\VSDEPT2.RC
DEP_VSDEP=\
	.\RES\VSDEPT2.ICO\
	.\RES\TOOLBAR.BMP\
	.\res\vsdept2.rc2

!IF  "$(CFG)" == "Win32 Release"

.\WinRel\VSDEPT2.res :  $(SOURCE)  $(DEP_VSDEP) $(INTDIR)
   $(RSC) $(RSC_PROJ)  $(SOURCE) 

!ELSEIF  "$(CFG)" == "Win32 Debug"

.\WinDebug\VSDEPT2.res :  $(SOURCE)  $(DEP_VSDEP) $(INTDIR)
   $(RSC) $(RSC_PROJ)  $(SOURCE) 

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\STDAFX.CPP
DEP_STDAF=\
	.\stdafx.h

!IF  "$(CFG)" == "Win32 Release"

# ADD BASE CPP /Yc"STDAFX.H"
# ADD CPP /Yc"STDAFX.H"

.\WinRel\STDAFX.OBJ :  $(SOURCE)  $(DEP_STDAF) $(INTDIR)
   $(CPP) /nologo /MT /W3 /GX /O1 /I "..\..\..\include" /I "..\..\include" /D\
 "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /FR$(INTDIR)/\
 /Fp$(OUTDIR)/"VSDEPT32.pch" /Yc"STDAFX.H" /Fo$(INTDIR)/ /c  $(SOURCE) 

!ELSEIF  "$(CFG)" == "Win32 Debug"

# ADD BASE CPP /Yc"STDAFX.H"
# ADD CPP /Yc"STDAFX.H"

.\WinDebug\STDAFX.OBJ :  $(SOURCE)  $(DEP_STDAF) $(INTDIR)
   $(CPP) /nologo /MT /W3 /GX /Zi /Od /I "..\..\..\include" /I "..\..\include"\
 /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /FR$(INTDIR)/\
 /Fp$(OUTDIR)/"VSDEPT32.pch" /Yc"STDAFX.H" /Fo$(INTDIR)/\
 /Fd$(OUTDIR)/"VSDEPT32.pdb" /c  $(SOURCE) 

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\VSDEPT2.CPP
DEP_VSDEPT=\
	.\stdafx.h\
	.\vsdept2.h\
	.\mainfrm.h\
	.\vsdepdoc.h\
	.\vsdepvw.h\
	\v2dev\cpp\include\oracl.h\
	\v2dev\cpp\omfc\include\omfc.h\
	\v2dev\cpp\include\OBound.h

!IF  "$(CFG)" == "Win32 Release"

.\WinRel\VSDEPT2.OBJ :  $(SOURCE)  $(DEP_VSDEPT) $(INTDIR) .\WinRel\STDAFX.OBJ

!ELSEIF  "$(CFG)" == "Win32 Debug"

.\WinDebug\VSDEPT2.OBJ :  $(SOURCE)  $(DEP_VSDEPT) $(INTDIR)\
 .\WinDebug\STDAFX.OBJ

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\MAINFRM.CPP
DEP_MAINF=\
	.\stdafx.h\
	.\vsdept2.h\
	.\mainfrm.h

!IF  "$(CFG)" == "Win32 Release"

.\WinRel\MAINFRM.OBJ :  $(SOURCE)  $(DEP_MAINF) $(INTDIR) .\WinRel\STDAFX.OBJ

!ELSEIF  "$(CFG)" == "Win32 Debug"

.\WinDebug\MAINFRM.OBJ :  $(SOURCE)  $(DEP_MAINF) $(INTDIR)\
 .\WinDebug\STDAFX.OBJ

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\VSDEPDOC.CPP
DEP_VSDEPD=\
	.\stdafx.h\
	.\vsdept2.h\
	.\vsdepdoc.h

!IF  "$(CFG)" == "Win32 Release"

.\WinRel\VSDEPDOC.OBJ :  $(SOURCE)  $(DEP_VSDEPD) $(INTDIR) .\WinRel\STDAFX.OBJ

!ELSEIF  "$(CFG)" == "Win32 Debug"

.\WinDebug\VSDEPDOC.OBJ :  $(SOURCE)  $(DEP_VSDEPD) $(INTDIR)\
 .\WinDebug\STDAFX.OBJ

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\VSDEPVW.CPP
DEP_VSDEPV=\
	.\stdafx.h\
	.\vsdept2.h\
	.\vsdepdoc.h\
	.\vsdepvw.h\
	\v2dev\cpp\include\oracl.h\
	\v2dev\cpp\omfc\include\omfc.h\
	\v2dev\cpp\include\OBound.h

!IF  "$(CFG)" == "Win32 Release"

.\WinRel\VSDEPVW.OBJ :  $(SOURCE)  $(DEP_VSDEPV) $(INTDIR) .\WinRel\STDAFX.OBJ

!ELSEIF  "$(CFG)" == "Win32 Debug"

.\WinDebug\VSDEPVW.OBJ :  $(SOURCE)  $(DEP_VSDEPV) $(INTDIR)\
 .\WinDebug\STDAFX.OBJ

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\VSDEPT2.DEF
# End Source File
# End Group
# End Project
################################################################################
