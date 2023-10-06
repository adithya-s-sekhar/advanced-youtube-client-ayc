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
set "settings_dir="
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
echo  * Leave blank and Enter to Go Back.
echo.
echo  * Enter R to reset to default location.
echo.
call tui borderSmallHalf
echo.
set /p settings_dir=Drag and Drop/Paste here: 
if %loc_invalid% == 0 if not defined settings_dir goto :EOF
if %loc_invalid% == 1 if not defined settings_dir goto settingsChangeDir
set settings_dir=%settings_dir:"=%
if "%settings_dir%" == "r" set settings_dir=%aycroot%\resources\Output
if "%settings_dir%" == "R" set settings_dir=%aycroot%\resources\Output
echo "%settings_dir%">"%aycdata%\dir.txt"
set loc="%settings_dir%"
set loc=%loc:"=%
if not exist "%loc%\" md "%loc%"
if not exist "%loc%\" set loc_invalid=1 && goto settingsChangeDir
goto :EOF
