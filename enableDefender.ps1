# Set execution policy
Set-ExecutionPolicy Bypass -Scope Process -Force

# Get the directory of the script
$ScriptPath = Split-Path -Parent $MyInvocation.MyCommand.Definition


# Construct the full path to the optimizer.exe
$OptimizerPath = Join-Path $ScriptPath "..\Applications\optimizer.exe"


Start-Process -FilePath $OptimizerPath -ArgumentList "/restart=EnableDefender"

