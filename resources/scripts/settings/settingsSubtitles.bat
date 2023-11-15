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

:settingsSubtitles
set sub_lang=%sub_lang: =%
if "%subs_status%" == "0" (
    call tui windowSize %small_width% 17
) else (
    call tui windowSize %small_width% 25
)
color %theme_colors%
title Subtitle settings
cls
call tui bannerSmall
if "%subs_status%" == "0" (
    goto subsDisabled
) else (
    goto subsEnabled
)

:subsDisabled
echo.
echo  Subtitles: Disabled
echo.
call tui borderSmall
echo.
echo  (0) - Back
echo.
echo  (1) - Enable subtitles
echo.
call tui borderSmallHalf
echo.
choice /c 01 /n /m "Select Option (0-1): "
if %errorlevel% == 1 goto :EOF
if %errorlevel% == 2 call settingsToggles ChangeSubs & goto settingsSubtitles

:subsEnabled
set sub_type_msg=UNKNOWN
if %sub_type% == 1 set sub_type_msg=As .srt file.
if %sub_type% == 2 set sub_type_msg=Embedded into the video file.
echo.
echo  Subtitles: Enabled
echo.
echo  Type: %sub_type_msg%
echo.
echo  Current language: %sub_lang%
echo.
call tui borderSmall
echo.
echo  (0) - Back
echo.
echo  (1) - Disable subtitles
echo.
echo  (2) - Change subtitle type
echo.
echo  (3) - Change subtitle language
echo.
call tui borderSmallHalf
echo.
choice /c 0123 /n /m "Select Option (0-3): "
if %errorlevel% == 1 goto :EOF
if %errorlevel% == 2 call settingsToggles ChangeSubs & goto settingsSubtitles
if %errorlevel% == 3 call settingsToggles ChangeSubType & goto settingsSubtitles
if %errorlevel% == 4 call :subsLanguage & goto settingsSubtitles

:subsLanguage
call tui windowSize %small_width% 27
color %theme_colors%
title Subtitles: Change Lanuage
cls
call tui bannerSmall
echo.
echo  Current language: %sub_lang%
echo.
call tui borderSmall
echo.
echo  (0) - Back
echo.
echo  (1) - English (en)
echo.
echo  (2) - Chinese (zh)
echo.
echo  (3) - Russian (ru)
echo.
echo  (4) - Show all language codes (web)
echo.
echo  (5) - Select all languages (Not recommended)
echo.
echo  (6) - Enter language code manually
echo.
call tui borderSmallHalf
echo.
choice /c 0123456 /n /m "Select Option (0-6): "
if %errorlevel% == 1 goto :EOF
if %errorlevel% == 2 set sub_lang=en & call :saveSubLang & goto :EOF
if %errorlevel% == 3 set sub_lang=zh & call :saveSubLang & goto :EOF
if %errorlevel% == 4 set sub_lang=ru & call :saveSubLang & goto :EOF
if %errorlevel% == 5 start "" "https://www.andiamo.co.uk/resources/iso-language-codes/" & goto subsLanguage
if %errorlevel% == 6 set sub_lang=all & call :saveSubLang & goto :EOF
if %errorlevel% == 7 call :customSubLang & goto subsLanguage
goto subsLanguage

:customSubLang
set "sub_lang_tmp="
call tui windowSize %small_width% 19
color %theme_colors%
title Subtitles: Custom lang code
cls
call tui bannerSmall
echo.
echo  Current language: %sub_lang%
echo.
call tui borderSmall
echo.
echo  * Leave blank and Enter to Go back.
echo.
echo  * Add multiple codes seperated with a comma.
echo    eg: en,ru
echo.
call tui borderSmallHalf
echo.
set /p sub_lang_tmp=Enter language code: 
if not defined sub_lang_tmp goto :EOF
set sub_lang=%sub_lang_tmp%
set sub_lang=%sub_lang: =%
call :saveSubLang
goto :EOF

:saveSubLang
echo "%sub_lang%">"%aycdata%\sub_lang.txt"
goto :EOF
