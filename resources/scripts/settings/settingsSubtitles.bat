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

:settingsSubtitles
if /i "%subs_status%" == "0" (
    call tui windowSize %small_width% 17
) else (
    call tui windowSize %small_width% 28
)
color %theme_colors%
title Subtitle settings
set sub_lang_display=%sub_lang%
if /i "%sub_lang%" == "en" set sub_lang_display=English
if /i "%sub_lang%" == "zh" set sub_lang_display=Chinese
if /i "%sub_lang%" == "ru" set sub_lang_display=Russian
if /i "%sub_lang%" == "cs" set sub_lang_display=Czech
cls
call tui bannerSmall
if /i "%subs_status%" == "0" (
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
if /i %errorlevel% == 1 goto :EOF
if /i %errorlevel% == 2 call settingsToggles ChangeSubs & goto settingsSubtitles

:subsEnabled
set sub_type_msg=UNKNOWN
if /i %sub_type% == 1 set sub_type_msg=As .srt file.
if /i %sub_type% == 2 set sub_type_msg=Embedded into the video file.
echo.
echo  Subtitles: Enabled
echo.
echo  Type: %sub_type_msg%
echo.
echo  Current language: %sub_lang_display%
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
echo  (4) - Auto generated subtitles
if /i %auto_subs% == 0 echo        [Disabled]
if /i %auto_subs% == 1 echo        [Enabled]
echo.
call tui borderSmallHalf
echo.
choice /c 01234 /n /m "Select Option (0-4): "
if /i %errorlevel% == 1 goto :EOF
if /i %errorlevel% == 2 call settingsToggles ChangeSubs & goto settingsSubtitles
if /i %errorlevel% == 3 call settingsToggles ChangeSubType & goto settingsSubtitles
if /i %errorlevel% == 4 call settingsSubtitlesLang & goto settingsSubtitles
if /i %errorlevel% == 5 call settingsToggles ChangeAutoSubs & goto settingsSubtitles
