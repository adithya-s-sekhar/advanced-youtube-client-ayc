:settingsChangeDirHome
mode %window_small%
color 07
title Manage Folders
cls
call tui bannerSmall
echo.
echo  Current Download folder: 
echo  %loc%
echo.
echo  Current Temporary folder:
echo  %tmp_loc%
echo.
call tui borderSmall
echo.
echo  (0) - Go Back
echo.
echo  (1) - Change Download folder
echo.
echo  (2) - Change Temporary folder
echo.
call tui borderSmallHalf
echo.
choice /c 012 /n /m "Select Option (0-2): "
if %errorlevel% == 1 goto :EOF
if %errorlevel% == 2 call settingsChangeDir
if %errorlevel% == 3 call settingsChangeTmpDir
goto :settingsChangeDirHome
