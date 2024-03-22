STEP 1
wget -qO - https://github.com/roadbuck/VenusOS-StarterBattery/archive/refs/tags/latest.tar.gz | tar -xzf - -C /data
STEP 2
mv /data/VenusOS-StarterBattery-latest /data/StarterBattery
STEP 3
python /data/StarterBattery/setup.py


Modifications on the following files are neccessary

If you use the default Overview (without GUI-Mods from Kevin Windrem):

changes in /opt/victronenergy/gui/qml/OverviewHub.qml:

add "RB_StarterBattery {}" after this lines (near line 20)

![image](https://github.com/roadbuck/VenusOS-StarterBattery/assets/164482499/ffd64506-2d11-49b4-a8b8-711fe9f2dab6)


  Copy the file RB_StarterBattery.qml into the directory: /opt/victronenergy/gui/qml/
