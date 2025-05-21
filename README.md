**CAUTION**: FLTK addons are experimental as of today and subject to any kind of change.

This repository is an FLTK addon that extends the FLTK library with class `Fl_Native_Input` derived from `Fl_Input`.
This new class gives FLTK support of right-to-left scripts for text input and edition.

Usage:
- Have local copies of two git repositories at hand:
1. the FLTK repository in an addon-enabled version (branch `core_addons` of https://github.com/MatthiasWM/fltk)
2. this repository
- Create a build directory, e.g., subdirectory build of the local FLTK repo
- Run these commands:
```
cmake -B [the build dir] -S [the local FLTK repo copy] -DFLTK_CORE_ADDONS=[the local copy of this repo]
cd [the build dir]
make native_input
```
This will build in `<build dir>/lib` a version of the FLTK library extended with class `Fl_Native_Input` and an example
program using this class at `<build dir>/bin/test/native_input`.

Building the FLTK html documentation requires at present these operations:
- Edit file `<build dir>/documentation/Doxyfile`. Add these 2 lines
```
[the local copy of this repo]/FL \
[the local copy of this repo]/src
```
at the end of the `INPUT`section of this file.
- Run command: `make html`

The resulting html documentation will be accessible at `<build dir>/documentation/html/index.html`.
