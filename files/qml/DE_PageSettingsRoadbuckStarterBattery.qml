import QtQuick 1.1
import "utils.js" as Utils
import com.victron.velib 1.0

MbPage {
	id: root
	title: qsTr("Konfiguration Starterbatterie")
    property string bindPrefixRoadbuckMods: "com.victronenergy.settings/Settings/RoadbuckMods"

	model: VisualItemModel
    {
			MbSwitch {
								id: starterBatteryOnMainPage
								bind: Utils.path(bindPrefixRbMods, "/StarterBattery/ShowStarterBattery")
								name: qsTr ("Starterbatterie auf Hauptseite anzeigen")
								writeAccessLevel: User.AccessUser
						}

			MbSpinBox {
					description: qsTr ("Niedrige Spannung")
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
					description: qsTr ("Kritische Spannung")
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
