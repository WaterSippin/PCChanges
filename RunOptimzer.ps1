# Set execution policy
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass

# Set working directory to Desktop/Files/Applications
Set-Location "$env:USERPROFILE\Desktop\Files\Applications"

# Define the path to the configuration file
$Configfile = "$env:USERPROFILE\Desktop\Files\Scripts\template10.json"

# Run the optimizer
.\optimizer.exe /config=$Configfile
