param(
    [string]$sourceVMIP,
    [string]$targetVMIP,
    [string]$username,
    [string]$csvFilePath,
    [string]$localCsvPath
)

Write-Host "Starting migration..."
Write-Host "Source VM IP: $sourceVMIP"
Write-Host "Target VM IP: $targetVMIP"
Write-Host "Username: $username"
Write-Host "CSV Path on Source VM: $csvFilePath"
Write-Host "Local CSV Path: $localCsvPath"

scp -o StrictHostKeyChecking=no -i $sshKeyPath "$username@${sourceVMIP}:${csvFilePath}" "$localCsvPath"
scp -o StrictHostKeyChecking=no -i $sshKeyPath "$localCsvPath" "$username@${targetVMIP}:/home/$username/mydata.csv"

