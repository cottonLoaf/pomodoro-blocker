from pygame import mixer
import os

mixer.init() 
sound=mixer.Sound("./alarm.mp3")
sound.play()
os.system('TIMEOUT /T 5')
