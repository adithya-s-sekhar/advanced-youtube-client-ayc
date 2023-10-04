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

:urlHistory
call tui windowSize %small_width% 27
color %theme_colors%
title URL History
cls
call tui bannerSmall
echo.
echo  URL History
echo.
echo  AYC keeps a simple history of all urls it attempted to
echo  download in to two text files.
echo.
echo  Batch job urls are not saved here. They are saved in 
echo  their own respective job folder.
echo.
call tui borderSmall
echo.
echo  (0) - Back
echo.
echo  (1) - Open downloaded URLs list
echo.
echo  (2) - Open failed URLs list
echo.
echo  (3) - Open History folder
echo.
call tui borderSmallHalf
echo.
choice /c 0123 /n /m "Select Option (0-3): "
if %errorlevel% == 1 goto :EOF
if %errorlevel% == 2 start notepad.exe "%aychome%\history\downloaded.txt"
if %errorlevel% == 3 start notepad.exe "%aychome%\history\failed.txt"
if %errorlevel% == 4 start explorer.exe "%aychome%\history"
goto urlHistory
