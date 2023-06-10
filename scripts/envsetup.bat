set version=v3.28 (05/Jun/2023)
set error_format=0
set error_mode=0
set is_batch=0
set pass_to_uni=0
set window_medium=con:cols=92 lines=26
set window_small=con:cols=60 lines=35
set window_large=con:cols=180 lines=500
set batch_deleted_job=0
set youtube_dl=0
set url_invalid=0
set job_name_invalid=0
set youtube_dl_version=unknown
set from_url=0
set url_validation_msg=Invalid URL. URL should begin with http:// or https://.
set show_quickkey=0

if not exist "%cd%\data" md "%cd%\data"
if not exist "%cd%\Output" md "%cd%\Output"

set aycdata=%cd%\data
set youtube_dl=yt-dlp.exe
set default_config=--ignore-errors --no-warnings --windows-filenames --embed-chapters

if not exist "%aycdata%\dir.txt" call :dirMissing
set /p loc=<"%aycdata%\dir.txt"
set loc=%loc:"=%
if not exist "%loc%\" md "%loc%"
if not exist "%loc%\" (
    set loc_invalid=1
) else (
    set loc_invalid=0
)

if not exist "%aycdata%\try.txt" call :tryMissing
set /p defined_try=<"%aycdata%\try.txt"
set defined_try=%defined_try:"=%
echo %defined_try%| findstr /r "^[0-9][0-9]*$">nul
if not %errorlevel% == 0 (
    set try_invalid=1
) else (
    set try_invalid=0
)

if not exist "%aycdata%\aria2_status.txt" call :aria2StatusMissing
set /p aria2_status=<"%aycdata%\aria2_status.txt"
set aria2_status=%aria2_status:"=%

if not exist "%aycdata%\thumbs_status.txt" call :thumbsStatusMissing
set /p thumbs_status=<"%aycdata%\thumbs_status.txt"
set thumbs_status=%thumbs_status:"=%

if not exist "%aycdata%\subs_status.txt" call :subsStatusMissing
set /p subs_status=<"%aycdata%\subs_status.txt"
set subs_status=%subs_status:"=%

set /p youtube_dl_version=<"%aycdata%\youtube_dl_version.txt"
set youtube_dl_version=%youtube_dl_version:"=%

goto :EOF

:externalVersionMissing
echo "%internal_version%">"%aycdata%\external_version.txt"
goto :EOF


:dirMissing
md "%cd%\Output"
echo "%cd%\Output">"%aycdata%\dir.txt"
goto :EOF


:tryMissing
echo "0">"%aycdata%\try.txt"
goto :EOF


:aria2StatusMissing
echo "0">"%aycdata%\aria2_status.txt"
goto :EOF


:thumbsStatusMissing
echo "1">"%aycdata%\thumbs_status.txt"
goto :EOF


:subsStatusMissing
echo "0">"%aycdata%\subs_status.txt"
goto :EOF
