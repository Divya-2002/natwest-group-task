#!/bin/bash

#IP address argument provided check
if [ $# -ne 1 ]; then
    echo "Usage: $0 <EC2_INSTANCE_IP>"
    exit 1
fi

# Our instance IP
EC2_IP=$1

# for SSH
SSH_CMD="ssh -i ./my-key.pem ec2-user@${EC2_IP}"

# install apache
INSTALL_APACHE_CMD="sudo yum update -y && sudo yum install httpd -y"

# to start apache
START_APACHE_CMD="sudo systemctl start httpd"

# to enable apache
ENABLE_APACHE_CMD="sudo systemctl enable httpd"

# HTML content 
HTML_CONTENT="<!DOCTYPE html>
<html>
<head>
    <title>My WEB PAGE</title>
</head>
<body>
    <h1>Hello from Divya EC2 instance!!</h1>
    <p>This is my HTML page deployed on an EC2 instance using scripting automation.</p>
</body>
</html>"

CREATE_HTML_FILE_CMD="echo '${HTML_CONTENT}' | sudo tee /var/www/html/index.html"


echo "Installing Apache and deploying HTML page on EC2 instance..."
echo "Connecting to EC2 instance at ${EC2_IP}..."

# Execute commands on the remote EC2 instance using SSH
$SSH_CMD "$INSTALL_APACHE_CMD && $START_APACHE_CMD && $ENABLE_APACHE_CMD && $CREATE_HTML_FILE_CMD"

echo "YAy!!!!!! We did it."
