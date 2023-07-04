set linkValidator.arg1=%~1

set link_validator=0
call :linkChecker
if %link_validator% == 0 goto :EOF

set youtube_link=0
call :isYtLinkChecker

goto :EOF


:linkChecker
echo %linkValidator.arg1% | findstr /I /R "^http://" > nul
if %errorlevel% == 0 (
    set link_validator=1
    goto :EOF
)

echo %linkValidator.arg1% | findstr /I /R "^https://" > nul
if %errorlevel% == 0 (
    set link_validator=1
    goto :EOF
)
goto :EOF


:isYtLinkChecker
echo %linkValidator.arg1% | findstr /i /r /c:"^https://www.youtube.com" > nul
if %errorlevel% == 0 (
    set youtube_link=1
    goto :EOF
)
echo %linkValidator.arg1% | findstr /i /r /c:"^https://m.youtube.com" > nul
if %errorlevel% == 0 (
    set youtube_link=1
    goto :EOF
)
echo %linkValidator.arg1% | findstr /i /r /c:"^https://youtube.com" > nul
if %errorlevel% == 0 (
    set youtube_link=1
    goto :EOF
)
echo %linkValidator.arg1% | findstr /i /r /c:"^https://youtu.be" > nul
if %errorlevel% == 0 (
    set youtube_link=1
    goto :EOF
)
echo %linkValidator.arg1% | findstr /i /r /c:"^http://www.youtube.com" > nul
if %errorlevel% == 0 (
    set youtube_link=1
    goto :EOF
)
echo %linkValidator.arg1% | findstr /i /r /c:"^http://m.youtube.com" > nul
if %errorlevel% == 0 (
    set youtube_link=1
    goto :EOF
)
echo %linkValidator.arg1% | findstr /i /r /c:"^http://youtube.com" > nul
if %errorlevel% == 0 (
    set youtube_link=1
    goto :EOF
)
echo %linkValidator.arg1% | findstr /i /r /c:"^http://youtu.be" > nul
if %errorlevel% == 0 (
    set youtube_link=1
    goto :EOF
)
goto :EOF
