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

:settingsSubtitlesLang
call tui windowSize %small_width% 29
color %theme_colors%
title Subtitles: Change Lanuage
set sub_lang_display=%sub_lang%
if "%sub_lang%" == "en" set sub_lang_display=English
if "%sub_lang%" == "zh" set sub_lang_display=Chinese
if "%sub_lang%" == "ru" set sub_lang_display=Russian
if "%sub_lang%" == "cs" set sub_lang_display=Czech
cls
call tui bannerSmall
echo.
echo  Current language: %sub_lang_display%
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
echo  (4) - Czech (cs)
echo.
echo  (5) - Show all language codes (web)
echo.
echo  (6) - Select all languages (Not recommended)
echo.
echo  (7) - Enter language code manually
echo.
call tui borderSmallHalf
echo.
choice /c 01234567 /n /m "Select Option (0-7): "
if /i %errorlevel% == 1 goto :EOF
if /i %errorlevel% == 2 set "sub_lang=en" & call :saveSubLang & goto :EOF
if /i %errorlevel% == 3 set "sub_lang=zh" & call :saveSubLang & goto :EOF
if /i %errorlevel% == 4 set "sub_lang=ru" & call :saveSubLang & goto :EOF
if /i %errorlevel% == 5 set "sub_lang=cs" & call :saveSubLang & goto :EOF
if /i %errorlevel% == 6 start "" "https://www.andiamo.co.uk/resources/iso-language-codes/" & goto settingsSubtitlesLang
if /i %errorlevel% == 7 set "sub_lang=all" & call :saveSubLang & goto :EOF
if /i %errorlevel% == 8 call :customSubLang & goto settingsSubtitlesLang
goto settingsSubtitlesLang

:customSubLang
set sub_lang_tmp=null
call tui windowSize %small_width% 19
color %theme_colors%
title Subtitles: Custom lang code
set sub_lang_display=%sub_lang%
if "%sub_lang%" == "en" set sub_lang_display=English
if "%sub_lang%" == "zh" set sub_lang_display=Chinese
if "%sub_lang%" == "ru" set sub_lang_display=Russian
if "%sub_lang%" == "cs" set sub_lang_display=Czech
cls
call tui bannerSmall
echo.
echo  Current language: %sub_lang_display%
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
call cleaner "input"
set /p cleaner_input=Enter language code: 

call cleaner "dq"
call cleaner "ws"
if "%cleaner_input%" equ "null" goto :EOF
if "%cleaner_input%" equ "" goto :customSubLang
if "%cleaner_input%" equ " =" goto settingsChangeDefinedTry

set sub_lang_tmp=%cleaner_input%

set sub_lang=%sub_lang_tmp%
call :saveSubLang
goto :EOF

:saveSubLang
echo "%sub_lang%">"%aycdata%\sub_lang.txt"
goto :EOF
