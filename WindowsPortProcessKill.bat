@ECHO OFF
SET /P port=Display Port Number:
ECHO %port%| findstr /r "^[1-9][0-9]*$">nul
IF %errorlevel% equ 0 (
	NETSTAT -ano | FINDSTR :%port%
	setlocal EnableDelayedExpansion
	SET /P process=Kill Port %port% Process Number:
	ECHO !process!| findstr /r "^[1-9][0-9]*$">nul
	IF %errorlevel% equ 0 (
		TASKKILL /PID !process! /F
	)
)
