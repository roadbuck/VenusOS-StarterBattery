This will add the Starter battery info on the main page of the Cerbo GX / Raspberry and has a config section in the settings.

Tested with firmware
- 3.22 large
- 3.30 large

![image](https://github.com/roadbuck/VenusOS-StarterBattery/assets/164482499/1145eb5b-6487-476e-a5e8-aba6b58d941c)

Go to the commandline of your Victron GX device (Cerbo GX or a Raspberry Pi)

Copy the code from step 1 to step 3, paste it on the commandline (right mouse button) and execute it. After that you have to modify 3 files (step 4-6).

## STEP 1

download the installer files
```
wget -qO - https://github.com/roadbuck/VenusOS-StarterBattery/archive/refs/tags/latest.tar.gz | tar -xzf - -C /data
```
## STEP 2
rename the directory
```
mv /data/VenusOS-StarterBattery-latest /data/StarterBattery
```
## STEP 3
Choose the setup and the language you want to install. Please choose only one... ;-)

english version!
```
python /data/StarterBattery/setup-en.py
```
german version!
```
python /data/StarterBattery/setup-de.py
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

Raspberry: 
```
svc -t /service/gui
```

in the menu of the GX Device "Settings->Display & Language" you have now a new Menu for all my modules:

![image](https://github.com/roadbuck/VenusOS-StarterBattery/assets/164482499/0dedceea-34db-4b47-8d50-88bf184e0683)

here the StarterBattery

![image](https://github.com/roadbuck/VenusOS-StarterBattery/assets/164482499/85dfc947-8469-4917-aeb5-0f7a847ad503)

You can turn on and off the visibility on the mainpage and modify the threshold values

![image](https://github.com/roadbuck/VenusOS-StarterBattery/assets/164482499/f07a5ca5-0833-4af6-8215-a4882a4df7b7)

## Additional Info
If you use the GUI mods with activated temperature or tanksensor, there is not much space between the starter battery and the line from the inverter to the battery.

![image](https://github.com/roadbuck/VenusOS-StarterBattery/assets/164482499/c2173458-e899-4182-b449-2706834a0bb3)

To change that, you need just 3 little changes in the /opt/victronenergy/gui/qml/OverviewHubEnhanced.qml:

![image](https://github.com/roadbuck/VenusOS-StarterBattery/assets/164482499/8f7c3a46-8c1d-4ac8-b16b-2f1cee4ddbde)

![image](https://github.com/roadbuck/VenusOS-StarterBattery/assets/164482499/158d96d4-86bf-4157-8431-3c61a3215665)

Now it should look like this:

![image](https://github.com/roadbuck/VenusOS-StarterBattery/assets/164482499/377bb176-22ef-4770-b6e5-dfc60303d352)

