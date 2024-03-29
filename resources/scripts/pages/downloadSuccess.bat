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

:downloadSuccess
if defined url call saveHistory success
if /i %cookie_loaded% == 1 (
    call tui windowSize %small_width% 24
) else (
    call tui windowSize %small_width% 22
)
color 2F
title Download Finished
cls
call tui bannerSmall
echo.
echo  Download Finished.
echo.
if /i %error_mode% == batch (
    echo  Job: %job_name%%
) else (
    echo  URL: %url%
)
echo.
if /i %cookie_loaded% == 1 (
    echo  Using cookies.txt.
    echo.
)
echo  The files are saved in:
echo  %loc%
echo.
call tui borderSmall
echo.
echo  (0) - Close
echo.
echo  (1) - Open downloads folder
echo.
call tui borderSmallHalf
echo.
echo Select Option (0-1): 
choice /c 01 /n
if /i %errorlevel% == 1 goto :EOF
if /i %errorlevel% == 2 start %loc%
