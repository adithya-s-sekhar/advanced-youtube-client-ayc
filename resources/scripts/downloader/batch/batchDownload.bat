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

:batchDownload
set "try="
set try=1
set conf=%conf:"=%
if /i %aria2_status% == 1 if not %job_type% == 1 set aria2=--external-downloader aria2c
if /i %aria2_status% == 1 if /i %job_type% == 1 set aria2=--concurrent-fragments 8

:batchDownloadTried
set error_mode=batch
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
echo  Job: %job_name%
echo.
if /i %job_type% == 0 echo  Job type: Regular
if /i %job_type% == 1 echo  Job type: Youtube only
if /i %job_type% == 2 echo  Job type: Bilibili only
if /i %job_type% == 3 echo  Job type: Twitch only
echo.
if /i %cookie_loaded% == 1 (
    echo  Using cookies.txt.
    echo.
)
if /i %cookie_loaded% == 0 if /i %job_type% == 2 (
    echo  cookies.txt needed for 720p and above. Read FAQ on GitHub.
    echo.
)
if /i %format_chosen% == h264 %youtube_dl% %default_config% %conf% %aria2% %subs% %thumbs% -P home:"%loc%\%job_name%" -o "%%(title).177s-MP4-%%(height).4sp-%%(id).12s.%%(ext)s" %custom_config_batch_yt% %cookies% -a "%loc%\%job_name%\%job_name%.txt" && set batch_download_status=1 & goto :EOF
if /i %format_chosen% == vp9 %youtube_dl% %default_config% %conf% %aria2% %subs% %thumbs% -P home:"%loc%\%job_name%" --merge-output-format mp4 -o "%%(title).177s-VP9-%%(height).4sp-%%(id).12s.%%(ext)s" %custom_config_batch_yt% %cookies% -a "%loc%\%job_name%\%job_name%.txt" && set batch_download_status=1 & goto :EOF
if /i %format_chosen% == av1 %youtube_dl% %default_config% %conf% %aria2% %subs% %thumbs% -P home:"%loc%\%job_name%" --merge-output-format mp4 -o "%%(title).177s-AV1-%%(height).4sp-%%(id).12s.%%(ext)s" %custom_config_batch_yt% %cookies% -a "%loc%\%job_name%\%job_name%.txt" && set batch_download_status=1 & goto :EOF
if /i %format_chosen% == m4a %youtube_dl% %default_config% %conf% %aria2% %thumbs% --add-metadata -P home:"%loc%\%job_name%" -o "%%(title).177s-%%(id).12s.%%(ext)s" %custom_config_batch_yt% %cookies% -a "%loc%\%job_name%\%job_name%.txt" && set batch_download_status=1 & goto :EOF
if /i %format_chosen% == mp3 %youtube_dl% %default_config% %conf% %aria2% %thumbs% --add-metadata -P home:"%loc%\%job_name%" -o "%%(title).177s-%%(id).12s.%%(ext)s" %custom_config_batch_yt% %cookies% -a "%loc%\%job_name%\%job_name%.txt" && set batch_download_status=1 & goto :EOF
if /i %format_chosen% == webm %youtube_dl% %default_config% %conf% %aria2% %thumbs% --add-metadata -P home:"%loc%\%job_name%" -o "%%(title).177s-%%(id).12s.%%(ext)s" %custom_config_batch_yt% %cookies% -a "%loc%\%job_name%\%job_name%.txt" && set batch_download_status=1 & goto :EOF

if /i %format_chosen% == b_h264 %youtube_dl% %default_config% %conf% %aria2% %subs% %thumbs% -P home:"%loc%\%job_name%" -o "%%(title).175s-MP4-%%(height).4sp-%%(id).13s.%%(ext)s" %custom_config_batch_bilibili% %cookies% -a "%loc%\%job_name%\%job_name%.txt" && set batch_download_status=1 & goto :EOF
if /i %format_chosen% == b_hevc %youtube_dl% %default_config% %conf% %aria2% %subs% %thumbs% -P home:"%loc%\%job_name%" --merge-output-format mp4 -o "%%(title).175s-HEVC-%%(height).4sp-%%(id).13s.%%(ext)s" %custom_config_batch_bilibili% %cookies% -a "%loc%\%job_name%\%job_name%.txt" && set batch_download_status=1 & goto :EOF
if /i %format_chosen% == b_av1 %youtube_dl% %default_config% %conf% %aria2% %subs% %thumbs% -P home:"%loc%\%job_name%" --merge-output-format mp4 -o "%%(title).176s-AV1-%%(height).4sp-%%(id).13s.%%(ext)s" %custom_config_batch_bilibili% %cookies% -a "%loc%\%job_name%\%job_name%.txt" && set batch_download_status=1 & goto :EOF
if /i %format_chosen% == b_aud %youtube_dl% %default_config% %conf% %aria2% %thumbs% --add-metadata -P home:"%loc%\%job_name%" -o "%%(title).183s-%aud_end%-%%(id).13s.%%(ext)s" %custom_config_batch_bilibili% %cookies% -a "%loc%\%job_name%\%job_name%.txt" && set batch_download_status=1 & goto :EOF
if /i %format_chosen% == b_custom %youtube_dl% %default_config% %conf% %aria2% %subs% %thumbs% -P home:"%loc%\%job_name%" -o "%%(title).174s-%batch_name_end%-%%(id).13s.%%(ext)s" %custom_config_batch_bilibili% %cookies% -a "%loc%\%job_name%\%job_name%.txt" && set batch_download_status=1 & goto :EOF

if /i %format_chosen% == twitch %youtube_dl% %default_config% %conf% %aria2% %subs% %thumbs% -P home:"%loc%\%job_name%" -o "%%(title).182s-%batch_name_end%-%%(id).11s.%%(ext)s" %custom_config_batch_twitch% %cookies% -a "%loc%\%job_name%\%job_name%.txt" && set batch_download_status=1 & goto :EOF

if /i %format_chosen% == batch %youtube_dl% %default_config% %conf% %aria2% %subs% %thumbs% -P home:"%loc%\%job_name%" -o "%%(title).170s-%batch_name_end%-%%(id).13s.%%(ext)s" %custom_config_batch_all% %cookies% -a "%loc%\%job_name%\%job_name%.txt" && set batch_download_status=1 & goto :EOF
set /a try=%try%+1
if /i %try% GTR %max_try% set batch_download_status=0 & goto :EOF
goto batchDownloadTried
