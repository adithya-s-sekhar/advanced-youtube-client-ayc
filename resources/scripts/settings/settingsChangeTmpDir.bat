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

:settingsChangeTmpDir
call tui windowSize %small_width% 30
color %theme_colors%
title Change temporary folder location
cls
set settings_tmp_dir=null
call tui bannerSmall
echo.
if /i %tmp_loc_invalid% == 0 echo  Current temporary folder:
if /i %tmp_loc_invalid% == 1 echo  Invalid temporary folder:
echo  %tmp_loc%
echo.
call tui borderSmall
echo.
echo  * Drag and Drop the folder you want AYC to save it's 
echo    temporary files into the below area. Or type/paste 
echo    the location manually.
echo.
echo    Then Press Enter to save.
echo.
if /i %tmp_loc_invalid% == 0 (
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
if /i %tmp_loc_invalid% == 0 if /i "%cleaner_input%" equ "null" goto :EOF
if /i %tmp_loc_invalid% == 1 if /i "%cleaner_input%" equ "null" goto settingsChangeTmpDir
call cleaner "lws"
call cleaner "tws"
if /i "%cleaner_input%" equ "" goto settingsChangeTmpDir
if /i "%cleaner_input%" equ " =" goto settingsChangeTmpDir

set settings_tmp_dir=%cleaner_input%

if /i "%settings_tmp_dir%" == "r" set settings_tmp_dir=%aycroot%\resources\tmp
if /i "%settings_tmp_dir%" == "R" set settings_tmp_dir=%aycroot%\resources\tmp

echo "%settings_tmp_dir%">"%aycdata%\tmp_dir.txt"
set tmp_loc="%settings_tmp_dir%"
set tmp_loc=%tmp_loc:"=%
if not exist "%tmp_loc%\" md "%tmp_loc%"
if not exist "%tmp_loc%\" set tmp_loc_invalid=1 & goto settingsChangeTmpDir
if exist "%tmp_loc%\" set tmp_loc_invalid=0
goto :EOF
