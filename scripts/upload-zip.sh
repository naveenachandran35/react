#!/bin/bash

# SSH Connection Details
ssh_user="your_ssh_username"
ssh_host="your_ssh_host"
ssh_port="your_ssh_port"
ssh_key="path/to/your/ssh/private/key" # Optional, if you use key-based authentication

# Remote Directory where you want to upload the file
remote_directory="/path/to/remote/directory"

# Local file to upload
local_file="path/to/your/local/file.zip"

# Command to unzip the file on the remote host
unzip_command="unzip -o file.zip" # Modify this according to your specific needs

# SCP (Secure Copy) the file to the remote host
scp_command="scp -P $ssh_port -i $ssh_key $local_file $ssh_user@$ssh_host:$remote_directory"

# SSH into the remote host and execute the unzip command
ssh_command="ssh -p $ssh_port -i $ssh_key $ssh_user@$ssh_host \"$unzip_command\""

# Upload the file to the remote host
echo "Uploading file to remote host..."
eval "$scp_command"

# Execute the unzip command on the remote host
echo "Running unzip command on remote host..."
eval "$ssh_command"

echo "File upload and unzip completed."
