#
# This is called by the core addon feature from the FLTK core library.
#
# FL_ADDON_BASE (input) is the absolute path to this addon
#
# FL_ADDON_SOURCES (input/output) extended with list of extra source files
# FL_ADDON_INCLUDE_DIRECTORIES (input/output) extended with list of extra include directories
# FL_ADDON_LINK_DIRECTORIES (input/output) extended with list of extra library directories
# FL_ADDON_LIBS (input/output) extended with list of extra libraries
#

list(APPEND HEADER_FILES
  ${FL_ADDON_BASE}/FL/Fl_Native_Input.H
)

#######################################################################
# inclusion of class Fl_Native_Input
#######################################################################
list(APPEND FL_ADDON_SOURCES ${FL_ADDON_BASE}/src/Fl_Native_Input.cxx)
if(FLTK_USE_CAIRO)
  if(NOT PKG_CONFIG_FOUND)
    message(FATAL_ERROR "Option FLTK_OPTION_NATIVE_INPUT requires availability of pkg-config on the build machine.")
  endif(NOT PKG_CONFIG_FOUND)
  pkg_check_modules(GTK3 IMPORTED_TARGET gtk+-3.0)
  if(NOT(GTK3_FOUND))
    message(FATAL_ERROR "Module 'gtk+-3.0' required for FLTK_OPTION_NATIVE_INPUT is absent")
  endif(NOT(GTK3_FOUND))
  list(APPEND FL_ADDON_SOURCES ${FL_ADDON_BASE}/src/drivers/Cairo/Fl_Cairo_Native_Input_Driver.cxx)
  list(APPEND FL_ADDON_LIBS PkgConfig::GTK3)
elseif(WIN32)
  list(APPEND FL_ADDON_SOURCES ${FL_ADDON_BASE}/src/drivers/WinAPI/Fl_WinAPI_Native_Input_Driver.cxx)
elseif(APPLE)
  list(APPEND FL_ADDON_SOURCES ${FL_ADDON_BASE}/src/drivers/Cocoa/Fl_Cocoa_Native_Input_Driver.mm)
else()
  list(APPEND FL_ADDON_SOURCES ${FL_ADDON_BASE}/src/Fl_Backup_Native_Input.cxx)
endif()
