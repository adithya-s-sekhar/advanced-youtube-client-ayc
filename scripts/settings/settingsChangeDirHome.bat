:settingsChangeDirHome
call tui windowSize %small_width% 23
color 0F
title Manage folders
cls
call tui bannerSmall
echo.
echo  Current download folder: 
echo  %loc%
echo.
echo  Current temporary folder:
echo  %tmp_loc%
echo.
call tui borderSmall
echo.
echo  (0) - Go Back
echo.
echo  (1) - Change download folder
echo.
echo  (2) - Change temporary folder
echo.
call tui borderSmallHalf
echo.
choice /c 012 /n /m "Select Option (0-2): "
if %errorlevel% == 1 goto :EOF
if %errorlevel% == 2 call settingsChangeDir
if %errorlevel% == 3 call settingsChangeTmpDir
goto :settingsChangeDirHome
