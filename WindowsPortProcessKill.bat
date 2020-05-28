@ECHO OFF
ECHO Step 1) Enter Port Number to Display ; Step 2) Enter Process Number to Kill
ECHO.
SET /P port=Display Port Number:
ECHO %port%| findstr /r "^[1-9][0-9]*$">nul
IF %errorlevel% equ 0 (
	ECHO.
	ECHO "Executing the Following Command: NETSTAT -ano | FINDSTR :%port%"
	ECHO.
	NETSTAT -ano | FINDSTR :%port%
	ECHO.
	setlocal EnableDelayedExpansion
	SET /P process=Kill Port %port% Process Number:
	ECHO !process!| findstr /r "^[1-9][0-9]*$">nul
	IF %errorlevel% equ 0 (
		ECHO.
		ECHO "Executing the Following Command: TASKKILL /PID !process! /F"
		ECHO.
		PAUSE
		TASKKILL /PID !process! /F
		PAUSE
	)
)