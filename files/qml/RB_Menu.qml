import QtQuick 1.1

// // RB Mods: add Menu
		  MbSubMenu {
		   id: roadbuckModsMenu
		   description: qsTr("Roadbuck Mods")
		   subpage: Component {
		      PageSettingsRoadbuckMods { }
		   }
		 }
