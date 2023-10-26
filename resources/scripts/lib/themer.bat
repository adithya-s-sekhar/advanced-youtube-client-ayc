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

set yt-dlp_color=no_color
if %theme_status% == 0 set theme_colors=07 && set yt-dlp_color=auto
if %theme_status% == 1 set theme_colors=F0
if %theme_status% == 2 set theme_colors=9F
if %theme_status% == 3 set theme_colors=DF
if %theme_status% == 4 set theme_colors=E0
if %theme_status% == 5 set theme_colors=CF
if %theme_status% == 6 set theme_colors=3F
color %theme_colors%
goto :EOF
