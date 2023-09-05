set siteFixes.arg1=%~1

echo %siteFixes.arg1% | findstr /i /r /c:"^https://www.reddit.com" /c:"^https://reddit.com" /c:"^http://www.reddit.com" /c:"^http://reddit.com" /c:"^http://redd.it" /c:"^https://redd.it" /c:"^http://v.redd.it" /c:"^https://v.redd.it" > nul
if %errorlevel% == 0 call :reddit && goto :EOF

goto :EOF

:reddit
set "thumbs="
goto :EOF
