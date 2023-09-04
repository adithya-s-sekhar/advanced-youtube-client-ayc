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
    set aria2_status=2
    echo "2">"%aycdata%\aria2_status.txt"
    goto :EOF
)
if %aria2_status% == 2 (
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

:settingsChangeTheme
if %theme_status% == 0 (
    set theme_status=1
    echo "1">"%aycdata%\theme_status.txt"
    call themer
    goto :EOF
)
if %theme_status% == 1 (
    set theme_status=2
    echo "2">"%aycdata%\theme_status.txt"
    call themer
    goto :EOF
)
if %theme_status% == 2 (
    set theme_status=3
    echo "3">"%aycdata%\theme_status.txt"
    call themer
    goto :EOF
)
if %theme_status% == 3 (
    set theme_status=4
    echo "4">"%aycdata%\theme_status.txt"
    call themer
    goto :EOF
)
if %theme_status% == 4 (
    set theme_status=5
    echo "5">"%aycdata%\theme_status.txt"
    call themer
    goto :EOF
)
if %theme_status% == 5 (
    set theme_status=0
    echo "0">"%aycdata%\theme_status.txt"
    call themer
    goto :EOF
)

:settingsYtUpdateOnStart
if %ytupd_onstart% == 0 (
    set ytupd_onstart=1
    echo "1">"%aycdata%\ytupd_onstart.txt"
    goto :EOF
)
if %ytupd_onstart% == 1 (
    set ytupd_onstart=0
    echo "0">"%aycdata%\ytupd_onstart.txt"
    goto :EOF
)
