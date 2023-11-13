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

:qualitySelector
set generic_download_status=0
if %cookie_loaded% == 1 (
    call tui windowSize %small_width% 26
) else (
    call tui windowSize %small_width% 24
)
color %theme_colors%
title Link Recieved
cls
call tui bannerSmall
echo.
echo  URL: %url%
echo.
echo  Non-YouTube link detected.
echo.
if %cookie_loaded% == 1 (
    echo  Using cookies.txt.
    echo.
)
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
choice /c 123 /n /m "Select Option (1-3): "
if %errorlevel% == 1 set conf="-f bv*+ba/b" & set generic_qual=high & goto genericDownload
if %errorlevel% == 2 set conf="-f wv*+wa/w" & set generic_qual=low & goto genericDownload
if %errorlevel% == 3 goto customFormatSelector


:customFormatSelector
call tui windowSize %large_width% 500
set "generic_qual="
color %theme_colors%
title Select Quality
cls
call tui bannerLarge
echo.
echo  URL: %url%
echo.
if %cookie_loaded% == 1 (
    echo  Using cookies.txt.
    echo.
)
%youtube_dl% %default_config% %cookies% -F "%url%" && goto customFormatSelectorContinue
goto :EOF
:customFormatSelectorContinue
echo.
call tui borderLargeHalf
echo.
echo Leave blank and press Enter to Go back.
echo.
echo Merge two formats using + symbol.
echo.
set /p generic_qual=Choose ID (green color in the list above): 
set generic_qual=%generic_qual: =%
if "%generic_qual%" equ "" goto qualitySelector
if "%generic_qual%" equ " =" goto qualitySelector
set generic_qual=%generic_qual:'=%
set generic_qual=%generic_qual:"=%
set conf="-f %generic_qual%"
set generic_qual=%generic_qual%-


:genericDownload
set "try="
set try=1
set conf=%conf:"=%
if %aria2_status% == 1 set aria2=--external-downloader aria2c

:genericDownloadTried
call tui windowSize %small_width% 36
color %theme_colors%
title Downloading: Attempt %try% out of %max_try% (%defined_try% retries)
cls
call tui bannerSmall
echo.
echo  Starting Download: Attempt %try% out of %max_try% (%defined_try% retries)
echo.
call tui borderSmallHalf
echo.
echo  URL: %url%
echo.
if %cookie_loaded% == 1 (
    echo  Using cookies.txt.
    echo.
)
%youtube_dl% %default_config% %conf% %aria2% %subs% %thumbs% -P home:"%loc%" -o "%%(title).170s-%generic_qual%-%%(id).13s.%%(ext)s" %custom_config_all% %cookies% "%url%" && set generic_download_status=1 & goto :EOF
set /a try=%try%+1
if %try% GTR %max_try% goto :EOF
goto genericDownloadTried
