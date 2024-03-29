:: Advanced Youtube Client - AYC
:: Copyright (C) 2023  Adithya S Sekhar
::
:: This program is free software: you can redistribute it and/or modify
:: it under the terms of the GNU General Public License as published by
:: the Free Software Foundation, either version 3 of the License, or
:: (at your option) any later version.
::
:: This program is distributed in the hope that it will be useful,
:: but WITHOUT ANY WARRANTY; without even the implied warranty of
:: MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
:: GNU General Public License for more details.
::
:: You should have received a copy of the GNU General Public License
:: along with this program.  If not, see <https://www.gnu.org/licenses/>.

:batchDelete
echo.
choice /c yn /n /m "Delete job %job_name%? (y/n)"
if /i %errorlevel% == 1 goto batchDeleteConfirm
if /i %errorlevel% == 2 goto :EOF

:batchDeleteConfirm
echo.
choice /c yn /n /m "Are you sure? (y/n)"
if /i %errorlevel% == 1 goto batchDoDelete
if /i %errorlevel% == 2 goto :EOF

:batchDoDelete
rd /s /q "%loc%\%job_name%"
set batch_deleted_job=1
set batch_deleted_job_name=%job_name%
goto :EOF
