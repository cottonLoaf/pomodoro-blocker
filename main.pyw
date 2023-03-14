import subprocess
import os

# ===================================
# Data/Configuration
# ===================================

# ===================================
# MAIN
# ===================================

# init GUI

subprocess.run(["py", "ui.py"])
sys.exit()

#while True:
#    while True:
#        try:
#            # start auto-quit
#            autoQuit = subprocess.Popen(
#                   ["auto-quit.bat", "1"],
#                   creationflags=subprocess.CREATE_NO_WINDOW
#                   )
#            # work timer
#            workTimer = subprocess.run(
#                    ["timer.bat", "50", "WORK"], 
#                    # creationflags=subprocess.CREATE_NEW_CONSOLE,
#                    check=True                                     # sends exception to wrapper when there's exit code 1
#                    )
#            break
#        except:
#            subprocess.Popen(["TASKKILL", "/F", "/PID", str(autoQuit.pid), "/T"])
#            continue
#
#    # kill auto-quit
#    subprocess.Popen(["TASKKILL", "/F", "/PID", str(autoQuit.pid), "/T"])
#
#    # break timer
#    subprocess.run(
#        ["timer.bat", "15", "BREAK"], 
#        creationflags=subprocess.CREATE_NEW_CONSOLE
#        )

# ===================================
# Impure Functions
# ===================================

# ===================================
# Pure Functions
# ===================================
