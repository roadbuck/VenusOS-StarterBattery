import subprocess
import os

with open('/data/RoadbuckMods/StarterBattery/files/dbus.ini', 'r') as file:
    for line in file:
        command = line.strip()
        subprocess.run(command, shell=True)

