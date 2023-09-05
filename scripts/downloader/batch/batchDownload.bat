:batchDownload
set "try="
set try=1
set conf=%conf:"=%

if %aria2_status% == 1 if not %job_type% == 1 set aria2=--external-downloader aria2c
if %aria2_status% == 1 if %job_type% == 1 set aria2=--concurrent-fragments 8

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
if %job_type% == 0 echo  Job type: Regular
if %job_type% == 1 echo  Job type: Youtube only
if %job_type% == 2 echo  Job type: Bilibili only
if %job_type% == 3 echo  Job type: Twitch only
echo.
if %cookie_loaded% == 1 (
    echo  Using cookies.txt.
    echo.
)
if %cookie_loaded% == 0 if %job_type% == 2 (
    echo  cookies.txt needed for 720p and above. Read FAQ on GitHub.
    echo.
)
if %format_chosen% == h264 %youtube_dl% %default_config% %conf% %aria2% %subs% %thumbs% -P home:"%loc%\%job_name%" -o "%%(title)s-MP4-%%(height)sp-%%(id)s.%%(ext)s" %custom_config_batch_yt% %cookies% -a "%loc%\%job_name%\%job_name%.txt" && set batch_download_status=1 && goto :EOF
if %format_chosen% == vp9 %youtube_dl% %default_config% %conf% %aria2% %subs% %thumbs% -P home:"%loc%\%job_name%" --merge-output-format mp4 -o "%%(title)s-VP9-%%(height)sp-%%(id)s.%%(ext)s" %custom_config_batch_yt% %cookies% -a "%loc%\%job_name%\%job_name%.txt" && set batch_download_status=1 && goto :EOF
if %format_chosen% == av1 %youtube_dl% %default_config% %conf% %aria2% %subs% %thumbs% -P home:"%loc%\%job_name%" --merge-output-format mp4 -o "%%(title)s-AV1-%%(height)sp-%%(id)s.%%(ext)s" %custom_config_batch_yt% %cookies% -a "%loc%\%job_name%\%job_name%.txt" && set batch_download_status=1 && goto :EOF
if %format_chosen% == aud %youtube_dl% %default_config% %conf% %aria2% %thumbs% --add-metadata -P home:"%loc%\%job_name%" -o "%%(title)s-%%(id)s.%%(ext)s" %custom_config_batch_yt% %cookies% -a "%loc%\%job_name%\%job_name%.txt" && set batch_download_status=1 && goto :EOF

if %format_chosen% == b_h264 %youtube_dl% %default_config% %conf% %aria2% %subs% %thumbs% -P home:"%loc%\%job_name%" -o "%%(title)s-MP4-%%(height)sp-%%(id)s.%%(ext)s" %custom_config_batch_bilibili% %cookies% -a "%loc%\%job_name%\%job_name%.txt" && set batch_download_status=1 && goto :EOF
if %format_chosen% == b_hevc %youtube_dl% %default_config% %conf% %aria2% %subs% %thumbs% -P home:"%loc%\%job_name%" --merge-output-format mp4 -o "%%(title)s-HEVC-%%(height)sp-%%(id)s.%%(ext)s" %custom_config_batch_bilibili% %cookies% -a "%loc%\%job_name%\%job_name%.txt" && set batch_download_status=1 && goto :EOF
if %format_chosen% == b_av1 %youtube_dl% %default_config% %conf% %aria2% %subs% %thumbs% -P home:"%loc%\%job_name%" --merge-output-format mp4 -o "%%(title)s-AV1-%%(height)sp-%%(id)s.%%(ext)s" %custom_config_batch_bilibili% %cookies% -a "%loc%\%job_name%\%job_name%.txt" && set batch_download_status=1 && goto :EOF
if %format_chosen% == b_aud %youtube_dl% %default_config% %conf% %aria2% %thumbs% --add-metadata -P home:"%loc%\%job_name%" -o "%%(title)s-%aud_end%-%%(id)s.%%(ext)s" %custom_config_batch_bilibili% %cookies% -a "%loc%\%job_name%\%job_name%.txt" && set batch_download_status=1 && goto :EOF
if %format_chosen% == b_custom %youtube_dl% %default_config% %conf% %aria2% %subs% %thumbs% -P home:"%loc%\%job_name%" -o "%%(title)s-%batch_name_end%-%%(id)s.%%(ext)s" %custom_config_batch_bilibili% %cookies% -a "%loc%\%job_name%\%job_name%.txt" && set batch_download_status=1 && goto :EOF

if %format_chosen% == twitch %youtube_dl% %default_config% %conf% %aria2% %subs% %thumbs% -P home:"%loc%\%job_name%" -o "%%(title)s-%batch_name_end%-%%(id)s.%%(ext)s" %custom_config_batch_twitch% %cookies% -a "%loc%\%job_name%\%job_name%.txt" && set batch_download_status=1 && goto :EOF

if %format_chosen% == batch %youtube_dl% %default_config% %conf% %aria2% %subs% %thumbs% -P home:"%loc%\%job_name%" -o "%%(title)s-%batch_name_end%-%%(id)s.%%(ext)s" %custom_config_batch_all% %cookies% -a "%loc%\%job_name%\%job_name%.txt" && set batch_download_status=1 && goto :EOF
set /a try=%try%+1
if %try% GTR %max_try% set batch_download_status=0 && goto :EOF
goto batchDownloadTried
