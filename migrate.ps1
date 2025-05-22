# Variables
$sourceVMIP = "35.225.255.73"
$targetVMIP = "104.154.202.70"
$csvFilePath = "/home/sjinuka/sample_data.csv"  # Path to the CSV file on source VM
$sshKeyPath = "/home/sjinuka/.ssh/id_rsa"   # Update this path if needed
$localCsvPath = "/tmp/mydata.csv"  # or any Linux-accessible path
$username = "sjinuka"                      # Replace with actual username on VMs

scp -i $sshKeyPath "$username@${sourceVMIP}:${csvFilePath}" "$localCsvPath"
scp -i $sshKeyPath "$localCsvPath" "$username@${targetVMIP}:/home/$username/mydata.csv"




