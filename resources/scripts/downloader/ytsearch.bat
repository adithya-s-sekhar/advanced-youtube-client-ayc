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

:quickDownload
set youtube_download_status=0
if /i %cookie_loaded% == 1 (
    call tui windowSize %small_width% 35
) else (
    call tui windowSize %small_width% 32
)
color %theme_colors%
title Simple Mode - Link Recieved
cls
call tui bannerSmall
echo.
echo  Youtube search Term: %url%
echo.
if /i %cookie_loaded% == 1 (
    echo  Using cookies.txt.
    echo.
)
call tui borderSmall
echo  Most Used Formats
echo.
echo   (1) - 360p  - (H264 Video/AAC Audio)
echo.
echo   (2) - 480p  - (H264 Video/AAC Audio)
echo.
echo   (3) - 720p  - (H264 Video/AAC Audio)
echo.
echo   (4) - 1080p - (H264 Video/AAC Audio)
echo.
echo   (5) -  4K   - (VP9 Video/OPUS Audio)
echo.
echo   (6) - M4A - AAC Audio - 128kbps (Audio Only)
echo.
echo   (7) - MP3 - MP3 Audio - 128kbps (Audio Only)
echo.
call tui borderSmall
echo.
echo   (8) - Show all formats
echo.
call tui borderSmallHalf
echo.
choice /c 12345678 /n /m "Select Option (1-8): "
if /i %errorlevel% == 1 set format_chosen=h264 & set conf="-f bestvideo[vcodec^=avc1][height<=360]+bestaudio[ext=m4a]" & goto download
if /i %errorlevel% == 2 set format_chosen=h264 & set conf="-f bestvideo[vcodec^=avc1][height<=480]+bestaudio[ext=m4a]" & goto download
if /i %errorlevel% == 3 set format_chosen=h264 & set conf="-f bestvideo[vcodec^=avc1][height<=720]+bestaudio[ext=m4a]" & goto download
if /i %errorlevel% == 4 set format_chosen=h264 & set conf="-f bestvideo[vcodec^=avc1][height<=1080]+bestaudio[ext=m4a]" & goto download
if /i %errorlevel% == 5 set format_chosen=vp9 & set conf="-f bestvideo[vcodec^=vp09][height<=2160]+bestaudio[ext=webm]" & goto download
if /i %errorlevel% == 6 set format_chosen=m4a & set conf="-f bestaudio[ext=m4a]" & goto download
if /i %errorlevel% == 7 set format_chosen=mp3 & set conf="--extract-audio --audio-format mp3 --no-post-overwrites --audio-quality 128k" & goto download
if /i %errorlevel% == 8 goto formatSelector


:formatSelector
if /i %cookie_loaded% == 1 (
    call tui windowSize %small_width% 38
) else (
    call tui windowSize %small_width% 36
)
color %theme_colors%
title Advanced Mode - Link Recieved
cls
call tui bannerSmall
echo.
echo  Youtube search Term: %url%
echo.
if /i %cookie_loaded% == 1 (
    echo  Using cookies.txt.
    echo.
)
echo  All Formats
call tui borderSmall
echo  Video + Audio
echo.
echo   (1) - MP4 Video/AAC Audio (Upto 1080p) (Recommended)
echo.
echo   (2) - VP9 Video/OPUS Audio (Upto 4K)
echo.
echo   (3) - AV1 Video/OPUS Audio (Upto 8K)
echo.
call tui borderSmall
echo  Audio Only
echo.
echo   (4) - M4A  - AAC Audio  - 128kbps
echo.
echo   (5) - MP3  - MP3 Audio  - 128kbps
echo.
echo   (6) - WEBM - OPUS Audio - 160kbps
echo.
call tui borderSmall
echo.
echo   (7) - Show even more formats (Enter format code manually)
echo.
echo   (8) - Show the most used formats
echo.
call tui borderSmallHalf
echo.
choice /c 12345678 /n /m "Select Option (1-8): "
if /i %errorlevel% == 1 set format_chosen=h264 & goto qualitySelector
if /i %errorlevel% == 2 set format_chosen=vp9 & goto qualitySelector
if /i %errorlevel% == 3 set format_chosen=av1 & goto qualitySelector
if /i %errorlevel% == 4 set format_chosen=m4a & set conf="-f bestaudio[ext=m4a]" & goto download
if /i %errorlevel% == 5 set format_chosen=mp3 & set conf="--extract-audio --audio-format mp3 --no-post-overwrites --audio-quality 128k" & goto download
if /i %errorlevel% == 6 set format_chosen=webm & set conf="-f bestaudio[ext=webm]" & set "thumbs=" & goto download
if /i %errorlevel% == 7 set format_chosen=cust & goto ytCustomFormat
if /i %errorlevel% == 8 goto quickDownload


