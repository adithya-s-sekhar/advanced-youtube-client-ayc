:: Advanced Youtube Client - AYC
:: Copyright (C) 2023  Adithya S Sekhar
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

:settingsChangeDir
call tui windowSize %small_width% 30
color %theme_colors%
title Change download folder location
cls
set settings_dir=null
call tui bannerSmall
echo.
if %loc_invalid% == 0 echo  Current download folder:
if %loc_invalid% == 1 echo  Invalid download folder:
echo  %loc%
echo.
call tui borderSmall
echo.
echo  * Drag and Drop the folder you want AYC to save
echo    it's downloads into the below area. Or type/paste the 
echo    location manually.
echo.
echo    Then Press Enter to save.
echo.
if %loc_invalid% == 0 (
    echo  * Leave blank and Enter to Go Back.
) else (
    echo  * Enter a valid path!
)
echo.
echo  * Enter R to reset to default location.
echo.
call tui borderSmallHalf
echo.
call cleaner "input"
set /p cleaner_input=Drag and Drop/Paste here: 

call cleaner "dq"
if %loc_invalid% == 0 if "%cleaner_input%" equ "null" goto :EOF
if %loc_invalid% == 1 if "%cleaner_input%" equ "null" goto settingsChangeDir
call cleaner "lws"
call cleaner "tws"
if "%cleaner_input%" equ "" goto settingsChangeDir
if "%cleaner_input%" equ " =" goto settingsChangeDir

set settings_dir=%cleaner_input%

if "%settings_dir%" == "r" set settings_dir=%aycroot%\Downloads
if "%settings_dir%" == "R" set settings_dir=%aycroot%\Downloads

echo "%settings_dir%">"%aycdata%\dir.txt"
set loc="%settings_dir%"
set loc=%loc:"=%
if not exist "%loc%\" md "%loc%"
if not exist "%loc%\" set loc_invalid=1 & goto settingsChangeDir
if exist "%loc%\" set loc_invalid=0
goto :EOF
