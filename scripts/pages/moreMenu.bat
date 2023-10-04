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

:moreMenu
call tui windowSize %small_width% 25
color %theme_colors%
title More Options
cls
call tui bannerSmall
echo.
echo  (0) - Back
echo.
echo  (1) - Batch Mode             - QuickKey: b
echo.
echo  (2) - URL History            - QuickKey: h
echo.
echo  (3) - Settings               - QuickKey: s
echo.
echo  (4) - About
echo.
echo  (5) - Visit on GitHub        - QuickKey: g
echo.
echo  (6) - Visit on Sourceforge   - QuickKey: sf
echo.
echo  (7) - Follow on Telegram
echo.
call tui borderSmallHalf
echo.
choice /c 01234567 /n /m "Select Option (0-7): "
if %errorlevel% == 1 goto :EOF
if %errorlevel% == 2 start AYClient.bat "b"
if %errorlevel% == 3 call urlHistory
if %errorlevel% == 4 call settingsMenu
if %errorlevel% == 5 call about
if %errorlevel% == 6 start "" "https://github.com/adithya-s-sekhar/advanced-youtube-client-ayc"
if %errorlevel% == 7 start "" "https://sourceforge.net/projects/advanced-youtube-client-ayc"
if %errorlevel% == 8 start "" "https://t.me/ayc_news"
goto moreMenu
