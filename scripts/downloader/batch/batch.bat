:batchHome
if %batch_deleted_job% == 1 if %cookie_loaded% == 1 call tui windowSize %small_width% 35
if %batch_deleted_job% == 1 if %cookie_loaded% == 0 call tui windowSize %small_width% 33
if %batch_deleted_job% == 0 if %cookie_loaded% == 1 call tui windowSize %small_width% 33
if %batch_deleted_job% == 0 if %cookie_loaded% == 0 call tui windowSize %small_width% 31
set batch_exists_true=0
set batch_link_counter=0
color %theme_colors%
title Batch Mode
set "job_name="
cls
call tui bannerSmall
echo.
if %batch_deleted_job% == 1 (
    echo  Deleted job: %batch_deleted_job_name%
    echo.
    set batch_deleted_job=0
)
if %cookie_loaded% == 1 (
    echo  Using cookies.txt
    echo.
)
echo  Batch Mode allows you to create jobs, add videos to that 
echo  job and download it.
echo.
echo  Job URLs are saved and can be resumed by re-entering the 
echo  same job.
echo.
call tui borderSmallHalf
echo.
if %job_name_invalid% == 1 (
    echo Invalid job name.
    echo.
)
set /p job_name=Enter a job name: 
if "%job_name%" equ "" goto batchHome
set job_name=%job_name:"=%
if not exist "%loc%\%job_name%\" md "%loc%\%job_name%">NUL
if not exist "%loc%\%job_name%\" set job_name_invalid=1 && goto batchHome
if exist "%loc%\%job_name%\%job_name%.txt" set batch_exists_true=1 && goto batchJobTypeCheck
echo.>"%loc%\%job_name%\%job_name%.txt"

:batchJobTypeConfirm
echo.
echo Available download modes:
echo.
echo  (0) - Go back
echo.
echo  (1) - Regular (Supports all links)
echo.
echo  (2) - Youtube only (Enables youtube quality selector)
echo.
echo  (3) - Bilibili only (Enables bilibili quality selector)
echo.
echo  (4) - Twitch only (Enables Twitch quality selector)
echo.
call tui borderSmallHalf
echo.
choice /c 01234 /n /m "Select download mode (0-4): "
if %errorlevel% == 1 rd /s /q "%loc%\%job_name%\" && goto batchHome
if %errorlevel% == 2 set job_type=0
if %errorlevel% == 3 set job_type=1
if %errorlevel% == 4 set job_type=2
if %errorlevel% == 5 set job_type=3
echo "%job_type%">"%loc%\%job_name%\job_type.txt"
goto batchManage

:batchJobTypeCheck
if not exist "%loc%\%job_name%\job_type.txt" goto batchJobTypeConfirm
set /p job_type=<"%loc%\%job_name%\job_type.txt"
set job_type=%job_type:"=%


:batchManage
if %cookie_loaded% == 1 (
    call tui windowSize %small_width% 34
) else (
    call tui windowSize %small_width% 32
)
color %theme_colors%
title Now working on %job_name%
cls
call tui bannerSmall
echo.
if %batch_exists_true% == 1 echo  Resuming Job: %job_name%
if %batch_exists_true% == 0 echo  New Job: %job_name%
echo.
if %job_type% == 0 echo  Job type: Regular
if %job_type% == 1 echo  Job type: Youtube only
if %job_type% == 2 echo  Job type: Bilibili only [BETA]
if %job_type% == 3 echo  Job type: Twitch only [BETA]
echo.
if %cookie_loaded% == 1 (
    echo  Using cookies.txt.
    echo.
)
call tui borderSmall
echo.
echo  (0) - Back
echo.
if %batch_link_counter% GTR 1 (
    set batch_link_counter_text=links
) else (
    set batch_link_counter_text=link
)
if %batch_link_counter% GTR 0 echo  (1) - Add video links (%batch_link_counter% %batch_link_counter_text% added now)
if %batch_link_counter% == 0 echo  (1) - Add video links
echo.
echo  (2) - Open job file (Delete, View, Add links through 
echo        Notepad)
echo.
echo  (3) - Change job type
if %job_type% == 0 echo        Currently: Regular
if %job_type% == 1 echo        Currently: Youtube only
if %job_type% == 2 echo        Currently: Bilibili only [BETA]
if %job_type% == 3 echo        Currently: Twitch only [BETA]
echo.
if %batch_exists_true% == 1 echo  (4) - Resume job
if %batch_exists_true% == 0 echo  (4) - Start job
echo.
echo  (5) - Delete job
echo.
call tui borderSmallHalf
echo.
choice /c 012345 /n /m "Select Option (0-5): "
if %errorlevel% == 1 goto batchHome
if %errorlevel% == 2 call batchAddLinks
if %errorlevel% == 3 call batchOpenJobFile
if %errorlevel% == 4 call batchChangeType
if %errorlevel% == 5 goto batchRedirector
if %errorlevel% == 6 call batchDelete
if %batch_deleted_job% == 1 goto batchHome
goto batchManage


