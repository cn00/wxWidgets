#!#############################################################################
#! File:    vc6dll.t
#! Purpose: tmake template file from which wxWinDll.dsp is generated by running
#!          tmake -t vc6dll wxwin.pro -o wxWinDll.dsp
#! Author:  Vadim Zeitlin
#! Created: 13.10.99
#! Version: $Id$
#!#############################################################################
#${
    #! include the code which parses filelist.txt file and initializes
    #! %wxCommon, %wxGeneric and %wxMSW hashes.
    IncludeTemplate("filelist.t");

    #! now transform these hashes into $project tags
    foreach $file (sort keys %wxGeneric) {
        next if $wxGeneric{$file} =~ /\b(PS|G|16|U)\b/;
        $project{"WXGENERICSRCS"} .= $file . " "
    }

    foreach $file (sort keys %wxCommon) {
        next if $wxCommon{$file} =~ /\b16\b/;

        my $tag = $file =~ /\.c$/ ? "WXCSRCS" : "WXCOMMONSRCS";
        $project{$tag} .= $file . " "
    }

    foreach $file (sort keys %wxMSW) {
        next if $wxMSW{$file} =~ /\b16\b/;

        my $tag;
        if ( $wxMSW{$file} =~ /\bO\b/ ) { $tag = "WXOLESRCS" }
        else { $tag = $file =~ /\.c$/ ? "WXMSWCSRCS" : "WXMSWSRCS" }
        $project{$tag} .= $file . " "
    }

    foreach $file (sort keys %wxHTML) {
        next if $wxHTML{$file} =~ /\b16\b/;
        $project{"WXHTMLSRCS"} .= $file . " "
    }
#$}
# Microsoft Developer Studio Project File - Name="wxWinDll" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Dynamic-Link Library" 0x0102

CFG=wxWinDll - Win32 Debug
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "wxWinDll.mak".
!MESSAGE 
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "wxWinDll.mak" CFG="wxWinDll - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "wxWinDll - Win32 Release" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "wxWinDll - Win32 Debug" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE 

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""
# PROP Scc_LocalPath ""
CPP=cl.exe
MTL=midl.exe
RSC=rc.exe

!IF  "$(CFG)" == "wxWinDll - Win32 Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "Release"
# PROP BASE Intermediate_Dir "Release"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "ReleaseDLL"
# PROP Intermediate_Dir "ReleaseDLL"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MD /W4 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "WXWINDLL_EXPORTS" /YX /FD /c
# ADD CPP /nologo /MD /W4 /GX /O2 /I "$(wx)\include" /I "$(wx)\src\zlib" /I "$(wx)\src\jpeg" /I "$(wx)\src\png" /I "$(wx)\src\tiff" /D "NDEBUG" /D wxUSE_GUI=1 /D "WIN32" /D "_WINDOWS" /D "_USRDLL" /D "WXWINDLL_EXPORTS" /D "__WXMSW__" /D "__WIN95__" /D "__WINDOWS__" /D "__WIN32__" /D "WXMAKINGDLL" /Yu"wx/wxprec.h" /FD /c
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x409 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib src\jpeg\Release\jpeg.lib src\tiff\Release\tiff.lib src\png\Release\png.lib src\xpm\Release\xpm.lib src\zlib\Release\zlib.lib /nologo /dll /machine:I386 /out:"ReleaseDll/wxmsw221.dll"
# ADD LINK32 kernel32.lib user32.lib gdi32.lib advapi32.lib comdlg32.lib shell32.lib ole32.lib oleaut32.lib odbc32.lib uuid.lib rpcrt4.lib comctl32.lib winmm.lib src\jpeg\Release\jpeg.lib src\tiff\Release\tiff.lib src\png\Release\png.lib src\xpm\Release\xpm.lib src\zlib\Release\zlib.lib /nologo /dll /machine:I386 /out:"ReleaseDll/wxmsw221.dll"

