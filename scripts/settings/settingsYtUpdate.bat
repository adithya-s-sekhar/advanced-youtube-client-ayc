set yt_updated=0
:update
mode %window_small%
color 07
title Update yt-dlp
cls
call tui bannerSmall
echo.
if %yt_updated% == 0 (
    echo  Current version: %youtube_dl_version%
) else (
    echo  Updated successfully.
    echo.
    echo  Current version: %youtube_dl_version%
)
echo.
call tui borderSmall
echo.
echo  (0) - Go back
echo.
echo  (1) - Update to latest Stable
echo.
echo  (2) - Update to latest Nightly (pre-release, untested)
echo.
call tui borderSmallHalf
echo.
choice /c 012 /n /m "Select Option (0-2): "
if %errorlevel% == 1 goto :EOF
if %errorlevel% == 2 call :ytUpdateStable
if %errorlevel% == 3 call :ytUpdateNightly
goto update


:ytUpdateStable
echo.
echo Updating to latest stable
echo.
%youtube_dl% --update-to stable@2023.07.06 > nul
%youtube_dl% --update-to stable > nul
:: you can't downgrade from nightly without a specifig tag
for /f %%i in ('yt-dlp --version') do set youtube_dl_version=%%i
echo %youtube_dl_version%>"%aycdata%\youtube_dl_version.txt"
set yt_updated=1
goto :EOF

:ytUpdateNightly
echo.
echo Updating to latest nightly
echo.
%youtube_dl% --update-to nightly  > nul
for /f %%i in ('yt-dlp --version') do set youtube_dl_version=%%i
echo %youtube_dl_version%>"%aycdata%\youtube_dl_version.txt"
set yt_updated=1
goto :EOF
