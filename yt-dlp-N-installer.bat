@echo off
call :ensure_admin

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
	cd "C:\Program Files"
	mkdir "C:\Program FIles\yt-dlp"
	cd /D %~dp0\
	move yt-dlp.exe "C:\Program Files\yt-dlp"
	move yt-dlp.bat "C:\Program Files\yt-dlp"
	move yt-dlp.conf "C:\Program Files\yt-dlp"
	move ffmpeg.exe  "C:\Program Files\yt-dlp"
	cd /D %~dp0
	move yt-dlp.lnk "%UserProfile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs"
	cls
	Echo yt-dlp.exe was intsalled in "C:\Program FIles\yt-dlp"
	Echo yt-dlp.bat was intsalled in "C:\Program FIles\yt-dlp"
	echo ffmpeg.exe was installed in ffmpeg.exe  "C:\Program FIles\yt-dlp"
	Echo yt-dlp.lnk was intsalled in "C:\Program FIles\yt-dlp"
	Echo.
	echo Run yt-dlp(.lnk) to download video.
	echo.
	:ask
	echo Would you like to see the supported site to download from?:
	set /P INPUT=(Yes\No): %=%
	If /I "%INPUT%"=="y" goto yes 
	If /I "%INPUT%"=="n" goto no
	If /I "%INPUT%"=="yes" goto yes
	If /I "%INPUT%"=="no" goto no
	echo.
	pause
	exit

:uninstall
	del "C:\Program Files\yt-dlp\yt-dlp.bat"
	del "C:\Program Files\yt-dlp\yt-dlp.exe"
	del "C:\Program Files\yt-dlp\yt-dlp.conf"
	del "C:\Program Files\yt-dlp\ffmpeg.exe"
	rmdir "C:\Program Files\yt-dlp"
	del "%UserProfile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\yt-dlp.lnk"
	Echo yt-dlp.exe was unintsalled from "C:\Program Files\yt-dlp"
	Echo yt-dlp.bat was unintsalled from "C:\Program Files\yt-dlp"
	Echo yt-dlp.conf was unintsalled from "C:\Program Files\yt-dlp"
	Echo ffmpeg.exe was unintsalled from "C:\Program Files\yt-dlp"
	echo.
	pause
	exit

	:: From mpv-install.bat
:ensure_admin
	:: https://stackoverflow.com/questions/4051883/batch-script-how-to-check-for-admin-rights
	openfiles >nul 2>&1
	if errorlevel 1 (
		echo This batch script requires administrator privileges.
		echo Right-click on yt-dlp-N-installer.bat and select "Run as administrator".
		echo Thank you mpv team for this part of the script
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
