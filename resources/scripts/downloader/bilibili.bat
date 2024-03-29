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

:quickDownload
set bilibili_download_status=0
call tui windowSize %small_width% 30
color %theme_colors%
title Simple Mode - Link Recieved
cls
call tui bannerSmall
echo.
echo  URL: %url%
echo.
if /i %cookie_loaded% == 1 (
    echo  Using cookies.txt.
    echo.
) else (
    echo  cookies.txt needed for 720p and above. Read FAQ on GitHub.
    echo.
)
echo  Most Used Formats
call tui borderSmall
echo.
echo   (1) - 360p  - (H264 Video/AAC Audio)
echo.
echo   (2) - 480p  - (H264 Video/AAC Audio)
echo.
echo   (3) - 720p  - (H264 Video/AAC Audio)
echo.
echo   (4) - 1080p - (H264 Video/AAC Audio)
echo.
echo   (5) - M4A - AAC Audio - Highest Quality (Audio Only)
echo.
call tui borderSmall
echo.
echo   (6) - Show all formats
echo.
call tui borderSmallHalf
echo.
choice /c 123456 /n /m "Select Option (1-6): "
if /i %errorlevel% == 1 set format_chosen=h264 & set conf="-f bestvideo[vcodec^=avc1][height<=360]+0/bestvideo[vcodec^=avc1][height<=360]+worstaudio[ext=m4a]" & goto download
if /i %errorlevel% == 2 set format_chosen=h264 & set conf="-f bestvideo[vcodec^=avc1][height<=480]+1/bestvideo[vcodec^=avc1][height<=480]+worstaudio[ext=m4a]" & goto download
if /i %errorlevel% == 3 set format_chosen=h264 & set conf="-f bestvideo[vcodec^=avc1][height<=720]+1/bestvideo[vcodec^=avc1][height<=720]+bestaudio[ext=m4a]" & goto download
if /i %errorlevel% == 4 set format_chosen=h264 & set conf="-f bestvideo[vcodec^=avc1][height<=1080]+2/bestvideo[vcodec^=avc1][height<=1080]+bestaudio[ext=m4a]" & goto download
if /i %errorlevel% == 5 set format_chosen=aud & set aud_end=hq & set conf="-f bestaudio[ext=m4a]" & goto download
if /i %errorlevel% == 6 goto formatSelector


:formatSelector
call tui windowSize %small_width% 34
color %theme_colors%
title Advanced Mode - Link Recieved
cls
call tui bannerSmall
echo.
echo  URL: %url%
echo.
if /i %cookie_loaded% == 1 (
    echo  Using cookies.txt.
    echo.
) else (
    echo  cookies.txt needed for 720p and above. Read FAQ on GitHub.
    echo.
)
echo  All Formats
call tui borderSmall
echo  Video + Audio
echo.
echo   (1) - H264 Video/AAC Audio (Upto 1080p)
echo.
echo   (2) - HEVC Video/AAC Audio (Upto 1080p)
echo.
echo   (3) - AV1 Video/AAC Audio  (Upto 1080p)
echo.
call tui borderSmall
echo  Audio Only
echo.
echo   (4) - M4A - AAC Audio - Highest Quality
echo.
call tui borderSmall
echo.
echo   (5) - Enter format code manually
echo.
echo   (6) - Show the most used formats
echo.
call tui borderSmallHalf
echo.
choice /c 123456 /n /m "Select Option (1-6): "
if /i %errorlevel% == 1 set format_chosen=h264 & goto qualitySelector
if /i %errorlevel% == 2 set format_chosen=hevc & goto qualitySelector
if /i %errorlevel% == 3 set format_chosen=av1 & goto qualitySelector
if /i %errorlevel% == 4 set format_chosen=aud & goto bilibiliM4a
if /i %errorlevel% == 5 set format_chosen=custom & goto bilibiliCustomFormat
if /i %errorlevel% == 6 goto quickDownload


