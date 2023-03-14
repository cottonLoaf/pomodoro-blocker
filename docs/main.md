# Documentation

---

TABLE OF CONTENTS
=================

1. [Pomodoro Timer](#pomodoro-timer)
2. [Program Blocker](#program-blocker)
3. [Timer-locking](#timer-locking)
4. [Customizable Ringtone](#customizable-ringtone)

Timer
=====

## Display

- Title
	- Displays the pomdoro-blocker name. 
- [Countdown Timer](./01-gui/a1-countdown-timer_display.md)
- Buttons
	- [Start/Stop](./01-gui/a2-start-stop_display.md)
	- [Reset](./01-gui/a3-reset_display.md)
	- [Settings](./01-gui/a4-settings_display.md)

Ringtone
========

- Buttons
	- [Combo-box Select Ringtone](./01-gui/b1-combo_ringtone.md)
	- [File Browser Ringtone](./01-gui/b2-file-browser_ringtone.md)

---

# Pomodoro Timer

The pomodoro timer is composed of two (2) different timers: one for work and for break. The usual time is 5 minutes for break, and 25 minutes for work.

## Timer Start

To **start the timer**, the Start/Stop button from the GUI is pressed. This toggles 3 things: the <u>creation and updating of the current_timer_save file</u>, <u>2 self-check daemons</u>, and <u>self-updating of countdown timer label in GUI.</u> As a bonus, the button of start in the GUI becomes <u>Stop.</u> 

If the timer is **locked**, <u>the lock button is greyed out and cannot be clicked, together with both Start/Stop and Reset buttons.</u>

- [current_timer_save loop]()

## Improperly Closed

When **the main timer is improperly closed while

Three (3) GUI inputs influence  

---

# Program Blocker



---

# Timer-locking

---

# Customizable Ringtone 
