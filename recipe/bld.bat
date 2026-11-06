cmake %CMAKE_ARGS% -G Ninja -S . -B build -DCMAKE_INSTALL_PREFIX="%LIBRARY_PREFIX%" -DUTF8CPP_ENABLE_TESTS=OFF
if errorlevel 1 exit 1
cmake --build build
if errorlevel 1 exit 1
cmake --install build
if errorlevel 1 exit 1

rem Preserve the established include layout for existing consumers.
copy /y source\utf8.h "%LIBRARY_INC%\"
if errorlevel 1 exit 1
xcopy /e /i /y source\utf8 "%LIBRARY_INC%\utf8\"
if errorlevel 1 exit 1
