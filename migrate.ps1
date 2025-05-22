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

# Step 1: Copy CSV from source VM to Jenkins agent (local)
Write-Host "Copying CSV from source VM to Jenkins agent..."
scp "$username@${sourceVMIP}:${csvFilePath}" "$localCsvPath"
if ($LASTEXITCODE -ne 0) {
    Write-Error "Failed to copy CSV from source VM."
    exit 1
}

# Step 2: Copy CSV from Jenkins agent (local) to target VM
Write-Host "Copying CSV from Jenkins agent to target VM..."
scp "$localCsvPath" "$username@${targetVMIP}:/home/$username/mydata.csv"
if ($LASTEXITCODE -ne 0) {
    Write-Error "Failed to copy CSV to target VM."
    exit 1
}

Write-Host "Migration completed successfully."
exit 0
