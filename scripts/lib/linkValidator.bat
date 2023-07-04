set linkValidator.arg1=%~1

set link_validator=0
call :linkChecker
if %link_validator% == 0 goto :EOF

set youtube_link=0
call :isYtLinkChecker

goto :EOF


:linkChecker
echo %linkValidator.arg1% | findstr /i /r /c:"^http://" /c:"^https://" > nul
if %errorlevel% == 0 (
    set link_validator=1
    goto :EOF
)
goto :EOF


:isYtLinkChecker
echo %linkValidator.arg1% | findstr /i /r /c:"^https://www.youtube.com" /c:"^https://m.youtube.com" /c:"^https://youtube.com" /c:"^https://youtu.be" /c:"^http://www.youtube.com" /c:"^http://m.youtube.com" /c:"^http://youtube.com" /c:"^http://youtu.be" > nul
if %errorlevel% == 0 (
    set youtube_link=1
    goto :EOF
)
goto :EOF
