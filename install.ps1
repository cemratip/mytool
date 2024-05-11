$toolUrl = "https://github.com/cemratip/mytool.exe"
$installDir = "$HOME\mytool"
$exePath = Join-Path $installDir "mytool.exe"

# Create the installation directory if it doesn't exist
New-Item -ItemType Directory -Force -Path $installDir

# Download the executable
Invoke-WebRequest -Uri $toolUrl -OutFile $exePath

# Ensure the executable can be run
If (!(Test-Path $exePath)) {
    Write-Error "Download failed. Please try again or contact support."
    Exit
}

# Add the install directory to the user's PATH if not already added
$envPath = [System.Environment]::GetEnvironmentVariable("Path", [System.EnvironmentVariableTarget]::User)
if (!$envPath.Contains($installDir)) {
    [System.Environment]::SetEnvironmentVariable("Path", "$envPath;$installDir", [System.EnvironmentVariableTarget]::User)
}

Write-Host "Installation completed. Please restart your PowerShell to use the tool."
