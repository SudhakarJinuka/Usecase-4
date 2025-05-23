# 

# transfer.ps1
param (
    [string]$DestinationUser = "sjinuka",
    [string]$DestinationHost = "10.128.0.28",
    [string]$CsvFilePath = "Sample_data.csv",
    [string]$TargetPath = "/home/sjinuka/"
)
 
# Compose destination string with proper variable expansion
$destination = "${DestinationUser}@${DestinationHost}:$TargetPath"
 
# Run scp command with strict host key checking disabled
scp -o StrictHostKeyChecking=no $CsvFilePath $destination