# Define folder paths based on the desktop path
$desktopPath = [Environment]::GetFolderPath("Desktop")
$DesktopFiles = Join-Path -Path $desktopPath -ChildPath "Files"

# Initialize a global variable to indicate optimization status
$script:isOptimizing = $false

function Download-FileIfNotExist {
    param (
        [string]$url,
        [string]$destinationPath
    )

    if (-not (Test-Path -Path $destinationPath)) {
        Write-Host "Downloading $url to $destinationPath"
        Invoke-WebRequest -Uri $url -OutFile $destinationPath
    }
}

function Invoke-PowerShellScript {
    param (
        [string]$scriptPath,
        [string]$arguments = ""
    )
    
    $arguments = $arguments -replace '\"', '\\\"'
    Start-Process powershell.exe -ArgumentList "-ExecutionPolicy Bypass -NoProfile -File `"$scriptPath`" $arguments" -Wait -Verb RunAs
}

function Invoke-RegFile {
    param (
        [string]$regFilePath
    )
    
    Start-Process regedit.exe -ArgumentList "/s `"$regFilePath`"" -Wait -Verb RunAs
}

function Copy-FilesIfDirectoriesExist {
    param (
        [string]$sourceDirectory,
        [string]$destinationDirectory
    )

    if (Test-Path -Path $sourceDirectory -PathType Container -and Test-Path -Path $destinationDirectory -PathType Container) {
        Get-ChildItem -Path $sourceDirectory | ForEach-Object {
            $destinationFilePath = Join-Path -Path $destinationDirectory -ChildPath $_.Name
            Copy-Item -Path $_.FullName -Destination $destinationFilePath -Force
            Write-Host "Copied $($_.Name) to $destinationFilePath"
        }
        Write-Host "All files copied successfully."
    } else {
        Write-Host "Source or destination directory does not exist."
    }
}

function Create-Folders {
    New-Item -Path $DesktopFiles -ItemType Directory -Force | Out-Null
}

function Download-Scripts {
    # Example for downloading scripts and registry files
    $urls = @(
        "https://github.com/WaterSippin/PCChanges/raw/main/CoreInstalls.ps1",
        "https://github.com/WaterSippin/PCChanges/raw/main/InstallChocolatey.ps1",
        "https://github.com/WaterSippin/PCChanges/raw/main/New-FolderForced.psm1",
        "https://github.com/WaterSippin/PCChanges/raw/main/RunOptimzer.ps1",
        "https://github.com/WaterSippin/PCChanges/raw/main/RegistryChanges.reg",
        "https://github.com/WaterSippin/PCChanges/raw/main/disabledefender.ps1",
        "https://github.com/WaterSippin/PCChanges/raw/main/enableDefender.ps1",
        "https://github.com/WaterSippin/PCChanges/raw/main/PowershellChanges.ps1",
        "https://github.com/WaterSippin/PCChanges/raw/main/take-own.psm1",
        "https://github.com/WaterSippin/PCChanges/raw/main/template10.json",
        "https://github.com/WaterSippin/PCChanges/raw/main/template11.json",
        "https://github.com/WaterSippin/PCChanges/raw/main/Programs/optimizer.exe",
        "https://github.com/WaterSippin/PCChanges/raw/main/Programs/TCPOptimizer.exe",
        "https://dl.bitsum.com/files/processlassosetup64.exe"

    )

    $destinationPaths = $urls | ForEach-Object {
        Join-Path -Path $DesktopFiles -ChildPath ($_.Split('/')[-1])
    }

    for ($i = 0; $i -lt $urls.Count; $i++) {
        Download-FileIfNotExist -url $urls[$i] -destinationPath $destinationPaths[$i]
    }
}


function Run-Optimizer {
    Write-Host "Optimizer is running..."
    Invoke-PowerShellScript -scriptPath (Join-Path -Path $DesktopFiles -ChildPath "RunOptimizer.ps1")
    Write-Host "RunOptimizer.ps1 has finished running..."
}

function Enable-Defender {
    $scriptPath = Join-Path -Path $DesktopFiles -ChildPath "optimizer.exe"
    $arguments = " /restart=enabledefender"
    Invoke-PowerShellScript -scriptPath $scriptPath -arguments $arguments
}

function Disable-Defender {
    $scriptPath = Join-Path -Path $DesktopFiles -ChildPath "optimizer.exe"
    $arguments = " /restart=disabledefender"
    Invoke-PowerShellScript -scriptPath $scriptPath -arguments $arguments
}

function Delete-Files {
    Remove-Item -Path $DesktopFiles -Recurse -Force
}

function RunScripts {
    $InstallChoco = Join-Path -Path $DesktopFiles -ChildPath "InstallChocolatey.ps1"
    $RemoveOneDrive = Join-Path -Path $DesktopFiles -ChildPath "remove-onedrive.ps1"
    $VisualEffects = Join-Path -Path $DesktopFiles -ChildPath "VisualEffects.reg"
    $optimizer = Join-Path -Path $DesktopFiles -ChildPath "RunOptimizer.ps1"
    
    Invoke-RegFile -regFilePath $VisualEffects
    Invoke-PowerShellScript -scriptPath $optimizer
    Invoke-PowerShellScript -scriptPath $InstallChoco
    Invoke-PowerShellScript -scriptPath $RemoveOneDrive
    
    
}
function RunInstalls {
    $CoreInstalls = Join-Path -Path $DesktopFiles -ChildPath "CoreInstalls.ps1"
    Invoke-PowerShellScript -scriptPath $CoreInstalls
}

function Complete-Setup {

    Run-Optimizer
    RunScripts
    $optimizerPath = Join-Path -Path $DesktopFiles -ChildPath "TCPOptimizer.exe"
    $processLasso = Join-Path -Path $DesktopFiles -ChildPath "processlassosetup64.exe"
    RunProgramAsAdmin -ExecutablePath $processLasso
    RunProgramAsAdmin -ExecutablePath $optimizerPath


    # Assume RunAllScripts is a function similar to Run-Optimizer, handling multiple scripts
}

function RunProgramAsAdmin {
    param (
        [string]$ExecutablePath
    )

    Start-Process -FilePath $ExecutablePath -ArgumentList "/S" -Verb RunAs
}

Create-Folders
Download-Scripts
# Create the main form
$form = New-Object System.Windows.Forms.Form
$form.Text = 'Utility Script'
$form.Size = New-Object System.Drawing.Size(300,200)
$form.StartPosition = 'CenterScreen'

# Function to create a button
function Create-Button {
    param($text, $top, [scriptblock]$action)
    
    $button = New-Object System.Windows.Forms.Button
    $button.Text = $text
    $button.Top = $top
    $button.Left = 50
    $button.Width = 200
    $button.Height = 30
    
    $button.Add_Click($action)
    
    return $button
}

# Assuming your functions `Complete-Setup`, `RunInstalls`, `Enable-Defender`, `Disable-Defender` are defined in BetterOptimizerFunctions.ps1
# Create buttons
$setupButton = Create-Button -text 'Run Setup' -top 10 -action { Complete-Setup }
$downloadButton = Create-Button -text 'Download Programs' -top 50 -action { RunInstalls }
$enableDefenderButton = Create-Button -text 'Enable Defender' -top 90 -action { Enable-Defender }
$disableDefenderButton = Create-Button -text 'Disable Defender' -top 130 -action { Disable-Defender }

# Add buttons to the form
$form.Controls.Add($setupButton)
$form.Controls.Add($downloadButton)
$form.Controls.Add($enableDefenderButton)
$form.Controls.Add($disableDefenderButton)

# Show the form
$form.ShowDialog()
