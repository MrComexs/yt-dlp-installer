@echo off
cls
:start
:ask
echo Place URL or type "F" to open folder or "E" to exit:
set /P INPUT=Type input: %=%
echo.
If /I "%INPUT%"=="f" goto folder
If /I "%INPUT%"=="e" goto exit
::you can change the output in the next line (11)
"%~dp0\yt-dlp.exe"  %INPUT% -o %UserProfile%\Videos\yt-dlp\%%(title)s.%%(ext)s
echo.
goto start

:folder
    cd %UserProfile%\Videos\yt-dlp\
    start %UserProfile%\Videos\yt-dlp\.
    exit

:exit
    exit
