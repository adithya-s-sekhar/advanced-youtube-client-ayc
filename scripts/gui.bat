set gui.arg1=%~1

call :%gui.arg1%

goto :EOF

:bannerLarge
call :borderLarge
echo                                                                              Advanced Youtube Client - AYC 
echo.
echo                                                                                   %version%
call :borderLarge
goto :EOF

:bannerMedium
call :borderMedium
echo                                Advanced Youtube Client - AYC 
echo.
echo                                     %version%
call :borderMedium
goto :EOF

:bannerSmall
call :borderSmall
echo                 Advanced Youtube Client - AYC 
echo.
echo                      %version%
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