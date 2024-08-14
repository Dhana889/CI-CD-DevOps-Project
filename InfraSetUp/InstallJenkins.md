## Installing Jenkins on Ubuntu


```bash
#!/bin/bash

# Install OpenJDK 17 JRE Headless
sudo apt install openjdk-17-jre-headless -y

# Download Jenkins GPG key
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key

# Add Jenkins repository to package manager sources
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

# Update package manager repositories
sudo apt-get update

# Install Jenkins
sudo apt-get install jenkins -y

sudo systemctl start jenkins

sudo systemctl status jenkins

```

Save this script in a file, for example, `install_jenkins.sh`, and make it executable using:

```bash
chmod +x install_jenkins.sh
```

Then, you can run the script using:

```bash
./install_jenkins.sh
```

This script will automate the installation process of OpenJDK 17 JRE Headless and Jenkins.


## Install docker for future use

```bash
#!/bin/bash

# Update package manager repositories
sudo apt-get update

# Install necessary dependencies
sudo apt-get install -y ca-certificates curl

# Create directory for Docker GPG key
sudo install -m 0755 -d /etc/apt/keyrings

# Download Docker's GPG key
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc

# Ensure proper permissions for the key
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add Docker repository to Apt sources
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
$(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update package manager repositories
sudo apt-get update

sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin 

sudo chmod 666 /var/run/docker.sock 
```

Save this script in a file, for example, `install_docker.sh`, and make it executable using:

```bash
chmod +x install_docker.sh
```

Then, you can run the script using:

```bash
./install_docker.sh
```
## Install Trivy for vulnerability scanner

```bash
sudo apt-get install wget apt-transport-https gnupg
wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | gpg --dearmor | sudo tee /usr/share/keyrings/trivy.gpg > /dev/null
echo "deb [signed-by=/usr/share/keyrings/trivy.gpg] https://aquasecurity.github.io/trivy-repo/deb generic main" | sudo tee -a /etc/apt/sources.list.d/trivy.list
sudo apt-get update
sudo apt-get install trivy -y
```
## Install Owasp Dependency Check for vulnerability scanner

Import the GPG key used to sign all Dependency Check releases
```bash
sudo gpg --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 259A55407DD6C00299E6607EFFDE55BE73A2D1ED
```
Download the dependency-check command line tool
```bash
wget https://github.com/jeremylong/DependencyCheck/releases/download/v10.0.3/dependency-check-10.0.3-release.zip
```
Download associated GPG signature file
```bash
wget https://github.com/jeremylong/DependencyCheck/releases/download/v10.0.3/dependency-check-10.0.3-release.zip.asc
```
Verify the cryptographic integrity of your download
```bash
gpg --verify dependency-check-10.0.3-release.zip.asc
```
sudo unzip dependency-check-<latest-version>.zip -d /opt/
export PATH=$PATH:/opt/dependency-check/bin
Run source ~/.bashrc to apply the changes

Verity the Installation
```bash
dependency-check.sh --help
```
