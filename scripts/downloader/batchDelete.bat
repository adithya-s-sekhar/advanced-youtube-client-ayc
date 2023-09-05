:batchDelete
echo.
choice /c yn /n /m "Delete job %job_name%? (y/n)"
if %errorlevel% == 1 goto batchDeleteConfirm
if %errorlevel% == 2 goto :EOF

:batchDeleteConfirm
echo.
choice /c yn /n /m "Are you sure? (y/n)"
if %errorlevel% == 1 goto batchDoDelete
if %errorlevel% == 2 goto :EOF

:batchDoDelete
rd /s /q "%loc%\%job_name%"
set batch_deleted_job=1
set batch_deleted_job_name=%job_name%
goto :EOF