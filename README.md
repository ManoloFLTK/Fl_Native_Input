**CAUTION**: FLTK addons are experimental as of today and subject to any kind of change.

This repository is an FLTK addon that extends the FLTK library with class `Fl_Native_Input` derived from `Fl_Input`.
This new class gives FLTK support of right-to-left scripts for text input and edition.

Usage:
1. Have local copies of two git repositories at hand:
 - the FLTK repository in an addon-enabled version (Today: branch `core_addons` of https://github.com/MatthiasWM/fltk);
 - this repository.
2. Create a build directory, e.g., subdirectory build of the local FLTK repo.
3. Run these commands:
```
cmake   -B <build dir>   -S <local FLTK repo copy>   -DFLTK_CORE_ADDONS=<local copy of this repo>
cd <build dir>
make native_input
```
This will build in `<build dir>/lib` a version of the FLTK library extended with class `Fl_Native_Input` and an example
program using this class at `<build dir>/bin/test/native_input`.

Building the FLTK html documentation requires at present these operations:
1. Edit file `<build dir>/documentation/Doxyfile`. Add these 2 lines
```
<local copy of this repo>/FL \
<local copy of this repo>/src
```
at the end of the `INPUT`section of this file.

2. Run command: `make html`

The resulting html documentation will be accessible at `<build dir>/documentation/html/index.html`.
