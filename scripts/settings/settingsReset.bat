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

:settingsReset
call tui windowSize %small_width% 20
color 0C
title Reset AYC
cls
call tui bannerSmall
echo.
echo  You are about to reset AYC to it's default settings.
echo.
echo  This should fix any issues caused by incorrect or corrupted settings.
echo.
call tui borderSmall
echo.
echo  (0) - Back
echo.
echo  (1) - Reset and Exit AYC
echo.
call tui borderSmallHalf
echo.
choice /C 01 /n /m "Select Option (0-1): "
if %errorlevel% == 1 goto :EOF
goto settingsResetFinish

:settingsResetFinish
call tui windowSize %small_width% 20
del /q "%aycdata%\first_run.txt"
del /q "%aycdata%\dir.txt"
del /q "%aycdata%\tmp_dir.txt"
del /q "%aycdata%\try.txt"
del /q "%aycdata%\aria2_status.txt"
del /q "%aycdata%\thumbs_status.txt"
del /q "%aycdata%\subs_status.txt"
del /q "%aycdata%\external_version.txt"
del /q "%aycdata%\youtube_dl_version.txt"
title Reset Succesfully
color 02
cls
call tui bannerSmall
echo.
echo  AYC reset succesfully.
echo.
timeout /t 5 /nobreak
exit
