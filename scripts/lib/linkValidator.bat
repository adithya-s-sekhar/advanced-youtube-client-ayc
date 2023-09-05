set linkValidator.arg1=%~1

set link_validator=0
set youtube_link=0
set bilibili_link=0
set twitch_link=0
set generic_link=0

echo %linkValidator.arg1% | findstr /i /r /c:"^http://" /c:"^https://" > nul
if %errorlevel% == 0 (
    set link_validator=1
) else (
    goto :EOF
)

echo %linkValidator.arg1% | findstr /i /r /c:"^https://www.youtube.com" /c:"^https://m.youtube.com" /c:"^https://youtube.com" /c:"^https://youtu.be" /c:"^http://www.youtube.com" /c:"^http://m.youtube.com" /c:"^http://youtube.com" /c:"^http://youtu.be" > nul
if %errorlevel% == 0 set youtube_link=1 && goto :EOF

echo %linkValidator.arg1% | findstr /i /r /c:"^https://www.bilibili.com" /c:"^https://bilibili.com" /c:"^http://www.bilibili.com" /c:"^http://bilibili.com" /c:"^https://www.bilibili.tv" /c:"^https://bilibili.tv" /c:"^http://www.bilibili.tv" /c:"^http://bilibili.tv" > nul
if %errorlevel% == 0 set bilibili_link=1 && goto :EOF

echo %linkValidator.arg1% | findstr /i /r /c:"^https://www.twitch.tv" /c:"^https://twitch.tv" /c:"^http://www.twitch.tv" /c:"^http://twitch.tv" > nul
if %errorlevel% == 0 set twitch_link=1 && goto :EOF

set generic_link=1

echo %linkValidator.arg1% | findstr /i /r /c:"^https://www.reddit.com" /c:"^https://reddit.com" /c:"^http://www.reddit.com" /c:"^http://reddit.com" /c:"^http://redd.it" /c:"^https://redd.it" /c:"^http://v.redd.it" /c:"^https://v.redd.it" > nul
if %errorlevel% == 0 call siteFixes reddit && goto :EOF

goto :EOF
