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

:settingsChangeDefinedTry
call tui windowSize %small_width% 20
color %theme_colors%
title Change retry attempts
cls
set settings_try=null
call tui bannerSmall
echo.
if /i %try_invalid% == 0 echo  Current retry attempts: %defined_try%
if /i %try_invalid% == 1 echo  Invalid value: %defined_try%
echo.
call tui borderSmall
echo.
echo  * The number you set here is the number of times AYC
echo    will retry the download if an error occurs.
echo.
if /i %try_invalid% == 0 (
    echo  * Leave blank and Enter to Go back.
) else (
    echo  * Enter a valid number.
)
echo.
echo  * Enter R to reset to default value.
echo.
call tui borderSmallHalf
echo.
call cleaner "input"
set /p cleaner_input=No. of retry attempts: 

call cleaner "dq"
if /i %try_invalid% == 0 if /i "%cleaner_input%" equ "null" goto :EOF
if /i %try_invalid% == 1 if /i "%cleaner_input%" equ "null" goto settingsChangeDefinedTry
call cleaner "ws"
if /i "%cleaner_input%" equ "" goto settingsChangeDefinedTry
if /i "%cleaner_input%" equ " =" goto settingsChangeDefinedTry

set settings_try=%cleaner_input%

if /i %settings_try% == r set settings_try=0

echo "%settings_try%">"%aycdata%\try.txt"
set defined_try="%settings_try%"
set defined_try=%defined_try:"=%
echo %defined_try%| findstr /r "^[0-9][0-9]*$">nul
if not %errorlevel% == 0 set try_invalid=1 & goto settingsChangeDefinedTry
if /i %try_invalid% == 1 set try_invalid=0
set /a max_try=%defined_try%+1
goto :EOF
