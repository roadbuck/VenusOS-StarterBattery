> [!TIP]
> **SCHAUT DAS VIDEO DAZU AN! Detailierte Videoanleitung: https://youtu.be/VEaY2Ch0KpQ**
>
> ![image](https://github.com/roadbuck/VenusOS-StarterBattery/assets/164482499/21149a8e-54a6-4139-ac94-6206cc91ab6c)


Dies fügt die Informationen über die Starterbatterie auf der Hauptseite des Cerbo GX / Raspberry hinzu und hat einen Konfigurationsabschnitt in den Einstellungen.

Getestet mit Firmware
- 3.22 large
- 3.30 large

![image](https://github.com/roadbuck/VenusOS-StarterBattery/assets/164482499/1145eb5b-6487-476e-a5e8-aba6b58d941c)

Gehe zur Kommandozeile im Terminal deines GX-Gerätes (Cerbo GX or a Raspberry Pi)

Kopiere den Code von Schritt 1 bis Schritt 3, füge ihn in die Befehlszeile ein (rechte Maustaste) und führe ihn aus. Danach müssen noch 3 Dateien geändert werden (Schritt 4-6).

## STEP 1

Installer herunterladen
```
wget -qO - https://github.com/roadbuck/VenusOS-StarterBattery/archive/refs/tags/latest.tar.gz | tar -xzf - -C /data
```
## STEP 2
Verzeichnis umbenennen
```
mv /data/VenusOS-StarterBattery-latest /data/StarterBattery
```
## STEP 3
Jetzt das Setup für die gewünschte Sprache wählen. Bitte nur eine wählen... ;-)

Englische Version!
```
python /data/StarterBattery/setup-en.py
```
Deutsche Version!
```
python /data/StarterBattery/setup-de.py
```
Änderungen an den folgenden Dateien sind erforderlich (beginnend mit STEP 4)

Hier ist eine Übersicht über die Dateien, die geringfügige Änderungen erfordern
| GUI | zu bearbeitende Datei | Verzeichnis |
| --- | --- | --- |
| Victron standard | OverviewHub.qml<br>PageSettingsDisplay.qml | /opt/victronenergy/gui/qml |
| mit GUI Mods | OverviewHubEnhanced.qml<br>PageSettingsDisplay.qml | /opt/victronenergy/gui/qml |

## STEP 4
Öffne die Datei **/opt/victronenergy/gui/qml/RB_StarterBattery.qml** und bearbeite die Zeile mit der **id: starterBatteryVoltage**, indem Du dort den Pfad zur Messung der Starterbatterie änderst. Du kannst den Befehl "dbus-spy" auf der Kommandozeile verwenden und durch die Geräte navigieren, um den Batteriemonitor oder Smartshunt zu finden. Eine Anleitung gibt es in den Videos.

dbus-spy Tool mit einer Liste der Geräte:
(in diesem Bildschirmfoto ist der Batteriemonitor **com.victronenergy.battery.tty.USB3**)
![image](https://github.com/roadbuck/VenusOS-StarterBattery/assets/164482499/e88fd76e-4910-43a4-9483-a938c75e633b)

**/Dc/1/Voltage** ist die Messung für die Starterbatterie
![image](https://github.com/roadbuck/VenusOS-StarterBattery/assets/164482499/85597c24-5cc6-4529-9f90-7b622fb99e1f)

In diesem Beispiel befindet sich die Starterbatterie auf dem Gerät **com.victronenergy.battery.ttyUSB3**.
![image](https://github.com/roadbuck/VenusOS-StarterBattery/assets/164482499/e0f6e816-27eb-4fa5-a482-b8420921c46b)

VBusItem { id: starterBatteryVoltage; bind:("com.victronenergy.battery.ttyUSB3/Dc/1/Voltage")}

## STEP 5
zur Datei **/opt/victronenergy/gui/qml/OverviewHub.qml** oder **/opt/victronenergy/gui/qml/OverviewHubEnhanced.qml** hinzufügen (je nachdem, welche GUI verwendet wird... siehe Tabelle) Man kann auch beide modifizieren, wenn man zwischen den GUI-Typen wechseln möchte
```
RB_StarterBattery {} // RB Mods
```
nach diesen Zeilen (in der Nähe von Zeile 20)

![image](https://github.com/roadbuck/VenusOS-StarterBattery/assets/164482499/ffd64506-2d11-49b4-a8b8-711fe9f2dab6)

## STEP 6
Änderungen an der Datei **/opt/victronenergy/gui/qml/PageSettingsDisplay.qml**
```qml
RB_Menu { } // RB Mods
 ```
![image](https://github.com/roadbuck/VenusOS-StarterBattery/assets/164482499/4b05696f-8fa8-45b7-8e62-f898dc7baaf2)

Und das war's schon

## STEP 7
Die GUI neu starten, um die Änderungen zu sehen

auf dem Cerbo GX:
```
svc -t /service/start-gui
```

auf dem Raspberry: 
```
svc -t /service/gui
```

im Menü des GX-Gerätes "Einstellungen -> Anzeige & Sprache" gibt es nun ein neues Menü für alle meine Module:

![image](https://github.com/roadbuck/VenusOS-StarterBattery/assets/164482499/101ecaa1-a5db-4465-a619-52e6d13852d7)

hier für die Starterbatterie

![image](https://github.com/roadbuck/VenusOS-StarterBattery/assets/164482499/73861f73-09af-4e4e-8c14-f957171fe2f2)

Man kann die Anzeige auf der Hauptseite ein- und ausschalten... 

![image](https://github.com/roadbuck/VenusOS-StarterBattery/assets/164482499/baba880d-6b71-4c0c-8eac-38d0a7a9c037)

... und die Schwellenwerte ändern

![image](https://github.com/roadbuck/VenusOS-StarterBattery/assets/164482499/c5bf2c8f-3e90-4a17-bc9d-d68f3e709d26)


## Zusätzliche Informationen
Wenn man die GUI-Mods mit aktiviertem Temperatur- oder Tanksensor verwendet, ist nicht viel Platz zwischen der Starterbatterie und der "Leitung" vom Wechselrichter zur Batterie.

![image](https://github.com/roadbuck/VenusOS-StarterBattery/assets/164482499/c2173458-e899-4182-b449-2706834a0bb3)

Um das zu ändern, müssen nur 3 kleine Änderungen in der Datei **/opt/victronenergy/gui/qml/OverviewHubEnhanced.qml** gemacht werden:

Suche nach dem Bereich mit "**id: dcBus2**"

Die Zeile mit "**top: dcConnect.top**" durch zwei Slashes ( // ) am Anfang auskommentieren
und die folgende Zeile danach einfügen
```
top: dcConnect.top; topMargin: 3 // RB Mods
```
Die Zeile mit "**bottom: dcConnect.top**" durch zwei Slashes ( // ) am Anfang auskommentieren
und die folgende Zeile danach einfügen
```
bottom: dcConnect.top; bottomMargin: -3 // RB Mods
```
![image](https://github.com/roadbuck/VenusOS-StarterBattery/assets/164482499/8f7c3a46-8c1d-4ac8-b16b-2f1cee4ddbde)

Suche nach dem Bereich mit  "**id: multiToDcConnect**"

Die Zeile mit "**top: dcConnect.top**" durch zwei Slashes ( // ) am Anfang auskommentieren
und die folgende Zeile danach einfügen
```
top: dcConnect.top; topMargin: 3 // RB Mods
```
![image](https://github.com/roadbuck/VenusOS-StarterBattery/assets/164482499/158d96d4-86bf-4157-8431-3c61a3215665)

Nun sollte es so aussehen:

![image](https://github.com/roadbuck/VenusOS-StarterBattery/assets/164482499/377bb176-22ef-4770-b6e5-dfc60303d352)
