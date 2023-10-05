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

if %createShortcut.arg1% == desktop call :desktop

if %createShortcut.arg1% == root call :root

if %createShortcut.arg1% == start_menu call :startMenu

goto :EOF

:desktop
echo Set oWS = WScript.CreateObject("WScript.Shell") > %tmp%\ayc.vbs
echo sLinkFile = "%userprofile%\Desktop\Advanced Youtube Client - AYC.lnk" >> %tmp%\ayc.vbs
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> %tmp%\ayc.vbs
echo oLink.TargetPath = "cmd.exe" >> %tmp%\ayc.vbs
echo oLink.Arguments = "/c %aycroot%\AYClient.bat" >> %tmp%\ayc.vbs
echo oLink.IconLocation = "%aycroot%\resources\extras\ayc.ico" >> %tmp%\ayc.vbs
echo oLink.WorkingDirectory = "%aycroot%" >> %tmp%\ayc.vbs
echo oLink.Save >> %tmp%\ayc.vbs

cscript %tmp%\ayc.vbs

del %tmp%\ayc.vbs

goto :EOF

:root
echo Set oWS = WScript.CreateObject("WScript.Shell") > %tmp%\ayc.vbs
echo sLinkFile = "%aycroot%\AYClient.lnk" >> %tmp%\ayc.vbs
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> %tmp%\ayc.vbs
echo oLink.TargetPath = "cmd.exe" >> %tmp%\ayc.vbs
echo oLink.Arguments = "/c %aycroot%\AYClient.bat" >> %tmp%\ayc.vbs
echo oLink.IconLocation = "%aycroot%\resources\extras\ayc.ico" >> %tmp%\ayc.vbs
echo oLink.WorkingDirectory = "%aycroot%" >> %tmp%\ayc.vbs
echo oLink.Save >> %tmp%\ayc.vbs

cscript %tmp%\ayc.vbs

del %tmp%\ayc.vbs

goto :EOF

:startMenu
md "%appdata%\Microsoft\Windows\Start Menu\Programs\Advanced Youtube Client - AYC"
echo Set oWS = WScript.CreateObject("WScript.Shell") > %tmp%\ayc.vbs
echo sLinkFile = "%appdata%\Microsoft\Windows\Start Menu\Programs\Advanced Youtube Client - AYC\Advanced Youtube Client - AYC.lnk" >> %tmp%\ayc.vbs
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> %tmp%\ayc.vbs
echo oLink.TargetPath = "cmd.exe" >> %tmp%\ayc.vbs
echo oLink.Arguments = "/c %aycroot%\AYClient.bat" >> %tmp%\ayc.vbs
echo oLink.IconLocation = "%aycroot%\resources\extras\ayc.ico" >> %tmp%\ayc.vbs
echo oLink.WorkingDirectory = "%aycroot%" >> %tmp%\ayc.vbs
echo oLink.Save >> %tmp%\ayc.vbs

cscript %tmp%\ayc.vbs

del %tmp%\ayc.vbs

goto :EOF
