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
        print(f"Directory {directory} created.")
    else:
        print(f"Directory {directory} already exists.")

source_directory = '/data/StarterBattery/files'
destination_directory = '/data/RoadbuckMods/StarterBattery'

try:
    shutil.move(source_directory, destination_directory)
    print("Directory moved successfully.")
except Exception as e:
    print(f"Error moving directory: {e}")

def set_file_permissions(file_path, permissions):
    try:
        os.chmod(file_path, permissions)
        print(f"Permissions for {file_path} set to {permissions}.")
    except Exception as e:
        print(f"Error setting permissions for {file_path}: {e}")

def run_bash_script(script_path):
    try:
        subprocess.run([script_path], check=True)
        print(f"Script {script_path} executed successfully.")
    except subprocess.CalledProcessError as e:
        print(f"Error executing script {script_path}: {e}")

if __name__ == "__main__":
    file_path = "/data/RoadbuckMods/StarterBattery/files/update_dbus_settings.sh"
    permissions = 0o755

    set_file_permissions(file_path, permissions)
    run_bash_script(file_path)

files_to_copy = [
    {
        'source': '/data/RoadbuckMods/StarterBattery/files/qml/RB_StarterBattery.qml',
        'destination': '/opt/victronenergy/gui/qml/RB_StarterBattery.qml'
    },
    {
        'source': '/data/RoadbuckMods/StarterBattery/files/qml/DE_PageSettingsRoadbuckMods.qml',
        'destination': '/opt/victronenergy/gui/qml/PageSettingsRoadbuckMods.qml'
    },
    {
        'source': '/data/RoadbuckMods/StarterBattery/files/qml/DE_PageSettingsRoadbuckStarterBattery.qml',
        'destination': '/opt/victronenergy/gui/qml/PageSettingsRoadbuckStarterBattery.qml'
    },
]

for file_info in files_to_copy:
    source_path = file_info['source']
    destination_path = file_info['destination']

    if os.path.exists(destination_path):
        os.rename(destination_path, destination_path + '.orig')
        print(f"The existing file has been renamed to {destination_path}.orig")

    shutil.copy(source_path, destination_path)
    print(f"The file has been copied from {source_path} to {destination_path}")

source_files = [
    '/opt/victronenergy/gui/qml/main.qml',
    '/opt/victronenergy/gui/qml/OverviewHub.qml',
    '/opt/victronenergy/gui/qml/OverviewHubEnhanced.qml',
    '/opt/victronenergy/gui/qml/PageSettingsDisplay.qml',
    '/opt/victronenergy/gui/qml/PageSettingsRoadbuckStarterBattery.qml',
    '/opt/victronenergy/gui/qml/RB_StarterBattery.qml',
]

destination_directory = '/data/RoadbuckMods/StarterBattery/backup_files'

current_datetime = datetime.now().strftime('%Y-%m-%d_%H-%M')
destination_directory_with_timestamp = os.path.join(destination_directory, current_datetime)

if not os.path.exists(destination_directory_with_timestamp):
    os.makedirs(destination_directory_with_timestamp)
    print(f"Directory {destination_directory_with_timestamp} created")

for file_path in source_files:
    file_name = os.path.basename(file_path)
    destination_path = os.path.join(destination_directory_with_timestamp, file_name)
    shutil.copy(file_path, destination_path)
    print(f"File {file_path} copied to {destination_path}")
