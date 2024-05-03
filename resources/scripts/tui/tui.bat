:: Advanced Youtube Client - AYC
:: Copyright (C) 2024  Adithya S Sekhar
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

set tui.arg1=%~1
set tui.arg2=%~2
set tui.arg3=%~3

call :%tui.arg1%

goto :EOF

:bannerLarge
echo.
echo --------------------------------------------------------------------- %name% - %display_version% ----------------------------------------------------------------------
goto :EOF

:bannerMedium
echo.
echo -------------------------- %name% - %display_version% ---------------------------
goto :EOF

:bannerSmall
echo.
echo ----------------------- %short_name% - %display_version% ------------------------
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
