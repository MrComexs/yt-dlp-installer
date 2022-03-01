@echo off
::From mpv-install.bat I thought I would need it
::setlocal enableextensions enabledelayedexpansion
::path %SystemRoot%\System32;%SystemRoot%;%SystemRoot%\System32\Wbem;%SystemRoot%\System32\WindowsPowerShell\v1.0\
::call :ensure_admin

cls
:ask
echo Welcome to yt-dlp-N-installer
echo Would you like to Install or Uninstall?:
echo.
set /P iu=Type input: %=%
If /I "%iu%"=="i" goto install
If /I "%iu%"=="u" goto uninstall
If /I "%iu%"=="install" goto install
If /I "%iu%"=="uninstall" goto uninstall
	
:install
	cd %UserProfile%\Videos\
	mkdir %UserProfile%\Videos\yt-dlp
	cd %UserProfile%\Videos\yt-dlp\
	mkdir %UserProfile%\Videos\yt-dlp\yt-dlp-program-files
	cd /D %~dp0\
	move yt-dlp.exe %UserProfile%\Videos\yt-dlp\yt-dlp-program-files
	move yt-dlp.bat %UserProfile%\Videos\yt-dlp\yt-dlp-program-files
	move yt-dlp.conf %UserProfile%\Videos\yt-dlp\yt-dlp-program-files
	move ffmpeg.exe  %UserProfile%\Videos\yt-dlp\yt-dlp-program-files
	move ffprobe.exe  %UserProfile%\Videos\yt-dlp\yt-dlp-program-files
	cd /D %~dp0
	move yt-dlp.lnk "%UserProfile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs"
	cls
	Echo yt-dlp.exe was intsalled in "%UserProfile%\Videos\yt-dlp\yt-dlp-program-files\"
	Echo yt-dlp.bat was intsalled in "%UserProfile%\Videos\yt-dlp\yt-dlp-program-files\"
	echo ffmpeg.exe was installed in ffmpeg.exe  "%UserProfile%\Videos\yt-dlp\yt-dlp-program-files\"
	echo ffprobe.exe was installed in ffprobe.exe  "%UserProfile%\Videos\yt-dlp\yt-dlp-program-files\"
	Echo yt-dlp.lnk was intsalled in "%UserProfile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs"
	Echo.
	echo Run yt-dlp(.lnk) to download video.
	echo.
	:ask
	echo Would you like to see the supported site to download from?:
	set /P INPUT=yes or no: %=%
	If "%INPUT%"=="y" goto yes 
	If "%INPUT%"=="n" goto no
	If "%INPUT%"=="Y" goto yes
	If "%INPUT%"=="N" goto no
	echo.
	pause
	exit

:uninstall
	del %UserProfile%\Videos\yt-dlp\yt-dlp-program-files\yt-dlp.bat
	del %UserProfile%\Videos\yt-dlp\yt-dlp-program-files\yt-dlp.exe
	del %UserProfile%\Videos\yt-dlp\yt-dlp-program-files\yt-dlp.conf
	del %UserProfile%\Videos\yt-dlp\yt-dlp-program-files\ffmpeg.exe
	del %UserProfile%\Videos\yt-dlp\yt-dlp-program-files\ffprobe.exe
	rmdir %UserProfile%\Videos\yt-dlp\yt-dlp-program-files\
	del "%UserProfile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\yt-dlp.lnk"
	Echo yt-dlp.exe was unintsalled from "%UserProfile%%UserProfile%\Videos\yt-dlp\"
	Echo yt-dlp.bat was unintsalled from "%UserProfile%%UserProfile%\Videos\yt-dlp\"
	Echo yt-dlp.conf was unintsalled from "%UserProfile%%UserProfile%\Videos\yt-dlp\"
	Echo ffmpeg.exe was unintsalled from "%UserProfile%%UserProfile%\Videos\yt-dlp\"
	Echo ffprobe.exe was unintsalled from "%UserProfile%%UserProfile%\Videos\yt-dlp\"
	Echo yt-dlp.lnk was unintsalled from "%UserProfile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\yt-dlp.lnk"
	echo.
	pause
	exit

::ensure_admin
	:: From mpv-install.bat
	:: https://stackoverflow.com/questions/4051883/batch-script-how-to-check-for-admin-rights
	openfiles >nul 2>&1
	if errorlevel 1 (
		echo This batch script requires administrator privileges.
		echo Right-click on yt-dlp-N-installer.bat and select "Run as administrator".
		echo.
		call :die
	)
	goto :EOF

    :die
	if not [%1] == [] echo %~1
	if [%unattended%] == [yes] exit
	exit

:yes
	start https://docs.yt-dlp.org/en/2022.02.04/supportedsites.html

:no
	exit