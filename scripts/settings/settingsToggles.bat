set settingsToggles.arg1=%~1

call :settings%settingsToggles.arg1%

goto :EOF

:settingsChangeAria2
if %aria2_status% equ 0 (
    set /a aria2_status=1
    echo "1">"%aycdata%\aria2_status.txt"
    goto :EOF
)
if %aria2_status% equ 1 (
    set /a aria2_status=2
    echo "2">"%aycdata%\aria2_status.txt"
    goto :EOF
)
if %aria2_status% equ 2 (
    set /a aria2_status=0
    echo "0">"%aycdata%\aria2_status.txt"
    goto :EOF
)

:settingsChangeThumbs
if %thumbs_status% equ 0 (
    set /a thumbs_status=1
    echo "1">"%aycdata%\thumbs_status.txt"
    goto :EOF
)
if %thumbs_status% equ 1 (
    set /a thumbs_status=0
    echo "0">"%aycdata%\thumbs_status.txt"
    goto :EOF
)

:settingsChangeSubs
if %subs_status% equ 0 (
    set /a subs_status=1
    echo "1">"%aycdata%\subs_status.txt"
    goto :EOF
)
if %subs_status% equ 1 (
    set /a subs_status=0
    echo "0">"%aycdata%\subs_status.txt"
    goto :EOF
)
