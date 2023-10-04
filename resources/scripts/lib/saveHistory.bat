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

set saveHistory.arg1=%~1

set saveHistory.stats=UNKNOWN

if %saveHistory.arg1% == success set saveHistory.stats=SUCCESS
if %saveHistory.arg1% == fail set saveHistory.stats=FAILED

echo Date: %date%>>%aychome%\history\download-history.txt
echo Time: %time%>>%aychome%\history\download-history.txt
echo Status: %saveHistory.stats%>>%aychome%\history\download-history.txt
echo URL: %url%>>%aychome%\history\download-history.txt
echo.>>%aychome%\history\download-history.txt

goto :EOF
