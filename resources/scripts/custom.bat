:: yt-dlp custom options.
::
:: You can add additional options for each type of downloads using yt-dlp here.
:: eg: --download-archive FILE --proxy URL --cookies PATH_TO_cookies.txt
:: Find more options here https://github.com/yt-dlp/yt-dlp#usage-and-options
::
:: Each variable corresponds to each type of download AYC supports.
::
:: If you're not using it, leave a single space after the equal sign to ensure it doesn't crash.
::

:: Individual downloaders

set custom_config_youtube= 
:: This will be used in all youtube downloads.

set custom_config_bilibili= 
:: This will be used in all bilibili downloads.

set custom_config_twitch= 
:: This will be used in all twitch downloads.

set custom_config_all= 
:: This will be used in all other downloads.

:: Batch downloaders

set custom_config_batch_yt= 
:: This will be used in all youtube downloads in batch mode.

set custom_config_batch_bilibili= 
:: This will be used in all bilibili downloads in batch mode.

set custom_config_batch_twitch= 
:: This will be used in all twitch downloads in batch mode.

set custom_config_batch_all= 
:: This will be used in all other downloads in batch mode.
