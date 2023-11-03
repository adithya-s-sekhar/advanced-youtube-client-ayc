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

:about
call tui windowSize %small_width% 31
color %theme_colors%
title You're a curious one..
cls
call tui bannerSmall
echo.
echo   Advanced Youtube Client - AYC Script
echo.
echo   Author           : Adithya S Sekhar
echo.
echo   First Release    : v1.0 (13/Aug/2016)
echo.
echo   Current Release  : v%major_ver%.%minor_ver% (%ver_date%)
echo.
echo   Made in Kerala.
echo.
echo   Released under the GPLv3 or newer License.
echo.
call tui borderSmall
echo.
echo  (0) - Back
echo.
echo  (1) - GitHub
echo.
echo  (2) - Sourceforge
echo.
echo  (3) - Telegram (Try latest test builds)
echo.
call tui borderSmallHalf
echo.
choice /c 0123 /n /m "Select Option (0-3): "
if %errorlevel% == 1 goto :EOF
if %errorlevel% == 2 start "" "https://github.com/adithya-s-sekhar/advanced-youtube-client-ayc"
if %errorlevel% == 3 start "" "https://sourceforge.net/projects/advanced-youtube-client-ayc"
if %errorlevel% == 4 start "" "https://t.me/s/ayc_news"
goto :about
