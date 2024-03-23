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
open file **/opt/victronenergy/gui/qml/RB_StarterBattery.qml** and edit the line with the **id: starterBatteryVoltage** by modifying the path to the measurement of your starterbattery. You can use the command "dbus-spy" on the commandline and navigate through the devices to find your battery-monitor or smartshunt. You'll find a howto in the videos.

dbus-spy tool with list of devices:
(in this screenshot the batterymonitor is **com.victronenergy.battery.tty.USB3**)
![image](https://github.com/roadbuck/VenusOS-StarterBattery/assets/164482499/e88fd76e-4910-43a4-9483-a938c75e633b)

**/Dc/1/Voltage** is the measurement for the starterbattery
![image](https://github.com/roadbuck/VenusOS-StarterBattery/assets/164482499/85597c24-5cc6-4529-9f90-7b622fb99e1f)

In this example the starterbattery is on device **com.victronenergy.battery.ttyUSB3**
![image](https://github.com/roadbuck/VenusOS-StarterBattery/assets/164482499/e0f6e816-27eb-4fa5-a482-b8420921c46b)

VBusItem { id: starterBatteryVoltage; bind:("com.victronenergy.battery.ttyUSB3/Dc/1/Voltage")}

## STEP 5
add to file **/opt/victronenergy/gui/qml/OverviewHub.qml** or **/opt/victronenergy/gui/qml/OverviewHubEnhanced.qml** (depending, which GUI you use... see table) You can also modify both, if you want to switch between GUI types
```
RB_StarterBattery {} // RB Mods
```
after this lines (near line 20)

![image](https://github.com/roadbuck/VenusOS-StarterBattery/assets/164482499/ffd64506-2d11-49b4-a8b8-711fe9f2dab6)

## STEP 6
Modifications to file **/opt/victronenergy/gui/qml/PageSettingsDisplay.qml**
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

## STEP 7
Restart your GUI to see the changes

Cerbo:
```
svc -t /service/start-gui
```

Raspbery: 
```
svc -t /service/gui
```
 
