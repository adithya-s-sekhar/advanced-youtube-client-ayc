:firstRun
mode %window_medium%
color 07
title Welcome to AYC
cls
call gui bannerMedium
echo.
echo  WARNING!!!
echo.
echo  Please follow the instructions at GitHub first on how to properly install AYC. 
echo.
echo  Press Enter to open instructions.
pause>NUL
start "" "https://github.com/adithya-s-sekhar/advanced-youtube-client-ayc#instructions"
echo.
echo  After setting up, enter the magic phrase below.
echo.
echo  This is to ensure you read the instructions and followed it through.
echo.
:firstRun2
set "magic_phrase_input="
set /p magic_phrase_input=Enter magic phrase: 
set magic_phrase_input=%magic_phrase_input: =%
if "%magic_phrase_input%" equ "" goto firstRun2
if "%magic_phrase_input%" equ " =" goto firstRun2
call :magic_verify
echo.
echo  Preparing for first run..
echo.
echo  Please wait, updating yt-dlp..
%youtube_dl% -U
%youtube_dl% --version>"%aycdata%\youtube_dl_version.txt"
set /p youtube_dl_version=<"%aycdata%\youtube_dl_version.txt"
set youtube_dl_version=%youtube_dl_version:"=%
call :magic_completed
exit

:magic_verify
set magic_passed=1
if not "%magic_phrase_input%" == "Maurisegestasimperdietseminimperdiet" set magic_passed=0
if %magic_passed% == 0 (
    mode %window_medium%
    title PEBKAC
    cls
    call gui bannerMedium
    echo.
    echo  Sorry, you can't use this script.
    echo.
    echo  Error code: PEBKAC
    echo.
    echo  Press Enter to exit.
    pause>NUL
    exit
)
goto :EOF


:magic_completed
if not %magic_passed% == 0 (
    echo "0">"%aycdata%\first_run.txt"
)
echo.
echo  Hope you read the instructions.
echo.
echo  First run finished.
echo.
echo  You can restart AYC now. Press Enter to close.
pause>NUL
goto :EOF
