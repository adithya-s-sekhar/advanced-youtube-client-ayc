set tui.arg1=%~1
set tui.arg2=%~2
set tui.arg3=%~3

call :%tui.arg1%

goto :EOF

:bannerLarge
call :borderLarge
echo                                                                              %name% 
echo.
echo                                                                                   %display_version%
call :borderLarge
goto :EOF

:bannerMedium
call :borderMedium
echo                                %name% 
echo.
echo                                     %display_version%
call :borderMedium
goto :EOF

:bannerSmall
call :borderSmall
echo                 %name% 
echo.
echo                      %display_version%
call :borderSmall
goto :EOF

:borderLarge
echo ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
goto :EOF

:borderMedium
echo --------------------------------------------------------------------------------------------
goto :EOF

:borderSmall
echo ------------------------------------------------------------
goto :EOF

:borderLargeHalf
echo ------------------------------------------------------------------------------------------
goto :EOF

:borderMediumHalf
echo ----------------------------------------------
goto :EOF

:borderSmallHalf
echo ------------------------------
goto :EOF

:windowSize
mode con:cols=%tui.arg2% lines=%tui.arg3%
goto :EOF
