set linkValidator.arg1=%~1

set link_validator=0

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