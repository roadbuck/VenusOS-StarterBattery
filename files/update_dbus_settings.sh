#!/bin/bash

#addAllDbusSettings () {
    local settings=""

    if [ -f "/data/RoadbuckMods/StarterBattery/files/DbusUpdate" ]; then
        echo "Updating D-Bus Settings"
        while IFS= read -r line || [[ -n "$line" ]]; do
            settings+="$line, "
        done < "/data/RoadbuckMods/StarterBattery/files/DbusUpdate"

        #dbus -y com.victronenergy.settings / AddSettings "%[ $settings  ]" &> /dev/null
        dbus -y com.victronenergy.settings / AddSettings "%[ $settings  ]"
    else
        echo "DbusSettingsList file not found"
    fi
#}

#addAllDbusSettings