:qualitySelector
call tui windowSize %small_width% 29
color %theme_colors%
if /i %format_chosen% == h264 title  Format: .MP4 (H264 Video/AAC Audio)
if /i %format_chosen% == hevc title  Format: .MP4 (HEVC Video/AAC Audio)
if /i %format_chosen% == av1 title  Format: .MP4 (AV1 Video/AAC Audio)
cls
call tui bannerSmall
echo.
echo  URL: %url%
echo.
if /i %cookie_loaded% == 1 (
    echo  Using cookies.txt.
    echo.
) else (
    echo  cookies.txt needed for 720p and above. Read FAQ on GitHub.
    echo.
)
if /i %format_chosen% == h264 echo  Format: .MP4 (H264 Video/AAC Audio)
if /i %format_chosen% == hevc echo  Format: .MP4 (HEVC Video/AAC Audio)
if /i %format_chosen% == av1 echo  Format: .MP4 (AV1 Video/AAC Audio)
echo.
echo   (0) - Back
echo.
call tui borderSmall
echo  Choose Maximum Quality
echo.
echo   (1) - 360p 
echo   (2) - 480p   (If not available, returns to 360p) 
echo.
call tui borderSmall
echo.
echo   (3) - 720p   (If not available, returns to 480p) 
echo   (4) - 1080p  (If not available, returns to 720p) 
echo.
call tui borderSmallHalf
if /i %format_chosen% == hevc  goto choiceHevc
if /i %format_chosen% == av1  goto choiceAv1
echo.
choice /c 01234 /n /m "Select Option (0-4): "
if /i %errorlevel% == 1 goto formatSelector
if /i %errorlevel% == 2 set conf="-f bestvideo[vcodec^=avc1][height<=360]+0/bestvideo[vcodec^=avc1][height<=360]+worstaudio[ext=m4a]" & goto download
if /i %errorlevel% == 3 set conf="-f bestvideo[vcodec^=avc1][height<=480]+1/bestvideo[vcodec^=avc1][height<=480]+worstaudio[ext=m4a]" & goto download
if /i %errorlevel% == 4 set conf="-f bestvideo[vcodec^=avc1][height<=720]+1/bestvideo[vcodec^=avc1][height<=720]+bestaudio[ext=m4a]" & goto download
if /i %errorlevel% == 5 set conf="-f bestvideo[vcodec^=avc1][height<=1080]+2/bestvideo[vcodec^=avc1][height<=1080]+bestaudio[ext=m4a]" & goto download

:choiceHevc
echo.
choice /c 01234 /n /m "Select Option (0-4): "
if /i %errorlevel% == 1 goto formatSelector
if /i %errorlevel% == 2 set conf="-f bestvideo[vcodec^=hev1][height<=360]+0/bestvideo[vcodec^=hev1][height<=360]+worstaudio[ext=m4a]" & goto download
if /i %errorlevel% == 3 set conf="-f bestvideo[vcodec^=hev1][height<=480]+1/bestvideo[vcodec^=hev1][height<=480]+worstaudio[ext=m4a]" & goto download
if /i %errorlevel% == 4 set conf="-f bestvideo[vcodec^=hev1][height<=720]+1/bestvideo[vcodec^=hev1][height<=720]+bestaudio[ext=m4a]" & goto download
if /i %errorlevel% == 5 set conf="-f bestvideo[vcodec^=hev1][height<=1080]+2/bestvideo[vcodec^=hev1][height<=1080]+bestaudio[ext=m4a]" & goto download

:choiceAv1
set error_format=av1
echo.
choice /c 01234 /n /m "Select Option (0-4): "
if /i %errorlevel% == 1 goto formatSelector
if /i %errorlevel% == 2 set conf="-f bestvideo[vcodec^=av01][height<=360]+0/bestvideo[vcodec^=av01][height<=360]+worstaudio[ext=m4a]" & goto download
if /i %errorlevel% == 3 set conf="-f bestvideo[vcodec^=av01][height<=480]+1/bestvideo[vcodec^=av01][height<=480]+worstaudio[ext=m4a]" & goto download
if /i %errorlevel% == 4 set conf="-f bestvideo[vcodec^=av01][height<=720]+1/bestvideo[vcodec^=av01][height<=720]+bestaudio[ext=m4a]" & goto download
if /i %errorlevel% == 5 set conf="-f bestvideo[vcodec^=av01][height<=1080]+2/bestvideo[vcodec^=av01][height<=1080]+bestaudio[ext=m4a]" & goto download


