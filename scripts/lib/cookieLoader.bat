set cookieLoader.arg1=%~1

if %cookieLoader.arg1% == load goto loadCookie
if %cookieLoader.arg1% == unload goto unloadCookie

goto :EOF

:loadCookie
set cookies=--cookies cookies.txt
set cookie_loaded=1
goto :EOF

:unloadCookie
set "cookies="
set cookies= 
set cookie_loaded=0
goto :EOF
