set tui.arg1=%~1
set tui.arg2=%~2
set tui.arg3=%~3

call :%tui.arg1%

goto :EOF

:bannerLarge
echo.
echo --------------------------------------------------------------- %name% - %display_version% ----------------------------------------------------------------
goto :EOF

:bannerMedium
echo.
echo ------------------- %name% - %display_version% --------------------
goto :EOF

:bannerSmall
echo.
echo ---------------- %short_name% - %display_version% -----------------
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