:bilibiliM4a
call tui windowSize %small_width% 25
color %theme_colors%
title Select Quality
cls
call tui bannerSmall
echo.
echo  URL: %url%
echo.
if /i %cookie_loaded% == 1 (
    echo  Using cookies.txt.
    echo.
)
echo   (0) - Back
echo.
call tui borderSmall
echo.
echo   (1) - M4A - AAC - Lowest Quality
echo.
echo   (2) - M4A - AAC - Medium Quality
echo.
echo   (3) - M4A - AAC - Highest Quality
echo.
call tui borderSmallHalf
echo.
choice /c 0123 /n /m "Select Option (0-3): "
if /i %errorlevel% == 1 goto formatSelector
if /i %errorlevel% == 2 set aud_end=lq & set conf="-f worstaudio[ext=m4a]" & goto download
if /i %errorlevel% == 3 set aud_end=mq & set conf="-f 1/bestaudio[ext=m4a]" & goto download
if /i %errorlevel% == 4 set aud_end=hq & set conf="-f bestaudio[ext=m4a]" & goto download


:bilibiliCustomFormat
call tui windowSize %large_width% 500
set "bilibili_qual="
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
) else (
    echo  cookies.txt needed for 720p and above. Read FAQ on GitHub.
    echo.
)
%youtube_dl% %default_config% %cookies% -F "%url%" && goto bilibiliCustomFormatContinue
goto :EOF
:bilibiliCustomFormatContinue
echo.
call tui borderLargeHalf
echo.
echo Leave blank and press Enter to Go back.
echo.
echo Merge two formats using + symbol.
echo.
call cleaner "input"
set /p cleaner_input=Choose ID (green color in the list above): 

call cleaner "dq"
if /i "%cleaner_input%" equ "null" goto formatSelector
call cleaner "ws"
if /i "%cleaner_input%" equ "" goto formatSelector
if /i "%cleaner_input%" equ " =" goto formatSelector

set bilibili_qual=%cleaner_input%

set conf="-f %bilibili_qual%"
goto download


:download
set "try="
set try=1
if /i %aria2_status% == 1 set aria2=--external-downloader aria2c

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
if /i %cookie_loaded% == 0 if not %format_chosen% == aud (
    echo  cookies.txt needed for 720p and above. Read FAQ on GitHub.
    echo.
)
if /i %format_chosen% == h264 %youtube_dl% %default_config% %conf% %aria2% %subs% %thumbs% -P home:"%loc%" -o "%%(title).175s-H264-%%(height).4sp-%%(id).13s.%%(ext)s" %custom_config_bilibili% %cookies% "%url%" && set bilibili_download_status=1 & goto :EOF
if /i %format_chosen% == hevc %youtube_dl% %default_config% %conf% %aria2% --merge-output-format mp4 %subs% %thumbs% -P home:"%loc%" -o "%%(title).175s-HEVC-%%(height).4sp-%%(id).13s.%%(ext)s" %custom_config_bilibili% %cookies% "%url%" && set bilibili_download_status=1 & goto :EOF
if /i %format_chosen% == av1 %youtube_dl% %default_config% %conf% %aria2% --merge-output-format mp4 %subs% %thumbs% -P home:"%loc%" -o "%%(title).176s-AV1-%%(height).4sp-%%(id).13s.%%(ext)s" %custom_config_bilibili% %cookies% "%url%" && set bilibili_download_status=1 & goto :EOF
if /i %format_chosen% == aud %youtube_dl% %default_config% %conf% %aria2% %thumbs% --add-metadata -P home:"%loc%" -o "%%(title).183s-%aud_end%-%%(id).13s.%%(ext)s" %custom_config_bilibili% %cookies% "%url%" && set bilibili_download_status=1 & goto :EOF
if /i %format_chosen% == custom %youtube_dl% %default_config% %conf% %aria2% %subs% %thumbs% -P home:"%loc%" -o "%%(title).174s-%bilibili_qual%-%%(id).13s.%%(ext)s" %custom_config_bilibili% %cookies% "%url%" && set bilibili_download_status=1 & goto :EOF
set /a try=%try%+1
if /i %try% GTR %max_try% set bilibili_download_status=0 & goto :EOF
goto downloadTried
