# Subprocesses

---

## timer.bat

<u>PURPOSES</u>
- Creates a countdown, plays an alarm on certain segments of the duration, and exits upon finishing.

<u>DEPENDS ON</u>
- Files
	- beep.py 

<u>DEPENDED BY</u>
- main.py 

---

## auto-quit.bat

<u>PURPOSE</u>
- Enumerates over a list of programs and closes them one-by-one.

<u>DEPENDS ON</u>
- rc\_files
	- PROCESS\_blocked-programs.txt

<u>DEPENDED BY</u>
- main.py

---

## beep.py

<u>PURPOSES</u>
- Calls pygame's mixer capabilities to play sound.

<u>DEPENDS ON</u>
- Modules
	- pygame
- Files
	- alarm.mp3 
