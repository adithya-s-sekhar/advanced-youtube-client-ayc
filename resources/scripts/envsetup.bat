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

set scripts_path=%aychome%\scripts
set path=%path%;%scripts_path%\downloader;
set path=%path%;%scripts_path%\downloader\batch;
set path=%path%;%scripts_path%\lib;
set path=%path%;%scripts_path%\pages;
set path=%path%;%scripts_path%\settings;
set path=%path%;%scripts_path%\tui;
set name=Advanced Youtube Client - AYC
set short_name=AYC
set major_ver=4
set minor_ver=14
set ver_day=02
set ver_month=Oct
set ver_year=2023
set ver_date=%ver_day%/%ver_month%/%ver_year%
set display_version=v%major_ver%.%minor_ver%
set small_width=60
set medium_width=92
set large_width=180
set error_format=0
set error_mode=0
set batch_deleted_job=0
set url_invalid=0
set job_name_invalid=0
set url_validation_msg=Invalid URL. URL should begin with http:// or https://.
set cookie_loaded=0
set cookies= 
:: leave a space in cookies for initializing or it'll crash.
:: need to find a better way.
set no_cookie_found=0

if not exist "%aychome%\data" md "%aychome%\data"
if not exist "%aychome%\history" md "%aychome%\history"
if not exist "%aychome%\history\download-history.txt" echo.>>"%aychome%\history\download-history.txt"

set aycdata=%aychome%\data
set youtube_dl=yt-dlp.exe

if not exist "%aycdata%\theme_status.txt" echo "0">"%aycdata%\theme_status.txt"
set /p theme_status=<"%aycdata%\theme_status.txt"
set theme_status=%theme_status:"=%
call themer

if not exist "%aycdata%\first_run.txt" call firstRun

if not exist "%aycdata%\dir.txt" (
    md "%aycroot%\Downloads"
    echo "%aycroot%\Downloads">"%aycdata%\dir.txt"
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
    md "%aychome%\tmp"
    echo "%aychome%\tmp">"%aycdata%\tmp_dir.txt"
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

if not exist "%aycdata%\thumbs_status.txt" echo "0">"%aycdata%\thumbs_status.txt"
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

if not exist "%aycdata%\ytupd_onstart.txt" echo "1">"%aycdata%\ytupd_onstart.txt"
set /p ytupd_onstart=<"%aycdata%\ytupd_onstart.txt"
set ytupd_onstart=%ytupd_onstart:"=%

set default_config=--ignore-errors --no-warnings --windows-filenames --embed-chapters --no-mtime --color %yt-dlp_color% -P temp:"%tmp_loc%"

goto :EOF