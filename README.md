Go to the commandline of your Victron GX device (Cerbo GX or a Raspberry Pi)

Copy the code from step 1 to step 3, paste it on the commandline (right mouse button) and execute it

STEP 1
```
wget -qO - https://github.com/roadbuck/VenusOS-StarterBattery/archive/refs/tags/latest.tar.gz | tar -xzf - -C /data
```
STEP 2
```
mv /data/VenusOS-StarterBattery-latest /data/StarterBattery
```
STEP 3
```
python /data/StarterBattery/setup.py
```
Modifications on the following files are neccessary

| GUI | File to modify | Directory |
| --- | --- | --- |
| Default Victron | main.qml<br>OverviewHub.qml<br>PageSettingsDisplay.qml | /opt/victronenergy/gui/qml |
| GUI Mods enabled | main.qml<br>OverviewHubEnhanced.qml<br>PageSettingsDisplay.qml | /opt/victronenergy/gui/qml |

add 
```
RB_StarterBattery {}
```
after this lines (near line 20)

![image](https://github.com/roadbuck/VenusOS-StarterBattery/assets/164482499/ffd64506-2d11-49b4-a8b8-711fe9f2dab6)


 
