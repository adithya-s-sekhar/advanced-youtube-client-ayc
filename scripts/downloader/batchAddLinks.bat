:batchAddLinks
call tui windowSize %small_width% 36
color %theme_colors%
title Leave blank and Enter to go back.
cls
call tui bannerSmall
echo.
echo  Paste each url and press enter, the links will be added to 
echo  your list.
echo.
echo  Leave blank and Enter to go back.
echo.
call tui borderSmallHalf
echo.

:batchAddLinksLoop
set "batch_link_tmp="
set /p batch_link_tmp=Paste Link: 
if "%batch_link_tmp%" equ "" goto :EOF
echo.
for /f "tokens=1 delims=&" %%a in ("%batch_link_tmp%") do (
  set batch_link_tmp=%%a
)

call linkValidator "%batch_link_tmp%"
if %link_validator% == 1 (
    goto batchAddLinksLoop2
) else (
    echo %url_validation_msg%
    echo.
    goto batchAddLinksLoop
)

:batchAddLinksLoop2
if %job_type% == 1 if not %youtube_link% == 1 (
    echo ERROR: Invalid link. This is a Youtube only Job.
    echo.
    echo Change job type to Regular to add non-youtube links.
    echo.
    goto batchAddLinksLoop
)
if %job_type% == 2 if not %bilibili_link% == 1 (
    echo ERROR: Invalid link. This is a Bilibili only Job.
    echo.
    echo Change job type to Regular to add non-bilibili links.
    echo.
    goto batchAddLinksLoop
)
if %job_type% == 3 if not %twitch_link% == 1 (
    echo ERROR: Invalid link. This is a Twitch only Job.
    echo.
    echo Change job type to Regular to add non-twitch links.
    echo.
    goto batchAddLinksLoop
)
call siteFixes "%batch_link_tmp%"
echo %batch_link_tmp%>>"%loc%\%job_name%\%job_name%.txt"
set /a batch_link_counter=%batch_link_counter%+1
echo Link Saved.
echo.
goto batchAddLinksLoop