:batchRedirector
if %job_type% == 0 goto batchQuickQualitySelector
set "conf="
if %job_type% == 1 call batchYoutube
if %job_type% == 2 call batchBilibili
if %job_type% == 3 call batchTwitch
if not defined conf goto batchManage
if %conf% == "custom" goto batchCustomFormat
goto batchDownload


:batchQuickQualitySelector
call tui windowSize %small_width% 22
color %theme_colors%
title Select Quality
set "batch_link_tmp="
cls
call tui bannerSmall
echo.
echo  Select Quality
echo.
call tui borderSmallHalf
echo.
echo  (0) - Back
echo.
echo  (1) - Highest Quality
echo.
echo  (2) - Lowest Quality
echo.
echo  (3) - Pick a custom format code
echo.
call tui borderSmallHalf
echo.
choice /c 0123 /n /m "Select Option (0-3): "
if %errorlevel% == 1 goto batchManage
if %errorlevel% == 2 set conf=-"f bv*+ba/b" && set batch_name_end=high && set format_chosen=batch && goto batchDownload
if %errorlevel% == 3 set conf="-f wv*+wa/w" && set batch_name_end=low && set format_chosen=batch && goto batchDownload
if %errorlevel% == 4 goto batchCustomFormat


:batchCustomFormat
call tui windowSize %medium_width% 26
set "batch_custom_format_url="
color %theme_colors%
title Pick custom format code
cls
call tui bannerMedium
echo.
echo  Working on: %job_name%
echo.
if %cookie_loaded% == 1 (
    echo  Using cookies.txt.
    echo.
)
echo  Leave blank and press Enter to Go back.
echo.
echo  Paste a sample URL from your batch job to retrieve all available qualities.
echo.
call tui borderSmallHalf
echo.
if %url_invalid% == 1 (
    echo %url_validation_msg%
    echo.
)
set /p batch_custom_format_url=Sample URL: 
set batch_custom_format_url=%batch_custom_format_url: =%
if "%batch_custom_format_url%" equ "" goto batchRedirector
if "%batch_custom_format_url%" equ " =" goto batchRedirector

call linkValidator "%batch_custom_format_url%"
if %link_validator% == 1 (
    set url_invalid=0
    goto batchCustomFormatSelector
) else (
    set url_invalid=1
    goto batchCustomFormat
)

:batchCustomFormatSelector
call tui windowSize %large_width% 500
set "batch_custom_qual="
title Retrieving all available qualities
color %theme_colors%
cls
call tui bannerLarge
echo.
echo  Working on: %job_name%
echo.
echo  Sample URL: %batch_custom_format_url%
echo.
if %cookie_loaded% == 1 (
    echo  Using cookies.txt.
    echo.
)
%youtube_dl% %cookies% -F "%batch_custom_format_url%" && goto batchCustomFormatSelectorContinue
set error_mode=batch
goto error
:batchCustomFormatSelectorContinue
echo.
call tui borderLargeHalf
echo.
echo Leave blank and press Enter to Go back.
echo.
echo Merge two formats using + symbol.
echo.
echo You can also type 'best', 'b', 'worst', 'w'.
echo.
set /p batch_custom_qual=Choose ID (green color in the list above): 
set batch_custom_qual=%batch_custom_qual: =%
if "%batch_custom_qual%" equ "" goto batchCustomFormat
if "%batch_custom_qual%" equ " =" goto batchCustomFormat
set batch_custom_qual=%batch_custom_qual:'=%
set batch_custom_qual=%batch_custom_qual:"=%
set conf="-f %batch_custom_qual%"
set batch_name_end=%batch_custom_qual%
set format_chosen=batch
goto batchDownload


:batchDownload
call batchDownload
goto :EOF
