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

:settingsMenu
call tui windowSize %small_width% 34
color %theme_colors%
title AYC Settings
set sub_lang_display=%sub_lang%
if /i "%sub_lang%" == "en" set sub_lang_display=English
if /i "%sub_lang%" == "zh" set sub_lang_display=Chinese
if /i "%sub_lang%" == "ru" set sub_lang_display=Russian
if /i "%sub_lang%" == "cs" set sub_lang_display=Czech
cls
call tui bannerSmall
echo.
echo  (0) - Back
echo.
echo  (1) - Manage folders (f)
echo        Change download and temporary folders.
echo.
echo  (2) - Change retry attempts
echo        Currently: %defined_try%
echo.
echo  (3) - Update yt-dlp (fixes most issues) (u)
echo        Currently: %youtube_dl_version%
echo.
echo  (4) - Multi-threaded downloading (a)
if /i %aria2_status% == 0 echo        [Disabled]
if /i %aria2_status% == 1 echo        [Enabled for non-youtube downloads]
if /i %aria2_status% == 2 echo        [Enabled for all downloads]
echo.
echo  (5) - Embed thumbnails
if /i %thumbs_status% == 0 echo        [Disabled]
if /i %thumbs_status% == 1 echo        [Enabled]
echo.
echo  (6) - Subtitles
if /i %subs_status% == 0 echo        [Disabled]
if /i %subs_status% == 1 echo        [Enabled: %sub_lang_display%]
echo.
echo  (7) - Change theme (t)
if /i %theme_status% == 0 echo        [Dark]
if /i %theme_status% == 1 echo        [Light]
if /i %theme_status% == 2 echo        [Light Blue]
if /i %theme_status% == 3 echo        [Light Purple]
if /i %theme_status% == 4 echo        [Light Yellow]
if /i %theme_status% == 5 echo        [Light Red]
echo.
echo  (8) - Reset AYC
echo.
call tui borderSmallHalf
echo.
choice /c 012345678 /n /m "Select Option (0-8): "
if /i %errorlevel% == 1 goto :EOF
if /i %errorlevel% == 2 call settingsChangeDirHome & goto settingsMenu
if /i %errorlevel% == 3 call settingsChangeDefinedTry & goto settingsMenu
if /i %errorlevel% == 4 call settingsYtUpdate & goto settingsMenu
if /i %errorlevel% == 5 call settingsToggles ChangeAria2 & goto settingsMenu
if /i %errorlevel% == 6 call settingsToggles ChangeThumbs & goto settingsMenu
if /i %errorlevel% == 7 call settingsSubtitles & goto settingsMenu
if /i %errorlevel% == 8 call settingsToggles ChangeTheme & goto settingsMenu
if /i %errorlevel% == 9 call settingsReset & goto settingsMenu
