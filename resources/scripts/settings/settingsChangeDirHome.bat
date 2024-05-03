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

:settingsChangeDirHome
call tui windowSize %small_width% 23
color %theme_colors%
title Manage folders
cls
call tui bannerSmall
echo.
echo  Current download folder: 
echo  %loc%
echo.
echo  Current temporary folder:
echo  %tmp_loc%
echo.
call tui borderSmall
echo.
echo  (0) - Back
echo.
echo  (1) - Change download folder
echo.
echo  (2) - Change temporary folder
echo.
call tui borderSmallHalf
echo.
choice /c 012 /n /m "Select Option (0-2): "
if /i %errorlevel% == 1 goto :EOF
if /i %errorlevel% == 2 call settingsChangeDir & goto settingsChangeDirHome
if /i %errorlevel% == 3 call settingsChangeTmpDir & goto settingsChangeDirHome
