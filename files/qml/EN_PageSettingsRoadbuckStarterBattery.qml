import QtQuick 1.1
import "utils.js" as Utils
import com.victron.velib 1.0

MbPage {
	id: root
	title: qsTr("Configuration Starter Battery")
    property string bindPrefixRoadbuckMods: "com.victronenergy.settings/Settings/RoadbuckMods"

	model: VisualItemModel
    {
			MbSwitch {
					id: starterBatteryOnMainPage
					bind: Utils.path(bindPrefixRbMods, "/StarterBattery/ShowStarterBattery")
					name: qsTr ("Show Starter Battery on Mainpage")
					writeAccessLevel: User.AccessUser
						}
			MbSpinBox {
					description: qsTr ("Low Voltage")
		item
		{
			bind: Utils.path (bindPrefixRoadbuckMods, "/StarterBattery/LowPower")
			unit: "V"
			decimals: 1
			step: 0.1
			min: 10
			max: 28
		}
					writeAccessLevel: User.AccessUser
			}

			MbSpinBox {
					description: qsTr ("Critical Voltage")
		item
		{
			bind: Utils.path (bindPrefixRoadbuckMods, "/StarterBattery/CriticalPower")
			unit: "V"
			decimals: 1
			step: 0.1
			min: 10
			max: 28
		}
					writeAccessLevel: User.AccessUser
			}

		}
}
