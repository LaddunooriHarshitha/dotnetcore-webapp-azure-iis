param (
    [string]$artifactPath,
    [string]$iisSiteName,
    [string]$iisPath
)

# Stop the IIS site
Stop-WebAppPool -Name $iisSiteName
Stop-Website -Name $iisSiteName

# Remove existing files in the IIS path
Remove-Item "$iisPath\*" -Recurse -Force

# Unzip the artifact
Expand-Archive -Path $artifactPath -DestinationPath $iisPath -Force

# Start the IIS site
Start-Website -Name $iisSiteName
Start-WebAppPool -Name $iisSiteName

Write-Host "Deployment to IIS completed successfully."