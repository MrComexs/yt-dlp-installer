@echo off
cls
:start
:ask
echo Place URL or type "F" to open folder or "E" to exit:
set /P INPUT=Type input: %=%
echo.
If /I "%INPUT%"=="f" goto folder
If /I "%INPUT%"=="e" goto exit

%UserProfile%\Videos\yt-dlp\yt-dlp-program-files\yt-dlp.exe  %INPUT% -o %UserProfile%\Videos\yt-dlp\%%(title)s.%%(ext)s
echo.
goto start

:folder
    cd %UserProfile%\Videos\yt-dlp\yt-dlp-program-files\
    start %UserProfile%\Videos\yt-dlp\yt-dlp-program-files\.
    exit

:exit
    exit