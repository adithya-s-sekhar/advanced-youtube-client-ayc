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

:firstRun
color %theme_colors%
title Welcome to AYC
cls
echo.
echo  License Agreement
echo.
echo  Advanced Youtube Client - AYC 
echo  Copyright (C) 2024 Adithya S Sekhar
echo  This program comes with ABSOLUTELY NO WARRANTY;
echo  This is free software, and you are welcome to redistribute it
echo  under certain conditions;
echo.
call tui borderMediumHalf
echo.
echo  By pressing Enter you are agreeing to the terms of this license.
pause>NUL
cls
echo.
echo  Welcome to AYC.
echo.
echo  Before you start we need to take care of a few things.
echo.
echo  This window may look weird and broken right now, don't worry.
echo  It'll be fixed by the time we are done.
echo.
call tui borderMediumHalf
echo.
echo  Press Enter to begin.
pause>NUL
cls
echo.
echo  (1/4) Setting up terminal
:autoreg1
echo.
echo  Making sure AYC safely opens in Windows Console Host
echo.
echo  - Setting DelegationTerminal..
timeout /t 1 /NOBREAK>nul
REG.exe ADD HKCU\Console\%%%%Startup /v DelegationTerminal /t REG_SZ /f /d {B23D10C0-E52E-411E-9D5B-C09FDF709C7D}>nul
if not %errorlevel% == 0 goto manualreg
:autoreg2
echo.
echo  - Setting DelegationConsole..
timeout /t 1 /NOBREAK>nul
REG.exe ADD HKCU\Console\%%%%Startup /v DelegationConsole /t REG_SZ /f /d {B23D10C0-E52E-411E-9D5B-C09FDF709C7D}>nul
if not %errorlevel% == 0 goto manualreg
echo.
call tui borderMediumHalf
echo.
echo  Auto setup succeeded.
timeout /t 1 /NOBREAK>nul
goto longPaths
:manualreg
echo.
echo  Auto setup failed!
echo.
echo  Please follow the instructions on GitHub first on how to properly setup AYC. 
echo.
echo  Press Enter to open instructions.
pause>NUL
start "" "https://github.com/adithya-s-sekhar/advanced-youtube-client-ayc#instructions"
echo.
echo  After setting up, paste the magic phrase below.
echo.
echo  This is to ensure you have read the instructions and followed it through.
echo.
call tui borderMediumHalf
:firstRun2
set "magic_phrase_input="
echo.
call cleaner "input"
set /p cleaner_input=Paste magic phrase: 
call cleaner "dq"
if /i "%cleaner_input%" equ "null" goto firstRun2
call cleaner "ws"
if /i "%cleaner_input%" equ "" goto firstRun2
if /i "%cleaner_input%" equ " =" goto firstRun2
set magic_phrase_input=%cleaner_input%
if not "%magic_phrase_input%" == "Maurisegestasimperdietseminimperdiet" (
    echo.
    echo  ERROR: Invalid magic phrase. Please Try again.
    echo.
    echo  Press Enter to cotinue.
    pause>NUL
    goto firstRun
)
:longPaths
cls
echo.
echo  (2/4) Enable support for long path names
echo.
echo  - Windows has a file name + path limit of 260 characters. 
echo.
echo  - We can increase the limit to 32,767 characters to support videos with large file names.
echo.
echo  - If you skip this, videos with a file name and path longer than 260 characters will 
echo    fail to download.
echo.
call tui borderMediumHalf
echo.
echo  Click Yes twice after pressing Enter.
pause>nul
regedit.exe "%aycroot%\resources\extras\EnableLongPaths.reg"
echo.
echo  You may need to restart your PC for changes to take effect. Press Enter to continue.
pause>nul
:themeSelector
call themer
color %theme_colors%
cls
echo.
echo  (3/4) Select theme (Can be changed later)
echo.
if /i %theme_status% == 0 echo  Currently: Dark
if /i %theme_status% == 1 echo  Currently: Light
if /i %theme_status% == 2 echo  Currently: Light Blue
if /i %theme_status% == 3 echo  Currently: Light Purple
if /i %theme_status% == 4 echo  Currently: Light Yellow
if /i %theme_status% == 5 echo  Currently: Light Red
echo.
echo   (1) - Switch Theme
echo.
echo   (2) - Continue
echo.
call tui borderMediumHalf
echo.
choice /c 12 /n /m "Select Option (1-2): "
if /i %errorlevel% == 1 call settingsToggles ChangeTheme
if /i %errorlevel% == 2 goto themeSelectorFinish
goto themeSelector
:themeSelectorFinish
cls
echo.
echo  (4/4) Choose yt-dlp update channel (Can be changed later)
echo.
echo  * Nightly Channel: Fixes are released as soon they are done.
echo.
echo  * Stable Channel: Slow to get fixes. Widely tested.
echo.
echo   (1) - Nightly channel (Recommended)
echo.
echo   (2) - Stable channel
echo.
call tui borderMediumHalf
echo.
choice /c 12 /n /m "Select Option (1-2): "
if /i %errorlevel% == 1 set firstYtUpdate=nightly
if /i %errorlevel% == 2 set firstYtUpdate=stable
echo.
echo  Please wait, updating yt-dlp..
%youtube_dl% --update-to %firstYtUpdate%
for /f %%i in ('yt-dlp --version') do set youtube_dl_version=%%i
echo %youtube_dl_version%>"%aycdata%\youtube_dl_version.txt"
call createShortcut all
echo "0">"%aycdata%\first_run.txt"
cls
echo.
echo  First run finished.
echo.
echo  - yt-dlp is set to check for updates everytime you start AYC. This can be disabled in 
echo    settings.
echo.
echo  - Hint: Use the quickkey (u) to open yt-dlp settings straight from the URL page.
echo.
echo  - There are more quickkeys spread throughout AYC, find them all!
echo.
call tui borderMediumHalf
echo.
echo  You can restart AYC now from the shortcut on your desktop or from the ayc folder.
echo.
echo  Press Enter to close this window.
pause>NUL
exit
