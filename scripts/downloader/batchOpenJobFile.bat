:batchOpenJobFile
call tui windowSize %small_width% 30
title Edit Job File
color %theme_colors%
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
call tui borderSmallHalf
echo.
echo  Job File is opened in Notepad. Follow instructions.
echo.
echo  1) Add links one by one on each line.
echo.
echo  2) Delete links you don't want.
echo.
echo  3) Empty lines will be skipped.
echo.
echo  4) After Adding links, close Notepad and click Save.
notepad.exe "%loc%\%job_name%\%job_name%.txt"
goto :EOF