# Install IIS on the Azure VM
Install-WindowsFeature -name Web-Server -IncludeManagementTools

# Enable required features for ASP.NET applications
Install-WindowsFeature -name Web-Asp-Net45

# Set the application pool to use the correct .NET version
$appPoolName = "DefaultAppPool"
Set-ItemProperty "IIS:\AppPools\$appPoolName" -Name "managedRuntimeVersion" -Value "v4.0"

# Start the IIS service
Start-Service W3SVC

# Ensure the IIS service is set to start automatically
Set-Service W3SVC -StartupType Automatic

# Output the installation status
Write-Host "IIS and ASP.NET features installed successfully."