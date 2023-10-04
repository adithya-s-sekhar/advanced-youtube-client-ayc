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

:downloadError
if defined url echo "%url%">>"%aychome%\history\failed.txt"
call tui windowSize %small_width% 34
color 4F
title Download Failed!
cls
call tui bannerSmall
echo.
echo  Download Failed!!!! :-(
echo.
if %error_mode% == batch (
    echo  Job: %job_name%
) else (
    echo  URL: %url%
)
echo.
if %cookie_loaded% == 1 (
    echo  Using cookies.txt.
    echo.
)
echo  Possible problems and solutions:
echo.
if %error_format% == av1 echo  - If you chose AV1, not all websites support it yet.
if %cookie_loaded% == 1 echo  - Your cookies may have expired or are invalid.
echo  - yt-dlp might be out of date. Update it by going 
echo    into Settings, Update yt-dlp.
echo  - If you have an unreliable network, increase retry
echo    attempts in Settings.
echo  - You could be running into a path length limit.
echo    Always keep AYC near your root directory like C:\ayc.
echo    Or keep the temporary folder in root like D:\tmp in 
echo    settings.
if %error_mode% == batch (
    echo  - You may have entered an invalid job name.
    echo  - One of your links might be failing, rest might have
    echo    downloaded successfully.
) else (
    echo  - You may have entered an invalid/private link. These
    echo    aren't supported yet.
)
echo.
echo   If all else fails, report the failing URLs on the 
echo   Sourceforge or GitHub page. 
echo.
call tui borderSmallHalf
echo.
echo  Press enter to close this window.
pause>NUL
goto :EOF
