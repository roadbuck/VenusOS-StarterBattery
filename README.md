Go to the commandline of your Victron GX device (Cerbo GX or a Raspberry Pi)

Copy the code from step 1 to step 3, paste it on the commandline (right mouse button) and execute it

## STEP 1
```
wget -qO - https://github.com/roadbuck/VenusOS-StarterBattery/archive/refs/tags/latest.tar.gz | tar -xzf - -C /data
```
## STEP 2
```
mv /data/VenusOS-StarterBattery-latest /data/StarterBattery
```
## STEP 3
```
python /data/StarterBattery/setup.py
```
Modifications on the following files are neccessary (starting with STEP 4)

Here is an overview of the files that need minor modifications
| GUI | File to modify | Directory |
| --- | --- | --- |
| Default Victron | OverviewHub.qml<br>PageSettingsDisplay.qml | /opt/victronenergy/gui/qml |
| GUI Mods enabled | OverviewHubEnhanced.qml<br>PageSettingsDisplay.qml | /opt/victronenergy/gui/qml |

## STEP 4
add to file OverviewHub.qml or OverviewHubEnhanced.qml (depending, which GUI you use... see table) You can also modify both, if you want to switch between GUI types
```
RB_StarterBattery {}
```
after this lines (near line 20)

![image](https://github.com/roadbuck/VenusOS-StarterBattery/assets/164482499/ffd64506-2d11-49b4-a8b8-711fe9f2dab6)

## STEP 5
Modifications to file /opt/victronenergy/gui/qml/PageSettingsDisplay.qml
```qml
// // RB Mods: add Menu
  MbSubMenu {
   id: roadbuckModsMenu
   description: qsTr("Roadbuck Mods")
   subpage: Component {
      PageSettingsRoadbuckMods { }
   }
 }
```
![image](https://github.com/roadbuck/VenusOS-StarterBattery/assets/164482499/a21b2fa3-67cb-4cf2-b6fd-65c0127d425a)


And that's it. 

 
