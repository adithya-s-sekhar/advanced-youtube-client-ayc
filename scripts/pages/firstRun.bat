:firstRun
call tui windowSize %medium_width% 26
color %theme_colors%
title Welcome to AYC
cls
call tui bannerMedium
echo.
echo  Before you start we need to take care of a few things. 
echo.
echo  Please follow the instructions on GitHub first on how to properly install AYC. 
echo.
echo  Press Enter to open instructions.
pause>NUL
start "" "https://github.com/adithya-s-sekhar/advanced-youtube-client-ayc#instructions"
echo.
echo  After setting up, paste the magic phrase below.
echo.
echo  This is to ensure you read the instructions and followed it through.
echo.
call tui borderSmallHalf
:firstRun2
set "magic_phrase_input="
echo.
set /p magic_phrase_input=Paste magic phrase: 
set magic_phrase_input=%magic_phrase_input: =%
if "%magic_phrase_input%" equ "" goto firstRun2
if "%magic_phrase_input%" equ " =" goto firstRun2
if not "%magic_phrase_input%" == "Maurisegestasimperdietseminimperdiet" (
    echo.
    echo  ERROR: Invalid magic phrase. Please Try again.
    echo.
    echo  Press Enter to cotinue.
    pause>NUL
    goto firstRun
)
:themeSelector
call themer
color %theme_colors%
cls
call tui bannerMedium
echo.
echo  Preparing for first run..
echo.
echo  What theme do you prefer? (Can be changed later)
echo.
if %theme_status% == 0 echo  Currently: Dark
if %theme_status% == 1 echo  Currently: Light
echo.
echo   (1) - Switch Theme
echo.
echo   (2) - Continue
echo.
call tui borderMediumHalf
echo.
choice /c 12 /n /m "Select Option (1-2): "
if %errorlevel% == 1 call settingsToggles ChangeTheme
if %errorlevel% == 2 goto themeSelectorFinish
goto themeSelector
:themeSelectorFinish
cls
call tui bannerMedium
echo.
echo  Please wait, updating yt-dlp..
%youtube_dl% -U
for /f %%i in ('yt-dlp --version') do set youtube_dl_version=%%i
echo %youtube_dl_version%>"%aycdata%\youtube_dl_version.txt"
echo "0">"%aycdata%\first_run.txt"
cls
call tui bannerMedium
echo.
echo  First run finished.
echo.
echo  You can restart AYC now. Press Enter to close this window.
pause>NUL
exit
