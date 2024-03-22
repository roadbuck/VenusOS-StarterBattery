import subprocess
import os
import shutil
from datetime import datetime

directories = [
    '/data/RoadbuckMods',
    '/data/RoadbuckMods/StarterBattery',
    '/data/RoadbuckMods/StarterBattery/backup_files',
    ]

for directory in directories:
    if not os.path.exists(directory):
        os.makedirs(directory)
        print(f"directory {directory} created.")
    else:
        print(f"directory {directory} already exist")


source_directory = '/data/StarterBattery/files'
destination_directory = '/data/RoadbuckMods/StarterBattery'

try:
    shutil.move(source_directory, destination_directory)
    print("directory moved successfully.")
except Exception as e:
    print(f"Error moving the directory: {e}")

with open('/data/RoadbuckMods/StarterBattery/files/dbus_data.ini', 'r') as file:
    
    for line in file:
        command = line.strip()
        subprocess.run(command, shell=True)

files_to_copy = [
    {
        'source': '/data/RoadbuckMods/StarterBattery/files/qml/RB_StarterBattery.qml',
        'destination': '/opt/victronenergy/gui/qml/RB_StarterBattery.qml'
    },
    {
        'source': '/data/RoadbuckMods/StarterBattery/files/qml/PageSettingsRoadbuckMods.qml',
        'destination': '/opt/victronenergy/gui/qml/PageSettingsRoadbuckMods.qml'
    },
    {
        'source': '/data/RoadbuckMods/StarterBattery/files/qml/PageSettingsRoadbuckStarterBattery.qml',
        'destination': '/opt/victronenergy/gui/qml/PageSettingsRoadbuckStarterBattery.qml'
    },
]

for file_info in files_to_copy:
    source_path = file_info['source']
    destination_path = file_info['destination']
    if os.path.exists(destination_path):
        os.rename(destination_path, destination_path + '.orig')
        print(f"the existing file was renamed to {destination_path}.orig")

   
    shutil.copy(source_path, destination_path)
    print(f"the file was copied from {source_path} to {destination_path} ")

source_files = [
    '/opt/victronenergy/gui/qml/main.qml',
    '/opt/victronenergy/gui/qml/OverviewHubEnhanced.qml',
    '/opt/victronenergy/gui/qml/PageSettingsDisplay.qml',
]


destination_directory = '/data/RoadbuckMods/StarterBattery/backup_files'

current_datetime = datetime.now().strftime('%Y-%m-%d_%H-%M')
destination_directory_with_timestamp = os.path.join(destination_directory, current_datetime)

if not os.path.exists(destination_directory_with_timestamp):
    os.makedirs(destination_directory_with_timestamp)
    print(f"the directory {destination_directory_with_timestamp} was created")

for file_path in source_files:
    file_name = os.path.basename(file_path)
    destination_path = os.path.join(destination_directory_with_timestamp, file_name)
    shutil.copy(file_path, destination_path)
    print(f"the file was copied from {file_path} to {destination_path} ")
