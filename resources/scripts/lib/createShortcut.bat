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

set createShortcut.arg1=%~1

set createShortcut_temp=%aycroot%\resources\extras

if /i %createShortcut.arg1% == all (
    call :desktop
    call :root
    call :startMenu
    goto :EOF
)
if /i %createShortcut.arg1% == desktop goto desktop
if /i %createShortcut.arg1% == root goto root
if /i %createShortcut.arg1% == start_menu goto startMenu
goto :EOF

:desktop
call :create_vbs_filename
echo Set oWS = WScript.CreateObject("WScript.Shell") > "%createShortcut_temp%\%vbs_name%.vbs"
echo sLinkFile = "%userprofile%\Desktop\Advanced Youtube Client - AYC.lnk" >> "%createShortcut_temp%\%vbs_name%.vbs"
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> "%createShortcut_temp%\%vbs_name%.vbs"
echo oLink.TargetPath = "cmd.exe" >> "%createShortcut_temp%\%vbs_name%.vbs"
echo oLink.Arguments = "/c ""%aycroot%\AYClient.bat""" >> "%createShortcut_temp%\%vbs_name%.vbs"
echo oLink.IconLocation = "%aycroot%\resources\extras\ayc.ico" >> "%createShortcut_temp%\%vbs_name%.vbs"
echo oLink.WorkingDirectory = "%aycroot%" >> "%createShortcut_temp%\%vbs_name%.vbs"
echo oLink.Save >> "%createShortcut_temp%\%vbs_name%.vbs"
cscript "%createShortcut_temp%\%vbs_name%.vbs" > nul
del "%createShortcut_temp%\%vbs_name%.vbs"
goto :EOF

:root
call :create_vbs_filename
echo Set oWS = WScript.CreateObject("WScript.Shell") > "%createShortcut_temp%\%vbs_name%.vbs"
echo sLinkFile = "%aycroot%\AYClient.lnk" >> "%createShortcut_temp%\%vbs_name%.vbs"
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> "%createShortcut_temp%\%vbs_name%.vbs"
echo oLink.TargetPath = "cmd.exe" >> "%createShortcut_temp%\%vbs_name%.vbs"
echo oLink.Arguments = "/c ""%aycroot%\AYClient.bat""" >> "%createShortcut_temp%\%vbs_name%.vbs"
echo oLink.IconLocation = "%aycroot%\resources\extras\ayc.ico" >> "%createShortcut_temp%\%vbs_name%.vbs"
echo oLink.WorkingDirectory = "%aycroot%" >> "%createShortcut_temp%\%vbs_name%.vbs"
echo oLink.Save >> "%createShortcut_temp%\%vbs_name%.vbs"
cscript "%createShortcut_temp%\%vbs_name%.vbs" > nul
del "%createShortcut_temp%\%vbs_name%.vbs"
goto :EOF

:startMenu
call :create_vbs_filename
if not exist "%appdata%\Microsoft\Windows\Start Menu\Programs\Advanced Youtube Client - AYC" md "%appdata%\Microsoft\Windows\Start Menu\Programs\Advanced Youtube Client - AYC"
echo Set oWS = WScript.CreateObject("WScript.Shell") > "%createShortcut_temp%\%vbs_name%.vbs"
echo sLinkFile = "%appdata%\Microsoft\Windows\Start Menu\Programs\Advanced Youtube Client - AYC\Advanced Youtube Client - AYC.lnk" >> "%createShortcut_temp%\%vbs_name%.vbs"
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> "%createShortcut_temp%\%vbs_name%.vbs"
echo oLink.TargetPath = "cmd.exe" >> "%createShortcut_temp%\%vbs_name%.vbs"
echo oLink.Arguments = "/c ""%aycroot%\AYClient.bat""" >> "%createShortcut_temp%\%vbs_name%.vbs"
echo oLink.IconLocation = "%aycroot%\resources\extras\ayc.ico" >> "%createShortcut_temp%\%vbs_name%.vbs"
echo oLink.WorkingDirectory = "%aycroot%" >> "%createShortcut_temp%\%vbs_name%.vbs"
echo oLink.Save >> "%createShortcut_temp%\%vbs_name%.vbs"
cscript "%createShortcut_temp%\%vbs_name%.vbs" > nul
del "%createShortcut_temp%\%vbs_name%.vbs"
goto :EOF

:create_vbs_filename
set vbs_name=ayc_%random%
if exist "%createShortcut_temp%\%vbs_name%.vbs" goto create_vbs_filename
goto :EOF
