
:: Advanced Youtube Client - AYC
:: Copyright (C) 2024  Adithya S Sekhar
::
:: This program is free software: you can redistribute it and/or modify
:: it under the terms of the GNU General Public License as published by
:: the Free Software Foundation, either version 3 of the License, or
:: (at your option) any later version.
::
:: This program is distributed in the hope that it will be useful,
:: but WITHOUT ANY WARRANTY; without even the implied warranty of
:: MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
:: GNU General Public License for more details.
::
:: You should have received a copy of the GNU General Public License
:: along with this program.  If not, see <https://www.gnu.org/licenses/>.

set settingsToggles.arg1=%~1

call :toggle%settingsToggles.arg1%

call :save%settingsToggles.arg1%

goto :EOF

:toggleChangeAria2
if /i %aria2_status% == 0 (
    set aria2_status=1
    goto :EOF
)
if /i %aria2_status% == 1 (
    set aria2_status=2
    goto :EOF
)
if /i %aria2_status% == 2 (
    set aria2_status=0
    goto :EOF
)

:toggleChangeThumbs
if /i %thumbs_status% == 0 (
    set thumbs_status=1
    goto :EOF
)
if /i %thumbs_status% == 1 (
    set thumbs_status=0
    goto :EOF
)

:toggleChangeSubs
if /i %subs_status% == 0 (
    set subs_status=1
    goto :EOF
)
if /i %subs_status% == 1 (
    set subs_status=0
    goto :EOF
)

:toggleChangeTheme
if /i %theme_status% == 0 (
    set theme_status=1
    goto :EOF
)
if /i %theme_status% == 1 (
    set theme_status=2
    goto :EOF
)
if /i %theme_status% == 2 (
    set theme_status=3
    goto :EOF
)
if /i %theme_status% == 3 (
    set theme_status=4
    goto :EOF
)
if /i %theme_status% == 4 (
    set theme_status=5
    goto :EOF
)
if /i %theme_status% == 5 (
    set theme_status=0
    goto :EOF
)

:toggleYtUpdateOnStart
if /i %ytupd_onstart% == 0 (
    set ytupd_onstart=1
    goto :EOF
)
if /i %ytupd_onstart% == 1 (
    set ytupd_onstart=0
    goto :EOF
)

:toggleChangeSubType
if /i %sub_type% == 1 (
    set sub_type=2
    goto :EOF
)
if /i %sub_type% == 2 (
    set sub_type=1
    goto :EOF
)

:saveChangeAria2
echo "%aria2_status%">"%aycdata%\aria2_status.txt"
goto :EOF

:saveChangeThumbs
echo "%thumbs_status%">"%aycdata%\thumbs_status.txt"
goto :EOF

:saveChangeSubs
echo "%subs_status%">"%aycdata%\subs_status.txt"
goto :EOF

:saveChangeTheme
call themer
echo "%theme_status%">"%aycdata%\theme_status.txt"
goto :EOF

:saveYtUpdateOnStart
echo "%ytupd_onstart%">"%aycdata%\ytupd_onstart.txt"
goto :EOF

:saveChangeSubType
echo "%sub_type%">"%aycdata%\sub_type.txt"
goto :EOF
