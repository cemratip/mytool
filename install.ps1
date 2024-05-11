# Define where to install the tool
$installDir = "$HOME\mytool"

# Create the directory if it doesn't exist
New-Item -Path $installDir -ItemType Directory -Force

# Download the tool
Invoke-WebRequest -Uri "https://example.com/mytool.exe" -OutFile "$installDir\mytool.exe"

# Add the tool to PATH in the user environment variable
$envPath = [Environment]::GetEnvironmentVariable("Path", [EnvironmentVariableTarget]::User)
if (-not $envPath.Contains($installDir)) {
    [Environment]::SetEnvironmentVariable("Path", $envPath + ";$installDir", [EnvironmentVariableTarget]::User)
}

Write-Host "Installation completed. Please restart your PowerShell to use the tool."
