set quickKey.arg1=%~1

set quickkey_validator=0

echo %quickKey.arg1% | findstr /i /r /c:"\<a\>" /c:"\<b\>" /c:"\<c\>" /c:"\<d\>" /c:"\<g\>" /c:"\<m\>" /c:"\<s\>" /c:"\<sf\>" /c:"\<t\>" /c:"\<u\>" > nul
if %errorlevel% == 0 (
    set quickkey_validator=1
) else (
    goto :EOF
)

if "%quickKey.arg1%" equ "a" call settingsToggles changeAria2 && goto :EOF
if "%quickKey.arg1%" equ "A" call settingsToggles changeAria2 && goto :EOF
if "%quickKey.arg1%" equ "b" start AYClient.bat "b" dummy "%cookie_loaded%" && goto :EOF
if "%quickKey.arg1%" equ "B" start AYClient.bat "b" dummy "%cookie_loaded%" && goto :EOF
if "%quickKey.arg1%" equ "c" call toggleCookie && goto :EOF
if "%quickKey.arg1%" equ "C" call toggleCookie && goto :EOF
if "%quickKey.arg1%" equ "d" call settingsChangeDir && goto :EOF
if "%quickKey.arg1%" equ "D" call settingsChangeDir && goto :EOF
if "%quickKey.arg1%" equ "g" start "" "https://github.com/adithya-s-sekhar/advanced-youtube-client-ayc" && goto :EOF
if "%quickKey.arg1%" equ "G" start "" "https://github.com/adithya-s-sekhar/advanced-youtube-client-ayc" && goto :EOF
if "%quickKey.arg1%" equ "m" call moreMenu && goto :EOF
if "%quickKey.arg1%" equ "M" call moreMenu && goto :EOF
if "%quickKey.arg1%" equ "s" call settingsMenu && goto :EOF
if "%quickKey.arg1%" equ "S" call settingsMenu && goto :EOF
if "%quickKey.arg1%" equ "sf" start "" "https://sourceforge.net/projects/advanced-youtube-client-ayc" && goto :EOF
if "%quickKey.arg1%" equ "SF" start "" "https://sourceforge.net/projects/advanced-youtube-client-ayc" && goto :EOF
if "%quickKey.arg1%" equ "t" call settingsToggles changeTheme && goto :EOF
if "%quickKey.arg1%" equ "T" call settingsToggles changeTheme && goto :EOF
if "%quickKey.arg1%" equ "u" call settingsYtUpdate && goto :EOF
if "%quickKey.arg1%" equ "U" call settingsYtUpdate && goto :EOF
goto :EOF
