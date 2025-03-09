import ctypes
import time

from pymouse import PyMouse

ctypes.windll.shcore.SetProcessDpiAwareness(2)
m = PyMouse()

while 1:
    time.sleep(0.5)
    x, y = m.position()
    print(f"{x}, {y}")
