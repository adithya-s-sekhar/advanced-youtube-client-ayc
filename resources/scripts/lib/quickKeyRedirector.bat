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

set quickKey.arg1=%~1

set quickkey_validator=0

echo %quickKey.arg1% | findstr /i /r /c:"\<a\>" /c:"\<b\>" /c:"\<c\>" /c:"\<f\>" /c:"\<h\>" /c:"\<m\>" /c:"\<o\>" /c:"\<s\>" /c:"\<t\>" /c:"\<u\>" /c:"\<reset\>" > nul
if %errorlevel% == 0 (
    set quickkey_validator=1
) else (
    goto :EOF
)

if /i "%quickKey.arg1%" equ "a" call settingsToggles changeAria2 & goto :EOF
if /i "%quickKey.arg1%" equ "b" start AYClient.bat "b" dummy "%cookie_loaded%" & goto :EOF
if /i "%quickKey.arg1%" equ "c" call toggleCookie & goto :EOF
if /i "%quickKey.arg1%" equ "f" call settingsChangeDirHome & goto :EOF
if /i "%quickKey.arg1%" equ "h" start notepad.exe "%aycroot%\resources\history\download-history.txt" & goto :EOF
if /i "%quickKey.arg1%" equ "m" call moreMenu & goto :EOF
if /i "%quickKey.arg1%" equ "o" start explorer.exe "%loc%" & goto :EOF
if /i "%quickKey.arg1%" equ "s" call settingsMenu & goto :EOF
if /i "%quickKey.arg1%" equ "t" call settingsToggles changeTheme & goto :EOF
if /i "%quickKey.arg1%" equ "u" call settingsYtUpdate & goto :EOF
if /i "%quickKey.arg1%" equ "reset" call settingsReset & goto :EOF
goto :EOF
