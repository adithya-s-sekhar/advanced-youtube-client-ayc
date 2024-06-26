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

:formatSelector
call tui windowSize %small_width% 36
color %theme_colors%
title Choose Format
cls
call tui bannerSmall
echo.
echo  Working on: %job_name%
echo.
echo  Job Type: Bilibili only
echo.
if /i %cookie_loaded% == 1 (
    echo  Using cookies.txt.
    echo.
) else (
    echo  cookies.txt needed for 720p and above. Read FAQ on GitHub.
    echo.
)
echo   (0) - Back
echo.
echo  Choose format
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
echo   (4) - M4A - AAC Audio - 3 Qualities
echo.
call tui borderSmall
echo.
echo   (5) - Pick a Custom Format
echo.
call tui borderSmallHalf
echo.
choice /c 012345 /n /m "Select Option (0-5): "
if /i %errorlevel% == 1 goto :EOF
if /i %errorlevel% == 2 set format_chosen=b_h264 & goto qualitySelector
if /i %errorlevel% == 3 set format_chosen=b_hevc & goto qualitySelector
if /i %errorlevel% == 4 set format_chosen=b_av1 & goto qualitySelector
if /i %errorlevel% == 5 set format_chosen=b_aud & goto bilibiliM4a
if /i %errorlevel% == 6 set format_chosen=b_custom & set conf="custom" & goto :EOF

:qualitySelector
call tui windowSize %small_width% 28
color %theme_colors%
if /i %format_chosen% == b_h264 title  Format: .MP4 (H264 Video/AAC Audio)
if /i %format_chosen% == b_hevc title  Format: .MP4 (HEVC Video/AAC Audio)
if /i %format_chosen% == b_av1 title  Format: .MP4 (AV1 Video/AAC Audio)
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
if /i %format_chosen% == b_h264 echo  Format: .MP4 (H264 Video/AAC Audio)
if /i %format_chosen% == b_hevc echo  Format: .MP4 (HEVC Video/AAC Audio)
if /i %format_chosen% == b_av1 echo  Format: .MP4 (AV1 Video/AAC Audio)
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
if /i %errorlevel% == 2 set conf="-f bestvideo[vcodec^=avc1][height<=360]+0/bestvideo[vcodec^=avc1][height<=360]+worstaudio[ext=m4a]" & goto :EOF
if /i %errorlevel% == 3 set conf="-f bestvideo[vcodec^=avc1][height<=480]+1/bestvideo[vcodec^=avc1][height<=480]+worstaudio[ext=m4a]" & goto :EOF
if /i %errorlevel% == 4 set conf="-f bestvideo[vcodec^=avc1][height<=720]+1/bestvideo[vcodec^=avc1][height<=720]+bestaudio[ext=m4a]" & goto :EOF
if /i %errorlevel% == 5 set conf="-f bestvideo[vcodec^=avc1][height<=1080]+2/bestvideo[vcodec^=avc1][height<=1080]+bestaudio[ext=m4a]" & goto :EOF

:choiceHevc
echo.
choice /c 01234 /n /m "Select Option (0-4): "
if /i %errorlevel% == 1 goto formatSelector
if /i %errorlevel% == 2 set conf="-f bestvideo[vcodec^=hev1][height<=360]+0/bestvideo[vcodec^=hev1][height<=360]+worstaudio[ext=m4a]" & goto :EOF
if /i %errorlevel% == 3 set conf="-f bestvideo[vcodec^=hev1][height<=480]+1/bestvideo[vcodec^=hev1][height<=480]+worstaudio[ext=m4a]" & goto :EOF
if /i %errorlevel% == 4 set conf="-f bestvideo[vcodec^=hev1][height<=720]+1/bestvideo[vcodec^=hev1][height<=720]+bestaudio[ext=m4a]" & goto :EOF
if /i %errorlevel% == 5 set conf="-f bestvideo[vcodec^=hev1][height<=1080]+2/bestvideo[vcodec^=hev1][height<=1080]+bestaudio[ext=m4a]" & goto :EOF

:choiceAv1
set error_format=av1
echo.
choice /c 01234 /n /m "Select Option (0-4): "
if /i %errorlevel% == 1 goto formatSelector
if /i %errorlevel% == 2 set conf="-f bestvideo[vcodec^=av01][height<=360]+0/bestvideo[vcodec^=av01][height<=360]+worstaudio[ext=m4a]" & goto :EOF
if /i %errorlevel% == 3 set conf="-f bestvideo[vcodec^=av01][height<=480]+1/bestvideo[vcodec^=av01][height<=480]+worstaudio[ext=m4a]" & goto :EOF
if /i %errorlevel% == 4 set conf="-f bestvideo[vcodec^=av01][height<=720]+1/bestvideo[vcodec^=av01][height<=720]+bestaudio[ext=m4a]" & goto :EOF
if /i %errorlevel% == 5 set conf="-f bestvideo[vcodec^=av01][height<=1080]+2/bestvideo[vcodec^=av01][height<=1080]+bestaudio[ext=m4a]" & goto :EOF


:batchBilibiliM4a
if /i %cookie_loaded% == 1 (
    call tui windowSize %small_width% 23
) else (
    call tui windowSize %small_width% 21
)
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
if /i %errorlevel% == 2 set aud_end=lq & set conf="-f worstaudio[ext=m4a]" & goto :EOF
if /i %errorlevel% == 3 set aud_end=mq & set conf="-f 1/bestaudio[ext=m4a]" & goto :EOF
if /i %errorlevel% == 4 set aud_end=hq & set conf="-f bestaudio[ext=m4a]" & goto :EOF
