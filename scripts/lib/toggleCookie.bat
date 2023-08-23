if %cookie_loaded% == 0 (
    if not exist cookies.txt set no_cookie_found=1 && goto :EOF
    call cookieLoader load
    goto :EOF
)

if %cookie_loaded% == 1 (
    call cookieLoader unload
    goto :EOF
)
