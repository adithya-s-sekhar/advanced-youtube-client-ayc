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

set scripts_path=%aycroot%\resources\scripts
set path=%path%;%scripts_path%\downloader;
set path=%path%;%scripts_path%\downloader\batch;
set path=%path%;%scripts_path%\lib;
set path=%path%;%scripts_path%\pages;
set path=%path%;%scripts_path%\settings;
set path=%path%;%scripts_path%\tui;
set name=Advanced Youtube Client - AYC
set short_name=AYC
set major_ver=4
set minor_ver=22
set ver_day=06
set ver_month=Jun
set ver_year=2024
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

if not exist "%aycroot%\resources\data" md "%aycroot%\resources\data"
if not exist "%aycroot%\resources\history" md "%aycroot%\resources\history"
if not exist "%aycroot%\resources\history\download-history.txt" echo.>>"%aycroot%\resources\history\download-history.txt"

set aycdata=%aycroot%\resources\data
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
    md "%aycroot%\resources\tmp"
    echo "%aycroot%\resources\tmp">"%aycdata%\tmp_dir.txt"
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
if /i %aria2_status% == 0 set aria2=--concurrent-fragments 8
if /i %aria2_status% == 2 set aria2=--external-downloader aria2c

if not exist "%aycdata%\thumbs_status.txt" echo "0">"%aycdata%\thumbs_status.txt"
set /p thumbs_status=<"%aycdata%\thumbs_status.txt"
set thumbs_status=%thumbs_status:"=%
if /i %thumbs_status% == 0 set "thumbs="
if /i %thumbs_status% == 1 set thumbs=--embed-thumbnail

if not exist "%aycdata%\subs_status.txt" echo "0">"%aycdata%\subs_status.txt"
set /p subs_status=<"%aycdata%\subs_status.txt"
set subs_status=%subs_status:"=%

if not exist "%aycdata%\sub_type.txt" echo "1">"%aycdata%\sub_type.txt"
set /p sub_type=<"%aycdata%\sub_type.txt"
set sub_type=%sub_type:"=%

if not exist "%aycdata%\sub_lang.txt" echo "en">"%aycdata%\sub_lang.txt"
set /p sub_lang=<"%aycdata%\sub_lang.txt"
set sub_lang=%sub_lang:"=%
set sub_lang=%sub_lang: =%

if not exist "%aycdata%\auto_subs.txt" echo "0">"%aycdata%\auto_subs.txt"
set /p auto_subs=<"%aycdata%\auto_subs.txt"
set auto_subs=%auto_subs:"=%
set auto_subs=%auto_subs: =%

if /i %subs_status% == 0 (
    call :subs_disabled
) else (
    call :subs_enabled
)

if not exist "%aycdata%\youtube_dl_version.txt" echo "unknown">"%aycdata%\youtube_dl_version.txt"
set /p youtube_dl_version=<"%aycdata%\youtube_dl_version.txt"
set youtube_dl_version=%youtube_dl_version:"=%

if not exist "%aycdata%\ytupd_onstart.txt" echo "1">"%aycdata%\ytupd_onstart.txt"
set /p ytupd_onstart=<"%aycdata%\ytupd_onstart.txt"
set ytupd_onstart=%ytupd_onstart:"=%

set default_config=--ignore-errors --no-warnings --windows-filenames --embed-chapters --no-mtime --color %yt-dlp_color% -P temp:"%tmp_loc%"

goto :EOF

:subs_disabled
set "subs="
goto :EOF

:subs_enabled
set "subs="
if /i "%auto_subs%" == "1" set subs=--write-auto-sub
set subs=%subs% --convert-subs srt
:: comment the above line to disable srt conversion
if /i "%sub_type%" == "1" set subs=%subs% --write-subs
if /i "%sub_type%" == "2" set subs=%subs% --write-subs --embed-subs --compat-options no-keep-subs
set subs=%subs% --sub-langs %sub_lang%
goto :EOF
