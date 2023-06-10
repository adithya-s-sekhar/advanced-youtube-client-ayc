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


goto :EOF
