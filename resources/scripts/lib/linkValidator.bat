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

set linkValidator.arg1=%~1

set link_validator=1
set youtube_link=0
set bilibili_link=0
set twitch_link=0
set generic_link=0

echo %linkValidator.arg1% | findstr /i /r /c:"^https://www.youtube.com" /c:"^https://m.youtube.com" /c:"^https://youtube.com" /c:"^https://youtu.be" /c:"^http://www.youtube.com" /c:"^http://m.youtube.com" /c:"^http://youtube.com" /c:"^http://youtu.be" /c:"^www.youtube.com" /c:"^m.youtube.com" /c:"^youtube.com" /c:"^youtu.be" > nul
if /i %errorlevel% == 0 set youtube_link=1 & goto :EOF

echo %linkValidator.arg1% | findstr /i /r /c:"^https://www.bilibili.com" /c:"^https://m.bilibili.com" /c:"^https://bilibili.com" /c:"^http://www.bilibili.com" /c:"^http://m.bilibili.com" /c:"^http://bilibili.com" /c:"^https://www.bilibili.tv" /c:"^https://bilibili.tv" /c:"^http://www.bilibili.tv" /c:"^http://bilibili.tv" /c:"^www.bilibili.com" /c:"^bilibili.com" /c:"^www.bilibili.tv" /c:"^bilibili.tv" > nul
if /i %errorlevel% == 0 set bilibili_link=1 & goto :EOF

echo %linkValidator.arg1% | findstr /i /r /c:"^https://www.twitch.tv" /c:"^https://twitch.tv" /c:"^http://www.twitch.tv" /c:"^http://twitch.tv" /c:"^www.twitch.tv" /c:"^twitch.tv" > nul
if /i %errorlevel% == 0 set twitch_link=1 & goto :EOF

echo %linkValidator.arg1% | findstr /i /r /c:"^http://" /c:"^https://" /c:"^www." > nul
if /i %errorlevel% == 0 (
    set generic_link=1
    goto :EOF
) else (
    set link_validator=0
    goto :EOF
)
