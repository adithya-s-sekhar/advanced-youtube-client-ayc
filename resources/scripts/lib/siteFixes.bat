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

set siteFixes.arg1=%~1

:: Reddit thumbnails fixed in 2023.09.24
:: echo %siteFixes.arg1% | findstr /i /r /c:"^https://www.reddit.com" /c:"^https://reddit.com" /c:"^http://www.reddit.com" /c:"^http://reddit.com" /c:"^http://redd.it" /c:"^https://redd.it" /c:"^http://v.redd.it" /c:"^https://v.redd.it" > nul
:: if %errorlevel% == 0 call :reddit && goto :EOF

goto :EOF

:: :reddit
:: set "thumbs="
:: goto :EOF
