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

:batchOpenJobFile
call tui windowSize %small_width% 30
title Edit Job File
color %theme_colors%
cls
call tui bannerSmall
echo.
if /i %batch_exists_true% == 1 echo  Resuming Job: %job_name%
if /i %batch_exists_true% == 0 echo  New Job: %job_name%
echo.
if /i %job_type% == 0 echo  Job type: Regular
if /i %job_type% == 1 echo  Job type: Youtube only
if /i %job_type% == 2 echo  Job type: Bilibili only
if /i %job_type% == 3 echo  Job type: Twitch only
call tui borderSmallHalf
echo.
echo  Job File is opened in Notepad. Follow instructions.
echo.
echo  1) Add links one by one on each line.
echo.
echo  2) Delete links you don't want.
echo.
echo  3) Empty lines will be skipped.
echo.
echo  4) After Adding links, close Notepad and click Save.
notepad.exe "%loc%\%job_name%\%job_name%.txt"
goto :EOF
