:: Advanced Youtube Client - AYC
:: Copyright (C) 2024  Adithya S Sekhar
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

set cookieLoader.arg1=%~1

if /i %cookieLoader.arg1% == load goto loadCookie
if /i %cookieLoader.arg1% == unload goto unloadCookie

goto :EOF

:loadCookie
set cookies=--cookies cookies.txt
set cookie_loaded=1
goto :EOF

:unloadCookie
set "cookies="
set cookies= 
set cookie_loaded=0
goto :EOF
