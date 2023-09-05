:batchChangeType
if %job_type% == 0 (
    set job_type=1
    goto batchChangeTypeSave
)
if %job_type% == 1 (
    set job_type=2
    goto batchChangeTypeSave
)
if %job_type% == 2 (
    set job_type=3
    goto batchChangeTypeSave
)
if %job_type% == 3 (
    set job_type=0
    goto batchChangeTypeSave
)

:batchChangeTypeSave
echo "%job_type%">"%loc%\%job_name%\job_type.txt"
goto :EOF