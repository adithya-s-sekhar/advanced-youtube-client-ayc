:firstRun
mode %window_medium%
color 07
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
echo.
echo  Preparing for first run..
echo.
echo  Please wait, updating yt-dlp..
%youtube_dl% -U
%youtube_dl% --version>"%aycdata%\youtube_dl_version.txt"
set /p youtube_dl_version=<"%aycdata%\youtube_dl_version.txt"
set youtube_dl_version=%youtube_dl_version:"=%
echo "0">"%aycdata%\first_run.txt"
echo.
echo  First run finished.
echo.
echo  You can restart AYC now. Press Enter to close this window.
pause>NUL
exit
