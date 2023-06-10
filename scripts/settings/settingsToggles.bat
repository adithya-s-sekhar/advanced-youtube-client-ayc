set settingsToggles.arg1=%~1

call :settings%settingsToggles.arg1%

goto :EOF

:settingsChangeAria2
if %aria2_status% == 0 (
    set aria2_status=1
    echo "1">"%aycdata%\aria2_status.txt"
    goto :EOF
)
if %aria2_status% == 1 (
    set aria2_status=0
    echo "0">"%aycdata%\aria2_status.txt"
    goto :EOF
)

:settingsChangeThumbs
if %thumbs_status% == 0 (
    set thumbs_status=1
    echo "1">"%aycdata%\thumbs_status.txt"
    goto :EOF
)
if %thumbs_status% == 1 (
    set thumbs_status=0
    echo "0">"%aycdata%\thumbs_status.txt"
    goto :EOF
)

:settingsChangeSubs
if %subs_status% == 0 (
    set subs_status=1
    echo "1">"%aycdata%\subs_status.txt"
    goto :EOF
)
if %subs_status% == 1 (
    set subs_status=0
    echo "0">"%aycdata%\subs_status.txt"
    goto :EOF
)