:qualitySelector
if /i %format_chosen% == h264 if /i %cookie_loaded% == 1 call tui windowSize %small_width% 31
if /i %format_chosen% == h264 if /i %cookie_loaded% == 0 call tui windowSize %small_width% 29
if /i %format_chosen% == vp9 if /i %cookie_loaded% == 1 call tui windowSize %small_width% 36
if /i %format_chosen% == vp9 if /i %cookie_loaded% == 0 call tui windowSize %small_width% 34
if /i %format_chosen% == av1 if /i %cookie_loaded% == 1 call tui windowSize %small_width% 37
if /i %format_chosen% == av1 if /i %cookie_loaded% == 0 call tui windowSize %small_width% 35
color %theme_colors%
if /i %format_chosen% == h264 title  Format: .MP4 (H264 Video/AAC Audio)
if /i %format_chosen% == vp9 title  Format: .MP4 (VP9 Video/OPUS Audio)
if /i %format_chosen% == av1 title  Format: .MP4 (AV1 Video/OPUS Audio)
cls
call tui bannerSmall
echo.
echo  URL: %url%
echo.
if /i %cookie_loaded% == 1 (
    echo  Using cookies.txt.
    echo.
)
if /i %format_chosen% == h264 echo  Format: .MP4 (H264 Video/AAC Audio)
if /i %format_chosen% == vp9 echo  Format: .MP4 (VP9 Video/OPUS Audio)
if /i %format_chosen% == av1 echo  Format: .MP4 (AV1 Video/OPUS Audio)
echo.
echo   (0) - Back
echo.
call tui borderSmall
echo  Choose Maximum Quality
echo.
echo   (1) - 144p 
echo   (2) - 240p   (If not available, returns to 144p) 
echo   (3) - 360p   (If not available, returns to 240p) 
echo.
call tui borderSmall
echo.
echo   (4) - 480p   (If not available, returns to 360p) 
echo   (5) - 720p   (If not available, returns to 480p) 
echo   (6) - 1080p  (If not available, returns to 720p) 
echo.
if NOT %format_chosen% == h264 call tui borderSmall
if NOT %format_chosen% == h264 echo.
if NOT %format_chosen% == h264 echo   (7) - 1440p  (If not available, returns to 1080p)
if NOT %format_chosen% == h264 echo   (8) - 4K     (If not available, returns to 1440p)
if /i %format_chosen% == av1 echo   (9) - 8K     (If not available, returns to 4K)
if not %format_chosen% == h264 echo.
call tui borderSmallHalf
if /i %format_chosen% == vp9  goto choiceVp9
if /i %format_chosen% == av1  goto choiceAv1
echo.
choice /c 0123456 /n /m "Select Option (0-6): "
if /i %errorlevel% == 1 goto formatSelector
if /i %errorlevel% == 2 set conf="-f bestvideo[vcodec^=avc1][height<=144]+worstaudio[ext=m4a]" & goto download
if /i %errorlevel% == 3 set conf="-f bestvideo[vcodec^=avc1][height<=240]+worstaudio[ext=m4a]" & goto download
if /i %errorlevel% == 4 set conf="-f bestvideo[vcodec^=avc1][height<=360]+bestaudio[ext=m4a]" & goto download
if /i %errorlevel% == 5 set conf="-f bestvideo[vcodec^=avc1][height<=480]+bestaudio[ext=m4a]" & goto download
if /i %errorlevel% == 6 set conf="-f bestvideo[vcodec^=avc1][height<=720]+bestaudio[ext=m4a]" & goto download
if /i %errorlevel% == 7 set conf="-f bestvideo[vcodec^=avc1][height<=1080]+bestaudio[ext=m4a]" & goto download

:choiceVp9
echo.
choice /c 012345678 /n /m "Select Option (0-8): "
if /i %errorlevel% == 1 goto formatSelector
if /i %errorlevel% == 2 set conf="-f bestvideo[vcodec^=vp09][height<=144]+worstaudio[ext=webm]" & goto download
if /i %errorlevel% == 3 set conf="-f bestvideo[vcodec^=vp09][height<=240]+worstaudio[ext=webm]" & goto download
if /i %errorlevel% == 4 set conf="-f bestvideo[vcodec^=vp09][height<=360]+bestaudio[ext=webm]" & goto download
if /i %errorlevel% == 5 set conf="-f bestvideo[vcodec^=vp09][height<=480]+bestaudio[ext=webm]" & goto download
if /i %errorlevel% == 6 set conf="-f bestvideo[vcodec^=vp09][height<=720]+bestaudio[ext=webm]" & goto download
if /i %errorlevel% == 7 set conf="-f bestvideo[vcodec^=vp09][height<=1080]+bestaudio[ext=webm]" & goto download
if /i %errorlevel% == 8 set conf="-f bestvideo[vcodec^=vp09][height<=1440]+bestaudio[ext=webm]" & goto download
if /i %errorlevel% == 9 set conf="-f bestvideo[vcodec^=vp09][height<=2160]+bestaudio[ext=webm]" & goto download

