# Install Web Deploy on the Azure VM

# Enable the IIS feature
Install-WindowsFeature -name Web-Server -IncludeManagementTools

# Download the Web Deploy installer
$webDeployInstallerUrl = "https://download.microsoft.com/download/1/3/7/137B4B7D-2D4A-4B9A-8B5D-3D1C4D4D3B7D/WebDeploy_amd64_en.exe"
$installerPath = "$env:TEMP\WebDeploy_amd64_en.exe"

Invoke-WebRequest -Uri $webDeployInstallerUrl -OutFile $installerPath

# Install Web Deploy
Start-Process -FilePath $installerPath -ArgumentList "/quiet" -Wait

# Clean up the installer
Remove-Item -Path $installerPath -Force

# Configure Web Deploy
$webDeployConfigPath = "C:\Program Files\IIS\Microsoft Web Deploy V3\"
if (Test-Path $webDeployConfigPath) {
    # Set permissions for Web Deploy
    & "$webDeployConfigPath\msdeploy.exe" -verb:sync -source:package="$webDeployConfigPath\WebDeployPackage.zip" -dest:auto,computerName="localhost",username="AdminUser",password="AdminPassword",authType="Basic" -allowUntrusted
}

Write-Host "Web Deploy installation completed successfully."