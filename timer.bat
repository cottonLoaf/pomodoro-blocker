@echo off

:: ====================================
:: MODULES
:: ====================================

:: ====================================
:: MAIN
:: ====================================

CALL :genericTimer %1 %2  
EXIT /B 0

:: ====================================
:: IMPURE
:: ====================================

:: -------------------------------------------------
:genericTimer
:: genericTimer fromTime TITLE="TIMER"
:: Dependencies:
:: 	- countdown
::	- powershell (MinimizeAll())
::	- alarmSound
:: -------------------------------------------------
	SET "fromTime=%1"
	SET "timer_title=%2"
	SET /A "minusFiveTime=%fromTime% - 5"
	SET /A "minusOneTime=%fromTime% - 1"
	:genericTimerLoop
	:: orig. time minus 5 minutes 
	IF %fromTime% GTR 5 (
		CALL :countdown %minusFiveTime% "%timer_title% - %fromTime% minutes left" 
		CALL :alarmSound 1
		SET "fromTime=5"
		:: reset minusOneTime to reset fromTime to 5
		SET /A "minusOneTime=5 - 1"
		GOTO :genericTimerLoop
	) ELSE (
		:: 1 < n <= 5 minutes left
		IF %fromTime% NEQ 1 (
			
			CALL :countdown %minusOneTime% "%timer_title% - %fromTime% minutes left"
			CALL :alarmSound 3
			SET "fromTime=1"
			GOTO :genericTimerLoop
		) ELSE (
			:: 1 minute left
			CALL :countdown 1 "%timer_title% - 1 minute left"
			:: END
			powershell -Command "& {(New-Object -ComObject Shell.Application).MinimizeAll()}"
			CALL :alarmSound 5
		)
	)
	EXIT /B 0

:: -------------------------------------------------
:alarmSound :: send alarm to existing user profile
:: alarmSound count 
:: Dependencies:
::	- beep.py
::		- pygame	
:: -------------------------------------------------
	SET "count=%1"
	:playLoop
		if %count% EQU 0 (
			EXIT /B 0
		) else (
			py "%~dp0beep.py"
			SET /A "count=%count%-1"
		)
		GOTO :playLoop

:: ====================================
:: PURE 
:: ====================================

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

