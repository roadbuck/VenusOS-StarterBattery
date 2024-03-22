Modifications on the following files are neccessary

If you use the default Overview (without GUI-Mods from Kevin Windrem):
-----------------------------------------------
  /opt/victronenergy/gui/qml/OverviewHub.qml
-----------------------------------------------
add "RB_StarterBattery {}" after this lines (near line 20)

and it should look like this:
  OverviewPage {
  id:root
  RB_StarterBattery {}

  Copy the file RB_StarterBattery.qml into the directory: /opt/victronenergy/gui/qml/
