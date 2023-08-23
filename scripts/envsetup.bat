set scripts_path=%cd%\scripts
set path=%path%;%scripts_path%\downloader;%scripts_path%\lib;%scripts_path%\pages;%scripts_path%\settings;%scripts_path%\tui;
set name=Advanced Youtube Client - AYC
set major_ver=4
set minor_ver=8
set ver_day=22
set ver_month=Aug
set ver_year=2023
set ver_date=%ver_day%/%ver_month%/%ver_year%
set display_version=v%major_ver%.%minor_ver% (%ver_date%)
set error_format=0
set error_mode=0
set window_medium=con:cols=92 lines=26
set window_small=con:cols=60 lines=35
set window_large=con:cols=180 lines=500
set batch_deleted_job=0
set url_invalid=0
set job_name_invalid=0
set url_validation_msg=Invalid URL. URL should begin with http:// or https://.
set show_quickkey=0
set cookie_loaded=0
set cookies= 
:: leave a space in cookies for initializing or it'll crash.
:: need to find a better way.
set no_cookie_found=0

if not exist "%cd%\data" md "%cd%\data"

set aycdata=%cd%\data
set youtube_dl=yt-dlp.exe

if not exist "%aycdata%\first_run.txt" call firstRun

if not exist "%aycdata%\dir.txt" (
    md "%cd%\Output"
    echo "%cd%\Output">"%aycdata%\dir.txt"
)
set /p loc=<"%aycdata%\dir.txt"
set loc=%loc:"=%
if not exist "%loc%\" md "%loc%"
if not exist "%loc%\" (
    set loc_invalid=1
    call settingsChangeDir
) else (
    set loc_invalid=0
)

if not exist "%aycdata%\tmp_dir.txt" (
    md "%cd%\tmp"
    echo "%cd%\tmp">"%aycdata%\tmp_dir.txt"
)
set /p tmp_loc=<"%aycdata%\tmp_dir.txt"
set tmp_loc=%tmp_loc:"=%
if not exist "%tmp_loc%\" md "%tmp_loc%"
if not exist "%tmp_loc%\" (
    set tmp_loc_invalid=1
    call settingsChangeTmpDir
) else (
    set tmp_loc_invalid=0
)

if not exist "%aycdata%\try.txt" echo "0">"%aycdata%\try.txt"
set /p defined_try=<"%aycdata%\try.txt"
set defined_try=%defined_try:"=%
echo %defined_try%| findstr /r "^[0-9][0-9]*$">nul
if not %errorlevel% == 0 (
    set try_invalid=1
    call settingsChangeDefinedTry
) else (
    set try_invalid=0
)
set /a max_try=%defined_try%+1

if not exist "%aycdata%\aria2_status.txt" echo "1">"%aycdata%\aria2_status.txt"
set /p aria2_status=<"%aycdata%\aria2_status.txt"
set aria2_status=%aria2_status:"=%
if %aria2_status% == 0 set aria2=--concurrent-fragments 8
if %aria2_status% == 2 set aria2=--external-downloader aria2c

if not exist "%aycdata%\thumbs_status.txt" echo "1">"%aycdata%\thumbs_status.txt"
set /p thumbs_status=<"%aycdata%\thumbs_status.txt"
set thumbs_status=%thumbs_status:"=%
if %thumbs_status% == 0 set "thumbs="
if %thumbs_status% == 1 set thumbs=--embed-thumbnail

if not exist "%aycdata%\subs_status.txt" echo "0">"%aycdata%\subs_status.txt"
set /p subs_status=<"%aycdata%\subs_status.txt"
set subs_status=%subs_status:"=%
if %subs_status% == 0 set "subs="
if %subs_status% == 1 set subs=--write-auto-sub --embed-subs

if not exist "%aycdata%\youtube_dl_version.txt" echo "unknown">"%aycdata%\youtube_dl_version.txt"
set /p youtube_dl_version=<"%aycdata%\youtube_dl_version.txt"
set youtube_dl_version=%youtube_dl_version:"=%

set default_config=--ignore-errors --no-warnings --windows-filenames --embed-chapters -P temp:"%tmp_loc%"

goto :EOF
