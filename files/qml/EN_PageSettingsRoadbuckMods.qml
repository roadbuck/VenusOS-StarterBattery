import QtQuick 1.1
import "utils.js" as Utils
import com.victron.velib 1.0

MbPage {
	id: root
	title: qsTr("Roadbuck Mods")
    property string bindPrefixRbMods: "com.victronenergy.settings/Settings/RoadbuckMods"
  	VBusItem { id: showStarter; bind: Utils.path(bindPrefixRbMods, "/StarterBattery/ShowStarterBattery")}

	model: VisibleItemModel
    {

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