!ELSEIF  "$(CFG)" == "wxWinDll - Win32 Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "Debug"
# PROP BASE Intermediate_Dir "Debug"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "DebugDLL"
# PROP Intermediate_Dir "DebugDLL"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MDd /W4 /Gm /GX /ZI /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "WXWINDLL_EXPORTS" /YX /FD /GZ /c
# ADD CPP /nologo /MDd /W4 /Gm /ZI /Od /I "$(wx)\include" /I "$(wx)\src\zlib" /I "$(wx)\src\jpeg" /I "$(wx)\src\png" /I "$(wx)\src\tiff" /D "_DEBUG" /D "__WXDEBUG__" /D wxUSE_GUI=1 /D "WIN32" /D "_WINDOWS" /D "_USRDLL" /D "WXWINDLL_EXPORTS" /D "__WXMSW__" /D "__WIN95__" /D "__WINDOWS__" /D "__WIN32__" /D "WXMAKINGDLL" /Yu"wx/wxprec.h" /FD /GZ /c
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib src\jpeg\Debug\jpeg.lib src\tiff\Debug\tiff.lib src\png\Debug\png.lib src\xpm\Debug\xpm.lib src\zlib\Debug\zlib.lib /dll /debug /machine:I386 /pdbtype:sept /out:"DebugDll/wxmsw221d.dll"
# ADD LINK32 kernel32.lib user32.lib gdi32.lib advapi32.lib comdlg32.lib shell32.lib ole32.lib oleaut32.lib odbc32.lib uuid.lib rpcrt4.lib comctl32.lib wsock32.lib winmm.lib src\jpeg\Debug\jpeg.lib src\tiff\Debug\tiff.lib src\png\Debug\png.lib src\xpm\Debug\xpm.lib src\zlib\Debug\zlib.lib /nologo /dll /debug /machine:I386 /pdbtype:sept /out:"DebugDll/wxmsw221d.dll"

!ENDIF 

# Begin Target

# Name "wxWinDll - Win32 Release"
# Name "wxWinDll - Win32 Debug"

# PROP Default_Filter ""
# Begin Source File

SOURCE=.\src\msw\dummydll.cpp
# ADD CPP /Yc"wx/wxprec.h"
# End Source File
#$ ExpandGlue("WXMSWSRCS", "# Begin Source File\n\nSOURCE=.\\src\\msw\\", "\n# End Source File\n# Begin Source File\n\nSOURCE=.\\src\\msw\\", "\n# End Source File\n");
#$ ExpandGlue("WXOLESRCS", "# Begin Source File\n\nSOURCE=.\\src\\msw\\ole\\", "\n# End Source File\n# Begin Source File\n\nSOURCE=.\\src\\msw\\ole\\", "\n# End Source File\n");
#$ ExpandGlue("WXGENERICSRCS", "# Begin Source File\n\nSOURCE=.\\src\\generic\\", "\n# End Source File\n# Begin Source File\n\nSOURCE=.\\src\\generic\\", "\n# End Source File\n");
#$ ExpandGlue("WXCOMMONSRCS", "# Begin Source File\n\nSOURCE=.\\src\\common\\", "\n# End Source File\n# Begin Source File\n\nSOURCE=.\\src\\common\\", "\n# End Source File\n");
#$ ExpandGlue("WXCSRCS", "# Begin Source File\n\nSOURCE=.\\src\\common\\", "\n# SUBTRACT CPP /YX /Yc /Yu\n# End Source File\n# Begin Source File\n\nSOURCE=.\\src\\common\\", "\n# SUBTRACT CPP /YX /Yc /Yu\n# End Source File\n");
#$ ExpandGlue("WXMSWCSRCS", "# Begin Source File\n\nSOURCE=.\\src\\msw\\", "\n# SUBTRACT CPP /YX /Yc /Yu\n# End Source File\n# Begin Source File\n\nSOURCE=.\\src\\msw\\", "\n# SUBTRACT CPP /YX /Yc /Yu\n# End Source File\n");
#$ ExpandGlue("WXHTMLSRCS", "# Begin Source File\n\nSOURCE=.\\src\\html\\", "\n# End Source File\n# Begin Source File\n\nSOURCE=.\\src\\html\\", "\n# End Source File\n");

# Begin Source File

SOURCE=.\src\msw\version.rc
# End Source File
# Begin Source File

SOURCE=.\src\common\y_tab.c

!IF  "$(CFG)" == "wxWinDll - Win32 Release"

# SUBTRACT CPP /YX /Yc /Yu

!ELSEIF  "$(CFG)" == "wxWinDll - Win32 Debug"

# ADD CPP /W1
# SUBTRACT CPP /YX /Yc /Yu

!ENDIF 

# End Source File
# End Target
# End Project
