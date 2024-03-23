import QtQuick 1.1
import "utils.js" as Utils
import com.victron.velib 1.0

MbPage {
	id: root
	title: qsTr("Roadbuck Mods")
    property string bindPrefixRbMods: "com.victronenergy.settings/Settings/RoadbuckMods"
    property string bindPrefix: "com.victronenergy.settings/Settings/Gui"
    property VBusItem systemScaleItem: VBusItem { bind: "com.victronenergy.settings/Settings/System/Units/Temperature" }

		VBusItem { id: showTruma; bind: Utils.path(bindPrefixRbMods, "/Truma/ShowTrumaOverview")}
		VBusItem { id: showMaxxFan; bind: Utils.path(bindPrefixRbMods, "/MaxxFan/ShowMaxxFanOverview")}
		VBusItem { id: showShelly; bind: Utils.path(bindPrefixRbMods, "/Shelly/ShowShellyOverview")}
		VBusItem { id: showWeather; bind: Utils.path(bindPrefixRbMods, "/Weather/ShowWeatherOverview")}
		VBusItem { id: showStarter; bind: Utils.path(bindPrefixRbMods, "/StarterBattery/ShowStarterBattery")}



	//property bool showFlowParams: flowOverview.item.valid && flowOverview.item.value >= 1

	//property bool showComplexParams: flowOverview.item.valid && flowOverview.item.value >= 2
	//property bool showAcCoupledParams: flowOverview.item.valid && flowOverview.item.value == 3


	model: VisibleItemModel
    {

			MbSwitch {
					id: trumaOverview
					bind: Utils.path(bindPrefixRbMods, "/Truma/ShowTrumaOverview")
					name: qsTr ("Truma Control")
					writeAccessLevel: User.AccessUser
			}
/*			MbSubMenu
			{
					description: qsTr("Truma Config")
					subpage: Component { PageSettingsRoadbuckTruma {} }
					show: showTruma.value == 1
			}

			MbSwitch {
					id: maxxFanOverview
					bind: Utils.path(bindPrefixRbMods, "/MaxxFan/ShowMaxxFanOverview")
					name: qsTr ("MaxxFan Control")
					writeAccessLevel: User.AccessUser
			}
			MbSubMenu
			{
					description: qsTr("MaxxFan Config")
					subpage: Component { PageSettingsRoadbuckMaxxFan {} }
					show: showMaxxFan.value == 1
			}

			MbSwitch {
					id: shellyOverview
					bind: Utils.path(bindPrefixRbMods, "/Shelly/ShowShellyOverview")
					name: qsTr ("Shelly Control")
					writeAccessLevel: User.AccessUser
			}

			MbSwitch {
					id: weatherOverview
					bind: "com.victronenergy.settings/Settings/RoadbuckMods/Weather/ShowWeatherOverview"
					name: qsTr ("Show Weather Page")
					writeAccessLevel: User.AccessUser
			}

			MbSubMenu
			{
					description: qsTr("Weather Config Page")
					subpage: Component { PageSettingsRoadbuckWeather {} }
					show: showWeather.value == 1
			}
*/
			MbSwitch {
					id: starterBatteryOnMainPage
					bind: Utils.path(bindPrefixRbMods, "/StarterBattery/ShowStarterBattery")
					name: qsTr ("Show Starter Battery on Mainpage")
					writeAccessLevel: User.AccessUser
			}

			MbSubMenu
			{
					description: qsTr("Starter Battery Config")
					subpage: Component { PageSettingsRoadbuckStarterBattery {} }
					show: showStarter.value == 1
			}


  } // VisibleItemModel


} //MbPage
