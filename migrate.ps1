# Variables
$sourceVMIP = "35.225.255.73"
$targetVMIP = "104.154.202.70"
$csvFilePath = "$home/sjinuka/sample_data.csv"  # Path to the CSV file on source VM
$sshKeyPath = "$home/sjinuka/.ssh/id_rsa.pub"   # Update this path if needed
$username = "sjinuka"                      # Replace with actual username on VMs

# Step 1: Copy the file from source-vm to your local machine
scp -i $sshKeyPath "$username@$sourceVMIP:$csvFilePath" "C:\Temp\mydata.csv"

# Step 2: Copy the file from local machine to target-vm
scp -i $sshKeyPath "C:\Temp\mydata.csv" "$username@$targetVMIP:/home/$username/mydata.csv"
