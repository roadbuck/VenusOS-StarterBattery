import QtQuick 1.1
import "utils.js" as Utils
import com.victron.velib 1.0

MbPage {
	id: root
	title: qsTr("Roadbuck Mods")
    property string bindPrefixRbMods: "com.victronenergy.settings/Settings/RoadbuckMods"
  	VBusItem { id: showStarter; bind: Utils.path(bindPrefixRbMods, "/StarterBattery/ShowStarterBattery")}
		VBusItem { id: showTruma; bind: Utils.path(bindPrefixRbMods, "/StarterBattery/ShowTruma")}
		VBusItem { id: showMaxxFan; bind: Utils.path(bindPrefixRbMods, "/StarterBattery/ShowMaxxFan")}
		VBusItem { id: showTeltonika; bind: Utils.path(bindPrefixRbMods, "/StarterBattery/ShowTeltonika")}
		VBusItem { id: showShelly; bind: Utils.path(bindPrefixRbMods, "/StarterBattery/ShowShelly")}
		VBusItem { id: showWeather; bind: Utils.path(bindPrefixRbMods, "/StarterBattery/ShowWeather")}

	model: VisibleItemModel
    {

     MbSubMenu
			{
				description: qsTr("Starter Battery")
				subpage: Component { PageSettingsRoadbuckStarterBattery {} }
				show: showStarter.value >= 0
			}

			MbSubMenu
			{
				description: qsTr("Truma")
				subpage: Component { PageSettingsRoadbuckTruma {} }
				show: showTruma.value >= 0
			}

			MbSubMenu
			{
				description: qsTr("MaxxFan")
				subpage: Component { PageSettingsRoadbuckMaxxFan {} }
				show: showMaxxFan.value >= 0
			}

			MbSubMenu
			{
				description: qsTr("Teltonika")
				subpage: Component { PageSettingsRoadbuckTeltonika {} }
				show: showTeltonika.value >= 0
			}

			MbSubMenu
			{
				description: qsTr("Shelly")
				subpage: Component { PageSettingsRoadbuckShelly {} }
				show: showTeltonika.value >= 0
			}

			MbSubMenu
			{
				description: qsTr("Weather")
				subpage: Component { PageSettingsRoadbuckWeather {} }
				show: showWeather.value >= 0
			}

  } // VisibleItemModel

} //MbPage
