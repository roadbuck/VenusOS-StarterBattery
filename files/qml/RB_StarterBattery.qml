import QtQuick 1.1
// Paste this code:
// RB_StarterBattery {}
// in the OverviewHubEnhanced.qml somewhere in the section "OverviewPage {...}" between the curly brackets

Rectangle {
  //id: StarterBattery
// MODIFY THIS LINE WITH YOUR PATH TO MEASUREMENT FROM STARTERBATTERY !!!
VBusItem { id: starterBatteryVoltage; bind:("com.victronenergy.battery.ttyUSB3/Dc/1/Voltage")} //check the path to your battery measurement with dbus-spy
property string basicColor: "purple"
property string lowColor: "orange"
property string criticalColor: "red"

// DON'T make changes after this line
VBusItem { id: showStarterBattery; bind:("com.victronenergy.settings/Settings/RoadbuckMods/StarterBattery/ShowStarterBattery")}
VBusItem { id: lowStarterBattery; bind:("com.victronenergy.settings/Settings/RoadbuckMods/StarterBattery/LowPower")}
VBusItem { id: criticalStarterBattery; bind:("com.victronenergy.settings/Settings/RoadbuckMods/StarterBattery/CriticalPower")}

//property double batteryVoltageIs: 12.7

  x: 180
  y: 142
  width: 50
  height: 25
  //color: criticalColor
  color: starterBatteryVoltage.value < criticalStarterBattery.value ?  criticalColor : starterBatteryVoltage.value < lowStarterBattery.value ?  lowColor : basicColor
  visible: showStarterBattery.value == 1

  TileText{
    y:2
    text: "Starter"
    font.pixelSize:10
    font.bold: true
  }

  TileText{
    y: 14
    text: starterBatteryVoltage.value.toFixed(2) + "V"
    font.pixelSize:8
    font.bold: false
    wrapMode: Text.WordWrap
  }

  Rectangle {
    id: nubsi_1
    x: 3
    y: -4
    width: 6
    height: 3
    //color: criticalColor
    color: starterBatteryVoltage.value < criticalStarterBattery.value ?  criticalColor : starterBatteryVoltage.value < lowStarterBattery.value ?  lowColor : basicColor
  }

  Rectangle {
    id: nubsi_2
    x: 41
    y: -4
    width: 6
    height: 3
    //color: criticalColor
    color: starterBatteryVoltage.value < criticalStarterBattery.value ?  criticalColor : starterBatteryVoltage.value < lowStarterBattery.value ?  lowColor : basicColor
  }

}
