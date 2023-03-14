:: auto-quit - process-killer per every 5 second interval
@echo off

:: =================================================
:Main
:: =================================================
	:timer
		IF "%1" EQU "" ( 
			SET /P "mins=Enter time delay before block (0 for none): "
		) ELSE (
			SET "mins=0"
			)
		CALL :countdown %mins% DELAY
	:blocker
		CALL :aCloseProg "%~dp0PROCESS_blocked-programs.txt"
		GOTO :blocker
	GOTO :Main

:: =================================================
:: FUNCTIONS
:: =================================================

:: -------------------------------------------------
:aCloseProg :: close all programs from a list of programs.
:: aCloseProg rc_file 
:: NOTES:
:: 	- rc_file must only contain the process name, and not the full path to the program.
:: -------------------------------------------------
	SET "rc_file=%1"
	setlocal DisableDelayedExpansion
	FOR /f "usebackq tokens=*" %%a in ("%rc_file:"=%") do (
			taskkill /IM "%%a" /T /F
		)
	setlocal EnableDelayedExpansion
	EXIT /B 0
:: -------------------------------------------------
:countdown :: counts from specified minutes down to zero
:: countdown fromTime title="TIMER"
:: -------------------------------------------------
	:: PARAMS
	SET "fromTime=%1"
	SET "title=%2" || SET "title=TIMER"
	:: CODE
	:: Prelim. seconds
	SET "seconds=0"
	:timerLoop
		cls
		:: if seconds is one-digit, add 0 at start
		if %seconds% LSS 10 (
			SET "oneDSec=0%seconds%"
		) else (
			SET "oneDSec=%seconds%"
		)
		echo %title% - %fromTime%:%oneDSec%
		TIMEOUT /t 1 >nul
		SET /a "seconds=%seconds% - 1"
		if %seconds% LSS 0 (
			if %fromTime% EQU 0 (
				EXIT /B 0
			) else (
				SET /a "fromTime=%fromTime% - 1"
				SET "seconds=59"
				goto :timerLoop
			)
		) else (
			goto :timerLoop
		)

