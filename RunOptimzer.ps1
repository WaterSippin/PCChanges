# Set execution policy
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass

# Set working directory to Desktop/Files/Applications
Set-Location "$env:USERPROFILE\Desktop\Files"

# Initial default configuration file assuming Windows 10
$Configfile = "$env:USERPROFILE\Desktop\Files\template10.json"

# Check if running on Windows 11 by examining the build number
# Windows 11 starts from build number 22000
if ((Get-ComputerInfo).WindowsBuildLabEx -match '(\d+)' -and $matches[1] -ge 22000) {
    # Define the path to the Windows 11 configuration file
    $Configfile = "$env:USERPROFILE\Desktop\Files\template11.json"
}

# Display which config file is being used (optional)
Write-Host "Using configuration file: $Configfile"

# Run the optimizer
.\optimizer.exe /config=$Configfile
