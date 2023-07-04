:uniHome
set uni_download_status=0
mode %window_small%
color 07
title Link Recieved
cls
call tui bannerSmall
echo.
echo  URL: %url%
echo.
echo  Non-YouTube link detected.
echo.
call tui borderSmall
echo.
echo  Choose Format
echo.
echo   (1) - Highest Quality
echo.
echo   (2) - Lowest Quality
echo.
echo   (3) - Show all available formats
echo.
call tui borderSmallHalf
echo.
choice /c 123 /n /m "Enter Choice (1-3): "
if %errorlevel% == 1 set uni_qual="bv*+ba/b" && goto uniDownload
if %errorlevel% == 2 set uni_qual="wv*+wa/w" && goto uniDownload
if %errorlevel% == 3 goto uniQualitySelector


:uniQualitySelector
mode %window_large%
set "uni_qual="
color 07
title Select Quality
cls
call tui bannerLarge
echo.
echo  URL: %url%
echo.
%youtube_dl% -F "%url%" && goto uniQualitySelectorContinue
goto :EOF
:uniQualitySelectorContinue
call tui borderLargeHalf
echo.
echo Leave blank and press Enter to Go back.
echo.
echo Merge two formats using + symbol.
echo.
set /p uni_qual=Choose ID (green color in the list above): 
set uni_qual=%uni_qual: =%
if "%uni_qual%" equ "" goto uniHome
if "%uni_qual%" equ " =" goto uniHome


:uniDownload
set "try="
set try=%try_count%

if %aria2_status% == 1 set aria2=--external-downloader aria2c

:uniDownloadTried
mode %window_small%
color 0B
title Finger's Crossed! How's the weather?
cls
call tui bannerSmall
echo.
echo  Starting Download
call tui borderSmallHalf
echo.
echo  URL: %url%
echo.
%youtube_dl% %default_config% -f %uni_qual% %aria2% -P home:"%loc%" -o "%%(title)s-%%(height)sp-%%(id)s.%%(ext)s" "%url%" && set uni_download_status=1 && goto :EOF
set /a try=%try%+1
if %try% GTR %defined_try% goto :EOF
goto uniDownloadTried
