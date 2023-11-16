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

set cleaner.arg1=%~1

if "%cleaner.arg1%" == "input" call :cleanerInput & goto :EOF

if "%cleaner.arg1%" == "dq" call :cleanDoubleQuote & goto :EOF
if "%cleaner.arg1%" == "ws" call :cleanWhitespace & goto :EOF
if "%cleaner.arg1%" == "lws" call :cleanLeadingWhitespace & goto :EOF
if "%cleaner.arg1%" == "tws" call :cleanTrailingWhitespace & goto :EOF

goto :EOF

:cleanerInput
set cleaner_input=null
goto :EOF

:cleanDoubleQuote
set cleaner_input=%cleaner_input:"=%
goto :EOF

:cleanWhitespace
set cleaner_input=%cleaner_input: =%
goto :EOF

:cleanLeadingWhitespace
:cleanLeadingWhitespaceCheck
if "%cleaner_input:~0,1%"==" " goto cleanLeadingWhitespaceClean
goto :EOF
:cleanLeadingWhitespaceClean
set "cleaner_input=%cleaner_input:~1%"
goto cleanLeadingWhitespaceCheck

:cleanTrailingWhitespace
:cleanTrailingWhitespaceCheck
if "%cleaner_input:~-1%"==" " goto cleanTrailingWhitespaceClean
goto :EOF
:cleanTrailingWhitespaceClean
set "cleaner_input=%cleaner_input:~0,-1%"
goto cleanTrailingWhitespaceCheck
