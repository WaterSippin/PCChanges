import os

# Construct the path to the settings file dynamically
home_dir = os.path.expanduser('~')  # Gets the user's home directory
settings_file_path = os.path.join(home_dir, 'Documents', 'Overwatch', 'Settings', 'Settings_v0.ini')

# Define the new values for the specific sections
new_values = {
    "[Render.13]": [
        "FrameRateCap = \"241\"",
        "FullScreenRefresh = \"241\"",
        "FullscreenWindow = \"0\"",
        "FullscreenWindowEnabled = \"0\"",
        "GFXPresetLevel = \"1\"",
        "ModelQuality = \"3\"",
        "PhysicsQuality = \"1\"",
        "ShowFPSCounter = \"1\"",
        "ShowRTT = \"1\"",
        "ShowSystemClock = \"1\"",
        "SoundQuality = \"3\"",
        "UseCustomFrameRates = \"1\"",
        "WaterCombineCascades = \"0\"",
        "WindowedFullscreen = \"1\"",
        "WindowedRefresh = \"240\"",
        "WindowMode = \"1\""
    ],
    "[Subtitles.1]": [
        "Subtitles = \"1\""
    ]
}

def update_config_file(file_path, new_values):
    # Read the current content of the file
    with open(file_path, 'r') as file:
        lines = file.readlines()
    
    # Prepare a dictionary to track sections and their lines
    sections = {}
    current_section = None
    for line in lines:
        if line.strip().startswith('[') and line.strip().endswith(']'):
            current_section = line.strip()
            sections[current_section] = []
        elif current_section:
            sections[current_section].append(line.strip())
    
    # Update or add the new values
    for section, values in new_values.items():
        sections[section] = values  # This replaces or adds the section with new values
    
    # Reconstruct the file content
    modified_content = []
    for section, values in sections.items():
        modified_content.append(section + '\n')
        modified_content.extend([value + '\n' for value in values])
        modified_content.append('\n')  # Add a newline for spacing between sections
    
    # Write the modified content back to the file
    with open(file_path, 'w') as file:
        file.writelines(modified_content)

# Update the configuration file with the new values
update_config_file(settings_file_path, new_values)
