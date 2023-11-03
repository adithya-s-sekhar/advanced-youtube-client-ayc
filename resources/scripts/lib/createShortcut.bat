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

:create_vbs_filename
set vbs_name=ayc_%random%
if exist %tmp%\%vbs_name%.vbs goto create_vbs_filename

if %createShortcut.arg1% == desktop goto desktop

if %createShortcut.arg1% == root goto root

if %createShortcut.arg1% == start_menu goto startMenu

goto :EOF

:desktop
echo Set oWS = WScript.CreateObject("WScript.Shell") > %tmp%\%vbs_name%.vbs
echo sLinkFile = "%userprofile%\Desktop\Advanced Youtube Client - AYC.lnk" >> %tmp%\%vbs_name%.vbs
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> %tmp%\%vbs_name%.vbs
echo oLink.TargetPath = "cmd.exe" >> %tmp%\%vbs_name%.vbs
echo oLink.Arguments = "/c %aycroot%\AYClient.bat" >> %tmp%\%vbs_name%.vbs
echo oLink.IconLocation = "%aycroot%\resources\extras\ayc.ico" >> %tmp%\%vbs_name%.vbs
echo oLink.WorkingDirectory = "%aycroot%" >> %tmp%\%vbs_name%.vbs
echo oLink.Save >> %tmp%\%vbs_name%.vbs

cscript %tmp%\%vbs_name%.vbs

del %tmp%\%vbs_name%.vbs

goto :EOF

:root
echo Set oWS = WScript.CreateObject("WScript.Shell") > %tmp%\%vbs_name%.vbs
echo sLinkFile = "%aycroot%\AYClient.lnk" >> %tmp%\%vbs_name%.vbs
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> %tmp%\%vbs_name%.vbs
echo oLink.TargetPath = "cmd.exe" >> %tmp%\%vbs_name%.vbs
echo oLink.Arguments = "/c %aycroot%\AYClient.bat" >> %tmp%\%vbs_name%.vbs
echo oLink.IconLocation = "%aycroot%\resources\extras\ayc.ico" >> %tmp%\%vbs_name%.vbs
echo oLink.WorkingDirectory = "%aycroot%" >> %tmp%\%vbs_name%.vbs
echo oLink.Save >> %tmp%\%vbs_name%.vbs

cscript %tmp%\%vbs_name%.vbs

del %tmp%\%vbs_name%.vbs

goto :EOF

:startMenu
if not exist "%appdata%\Microsoft\Windows\Start Menu\Programs\Advanced Youtube Client - AYC" md "%appdata%\Microsoft\Windows\Start Menu\Programs\Advanced Youtube Client - AYC"
echo Set oWS = WScript.CreateObject("WScript.Shell") > %tmp%\%vbs_name%.vbs
echo sLinkFile = "%appdata%\Microsoft\Windows\Start Menu\Programs\Advanced Youtube Client - AYC\Advanced Youtube Client - AYC.lnk" >> %tmp%\%vbs_name%.vbs
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> %tmp%\%vbs_name%.vbs
echo oLink.TargetPath = "cmd.exe" >> %tmp%\%vbs_name%.vbs
echo oLink.Arguments = "/c %aycroot%\AYClient.bat" >> %tmp%\%vbs_name%.vbs
echo oLink.IconLocation = "%aycroot%\resources\extras\ayc.ico" >> %tmp%\%vbs_name%.vbs
echo oLink.WorkingDirectory = "%aycroot%" >> %tmp%\%vbs_name%.vbs
echo oLink.Save >> %tmp%\%vbs_name%.vbs

cscript %tmp%\%vbs_name%.vbs

del %tmp%\%vbs_name%.vbs

goto :EOF
