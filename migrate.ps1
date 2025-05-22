# Variables
$sourceVMIP = "35.225.255.73"
$targetVMIP = "104.154.202.70"
$csvFilePath = "/home/sjinuka/sample_data.csv"  # Path to the CSV file on source VM
$sshKeyPath = "$home/sjinuka/.ssh/id_rsa"   # Update this path if needed
$username = "sjinuka"                      # Replace with actual username on VMs

# Step 1: Copy from source VM to local
scp -i $sshKeyPath "$username@${sourceVMIP}:${csvFilePath}" "C:\Temp\mydata.csv"

# Step 2: Copy from local to target VM
scp -i $sshKeyPath "C:\Temp\mydata.csv" "$username@${targetVMIP}:/home/$username/mydata.csv"



