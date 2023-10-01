set yt-dlp_color=no_color
if %theme_status% == 0 set theme_colors=07 && set yt-dlp_color=auto
if %theme_status% == 1 set theme_colors=F0
if %theme_status% == 2 set theme_colors=9F
if %theme_status% == 3 set theme_colors=DF
if %theme_status% == 4 set theme_colors=E0
if %theme_status% == 5 set theme_colors=CF
color %theme_colors%
goto :EOF
