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

:moreMenu
call tui windowSize %small_width% 21
color %theme_colors%
title More Options
cls
call tui bannerSmall
echo.
echo  (0) - Back
echo.
echo  (1) - Batch Mode (b)
echo.
echo  (2) - Download History (h)
echo.
echo  (3) - Settings (s)
echo.
echo  (4) - Create desktop shortcuts
echo.
echo  (5) - About
echo.
call tui borderSmallHalf
echo.
choice /c 012345 /n /m "Select Option (0-5): "
if /i %errorlevel% == 1 goto :EOF
if /i %errorlevel% == 2 start AYClient.bat "b" & goto moreMenu
if /i %errorlevel% == 3 start notepad.exe "%aycroot%\resources\history\download-history.txt" & goto moreMenu
if /i %errorlevel% == 4 call settingsMenu & goto moreMenu
if /i %errorlevel% == 5 call createShortcut all & goto moreMenu
if /i %errorlevel% == 6 call about & goto moreMenu
