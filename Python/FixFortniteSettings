import os

def update_fortnite_settings():
    # Build the path to the GameUserSettings.ini file
    local_app_data = os.getenv('LOCALAPPDATA')
    settings_file_path = os.path.join(local_app_data, 'FortniteGame', 'Saved', 'Config', 'WindowsClient', 'GameUserSettings.ini')

    try:
        # Read the current contents of the file
        with open(settings_file_path, 'r') as file:
            lines = file.readlines()

        # Define the settings to update
        settings_to_update = {
            'bMotionBlur': 'False',
            'bShowGrass': 'False',
            'bShowFPS': 'False',
            'DLSSQuality': '0',
            'DLSSQuality': '0',
            'bUseNanite': 'False',
            'FrameRateLimit': '240',

            "sg.ResolutionQuality": "100",
            "sg.ViewDistanceQuality": "0",
            "sg.AntiAliasingQuality": "0",
            "sg.ShadowQuality": "0",
            "sg.GlobalIlluminationQuality": "0",
            "sg.ReflectionQuality": "0",
            "sg.PostProcessQuality": "0",
            "sg.TextureQuality": "2",
            "sg.EffectsQuality": "0",
            "sg.FoliageQuality": "0",
            "sg.ShadingQuality": "3",
            "sg.LandscapeQuality": "2",
            "r.RayTracing.EnableInGame": "false",
            "PreferredRHI" : "dx11",
            "PreferredFeatureLevel": "es31"



        }

        # Update the specific lines
        updated_lines = []
        for line in lines:
            for setting, value in settings_to_update.items():
                if line.strip().startswith(setting):
                    line = f'{setting}={value}\n'
                    break
            updated_lines.append(line)

        # Write the modified contents back to the file
        with open(settings_file_path, 'w') as file:
            file.writelines(updated_lines)

        print("Fortnite settings updated successfully.")
    except Exception as e:
        print(f"Error updating Fortnite settings: {e}")

# Run the update function
update_fortnite_settings()
