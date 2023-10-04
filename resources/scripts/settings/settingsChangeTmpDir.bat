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

:settingsChangeTmpDir
call tui windowSize %small_width% 30
color %theme_colors%
title Change temporary folder location
cls
set "settings_tmp_dir="
call tui bannerSmall
echo.
if %tmp_loc_invalid% == 0 echo  Current temporary folder:
if %tmp_loc_invalid% == 1 echo  Invalid temporary folder:
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
echo  * Leave blank and Enter to Go Back.
echo.
echo  * Enter R to reset to default location.
echo.
call tui borderSmallHalf
echo.
set /p settings_tmp_dir=Drag and Drop/Paste here: 
if %tmp_loc_invalid% == 0 if not defined settings_tmp_dir goto :EOF
if %tmp_loc_invalid% == 1 if not defined settings_tmp_dir goto settingsChangeTmpDir
set settings_tmp_dir=%settings_tmp_dir:"=%
if "%settings_tmp_dir%" == "r" set settings_tmp_dir=%aychome%\tmp
if "%settings_tmp_dir%" == "R" set settings_tmp_dir=%aychome%\tmp
echo "%settings_tmp_dir%">"%aycdata%\tmp_dir.txt"
set tmp_loc="%settings_tmp_dir%"
set tmp_loc=%tmp_loc:"=%
if not exist "%tmp_loc%\" md "%tmp_loc%"
if not exist "%tmp_loc%\" set tmp_loc_invalid=1 && goto settingsChangeTmpDir
goto :EOF
