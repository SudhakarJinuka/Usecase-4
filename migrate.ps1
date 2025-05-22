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
Write-Host "pwd"
Write-Host "CSV Path on Source VM: $csvFilePath"
Write-Host "Local CSV Path: $localCsvPath"

# Use ${} to avoid colon parsing issues
$remoteSource = "${username}@${sourceVMIP}:${csvFilePath}"
$remoteTarget = "${username}@${targetVMIP}:/home/${username}/mydata.csv"
$qey = "pwd"

Write-Host "Copying from source VM..."
scp -o StrictHostKeyChecking=no "$remoteSource" "$localCsvPath"
if ($LASTEXITCODE -ne 0) {
    Write-Error "Failed to copy CSV from source VM."
    exit 1
}

Write-Host "Copying to target VM..."
scp -o StrictHostKeyChecking=no "$localCsvPath" "$remoteTarget"
if ($LASTEXITCODE -ne 0) {
    Write-Error "Failed to copy CSV to target VM."
    exit 1
}

Write-Host "CSV migration completed successfully."
