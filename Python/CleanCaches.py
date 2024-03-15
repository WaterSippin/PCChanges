import shutil
import os

# Get the path to the current user's AppData\Local folder
local_app_data = os.getenv('LOCALAPPDATA')

# Define the directories to delete, relative to the AppData\Local folder
relative_dirs_to_delete = [
    'cache',
    'CrashDumps',
    'Temp',
    'D3DSCache',
    'EpicGamesLauncher\\Saved\\webcache_4430\\Cache',
    'NVIDIA\\GLCache',
    'Opera Software\\Opera Stable\\Default\\Cache\\Cache_Data',
    'Steam\\htmlcache\\Cache\\Cache_Data'
]

# Construct the full paths
dirs_to_delete = [os.path.join(local_app_data, rel_path) for rel_path in relative_dirs_to_delete]

for dir_path in dirs_to_delete:
    try:
        # Check if the directory exists before trying to delete it
        if os.path.exists(dir_path) and os.path.isdir(dir_path):
            # Recursively delete a directory tree
            shutil.rmtree(dir_path)
            print(f"Successfully deleted {dir_path}")
        else:
            print(f"Directory does not exist: {dir_path}")
    except PermissionError as e:
        print(f"Permission denied: {dir_path}. Reason: {e}")
    except FileNotFoundError as e:
        print(f"Not found: {dir_path}. Reason: {e}")
    except Exception as e:
        print(f"Failed to delete {dir_path}. Reason: {e}")
