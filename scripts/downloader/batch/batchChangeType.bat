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
