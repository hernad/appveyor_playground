rem Matrix-driven Appveyor CI script for libmypaint
rem Currently only does MSYS2 builds.
rem https://www.appveyor.com/docs/installed-software#mingw-msys-cygwin
rem Needs the following vars:
rem    MSYS2_ARCH:  x86_64 or i686
rem    MSYSTEM:  MINGW64 or MINGW32

rem Set the paths appropriately
PATH C:\msys64\%MSYSTEM%\bin;C:\msys64\usr\bin;%PATH%

rem Upgrade the MSYS2 platform
REM bash -lc "pacman --noconfirm --sync --refresh --refresh pacman"
REM bash -lc "pacman --noconfirm --sync --refresh --refresh --sysupgrade --sysupgrade"
bash -xlc "pacman --noconfirm -S curl zip"

rem Install required tools
REM bash -xlc "pacman --noconfirm -S --needed base-devel"

rem Install the relevant native dependencies
REM bash -xlc "pacman --noconfirm -S --needed mingw-w64-%MSYS2_ARCH%-json-c"
REM bash -xlc "pacman --noconfirm -S --needed mingw-w64-%MSYS2_ARCH%-glib2"
REM bash -xlc "pacman --noconfirm -S --needed mingw-w64-%MSYS2_ARCH%-gobject-introspection"

rem Invoke subsequent bash in the build tree
cd %APPVEYOR_BUILD_FOLDER%
bash -xlc "cd /c ; curl -LO https://dl.bintray.com/hernad/windows/hbwin.tar.gz ; tar xf hbwin.tar.gz"
PATH C:\hbwin\bin;%PATH%

set CHERE_INVOKING=yes

rem Build/test scripting
bash -xlc "set pwd"
REM bash -xlc "env"
REM bash -xlc "hbmk2 -version"

REM bash -xlc "./autogen.sh"
REM bash -xlc "./configure"
REM bash -xlc "make distcheck"

REM bash -xlc "gcc --version"

bash -xlc "hbmk2 -gtstd hello.prg ; ./hello.exe ; zip hello_${APPVEYOR_REPO_TAG_NAME}.zip hello.exe"