:choiceAv1
set error_format=av1
echo.
choice /c 0123456789 /n /m "Select Option (0-9): "
if /i %errorlevel% == 1 goto formatSelector
if /i %errorlevel% == 2 set conf="-f bestvideo[vcodec^=av01][height<=144]+worstaudio[ext=webm]" & goto download
if /i %errorlevel% == 3 set conf="-f bestvideo[vcodec^=av01][height<=240]+worstaudio[ext=webm]" & goto download
if /i %errorlevel% == 4 set conf="-f bestvideo[vcodec^=av01][height<=360]+bestaudio[ext=webm]" & goto download
if /i %errorlevel% == 5 set conf="-f bestvideo[vcodec^=av01][height<=480]+bestaudio[ext=webm]" & goto download
if /i %errorlevel% == 6 set conf="-f bestvideo[vcodec^=av01][height<=720]+bestaudio[ext=webm]" & goto download
if /i %errorlevel% == 7 set conf="-f bestvideo[vcodec^=av01][height<=1080]+bestaudio[ext=webm]" & goto download
if /i %errorlevel% == 8 set conf="-f bestvideo[vcodec^=av01][height<=1440]+bestaudio[ext=webm]" & goto download
if /i %errorlevel% == 9 set conf="-f bestvideo[vcodec^=av01][height<=2160]+bestaudio[ext=webm]" & goto download
if /i %errorlevel% == 10 set conf="-f bestvideo[vcodec^=av01][height<=4320]+bestaudio[ext=webm]" & goto download


:ytCustomFormat
call tui windowSize %large_width% 500
color %theme_colors%
title Select Format
cls
call tui bannerLarge
echo.
echo  URL: %url%
echo.
if /i %cookie_loaded% == 1 (
    echo  Using cookies.txt.
    echo.
)
%youtube_dl% %default_config% %cookies% -F "ytsearch:%url%" && goto ytCustomFormatContinue
goto :EOF
:ytCustomFormatContinue
echo.
call tui borderLargeHalf
echo.
echo Leave blank and press Enter to Go back.
echo.
echo Merge two formats using '+' symbol.
echo.
call cleaner "input"
set /p cleaner_input=Choose ID (green color in the list above): 

call cleaner "dq"
if /i "%cleaner_input%" equ "null" goto formatSelector
call cleaner "ws"
if /i "%cleaner_input%" equ "" goto formatSelector
if /i "%cleaner_input%" equ " =" goto formatSelector

set yt_custom_qual=%cleaner_input%

set conf="-f %yt_custom_qual%"
goto download


:download
set "try="
set try=1
set conf=%conf:"=%
if /i %aria2_status% == 1 set aria2=--concurrent-fragments 8

:downloadTried
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
if /i %cookie_loaded% == 1 (
    echo  Using cookies.txt.
    echo.
)
if /i %format_chosen% == h264 %youtube_dl% %default_config% %conf% %aria2% %subs% %thumbs% -P home:"%loc%" -o "%%(title).177s-MP4-%%(height).4sp-%%(id).12s.%%(ext)s" %custom_config_youtube% %cookies% "ytsearch:%url%" && set youtube_download_status=1 && goto :EOF
if /i %format_chosen% == vp9 %youtube_dl% %default_config% %conf% %aria2% --merge-output-format mp4 %subs% %thumbs% -P home:"%loc%" -o "%%(title).177s-VP9-%%(height).4sp-%%(id).12s.%%(ext)s" %custom_config_youtube% %cookies% "ytsearch:%url%" && set youtube_download_status=1 && goto :EOF
if /i %format_chosen% == av1 %youtube_dl% %default_config% %conf% %aria2% %subs% %thumbs% --merge-output-format mp4 -P home:"%loc%" -o "%%(title).177s-AV1-%%(height).4sp-%%(id).12s.%%(ext)s" %custom_config_youtube% %cookies% "ytsearch:%url%" && set youtube_download_status=1 && goto :EOF
if /i %format_chosen% == m4a %youtube_dl% %default_config% %conf% %aria2% %thumbs% --add-metadata -P home:"%loc%" -o "%%(title).177s-%%(id).12s.%%(ext)s" %custom_config_youtube% %cookies% "ytsearch:%url%" && set youtube_download_status=1 && goto :EOF
if /i %format_chosen% == mp3 %youtube_dl% %default_config% %conf% %aria2% %thumbs% --add-metadata -P home:"%loc%" -o "%%(title).177s-%%(id).12s.%%(ext)s" %custom_config_youtube% %cookies% "ytsearch:%url%" && set youtube_download_status=1 && goto :EOF
if /i %format_chosen% == webm %youtube_dl% %default_config% %conf% %aria2% %thumbs% --add-metadata -P home:"%loc%" -o "%%(title).177s-%%(id).12s.%%(ext)s" %custom_config_youtube% %cookies% "ytsearch:%url%" && set youtube_download_status=1 && goto :EOF
if /i %format_chosen% == cust %youtube_dl% %default_config% %conf% %aria2% %subs% %thumbs% --merge-output-format mp4 --add-metadata -P home:"%loc%" -o "%%(title).177s-%%(id).12s.%%(ext)s" %custom_config_youtube% %cookies% "ytsearch:%url%" && set youtube_download_status=1 && goto :EOF
set /a try=%try%+1
if /i %try% GTR %max_try% set youtube_download_status=0 & goto :EOF
goto downloadTried
