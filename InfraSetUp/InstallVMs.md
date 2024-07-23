To create an Ubuntu EC2 instance in AWS, follow these steps:

Sign in to the AWS Management Console:

Go to the AWS Management Console at https://aws.amazon.com/console/.
Sign in with your AWS account credentials.
Navigate to EC2:

Once logged in, navigate to the EC2 dashboard by typing "EC2" in the search bar at the top or by selecting "Services" and then "EC2" under the "Compute" section.
Launch Instance:

Click on the "Instances" link in the EC2 dashboard sidebar.
Click the "Launch Instance" button.
Choose an Amazon Machine Image (AMI):

In the "Step 1: Choose an Amazon Machine Image (AMI)" section, select "Ubuntu" from the list of available AMIs.
Choose the Ubuntu version you want to use. For example, "Ubuntu Server 20.04 LTS".
Click "Select".
Choose an Instance Type:

In the "Step 2: Choose an Instance Type" section, select the instance type that fits your requirements. The default option (usually a t2.micro instance) is suitable for testing and small workloads.
Click "Next: Configure Instance Details".
Configure Instance Details:

Optionally, configure instance details such as network settings, subnets, IAM role, etc. You can leave these settings as default for now.
Click "Next: Add Storage".
Add Storage:

Specify the size of the root volume (default is usually fine for testing purposes).
Click "Next: Add Tags".
Add Tags:

Optionally, add tags to your instance for better organization and management.
Click "Next: Configure Security Group".
Configure Security Group:

![image](https://github.com/user-attachments/assets/e7218d3d-cc9f-4856-959f-f24f6daef112)

In the "Step 6: Configure Security Group" section, configure the security group to allow SSH access (port 22) from your IP address.
You may also want to allow other ports based on your requirements (e.g., HTTP, HTTPS) as in this pic Alt text
Click "Review and Launch".
Review and Launch:

Review the configuration of your instance.
Click "Launch".
Select Key Pair:

In the pop-up window, select an existing key pair or create a new one.
Check the acknowledgment box.
Click "Launch Instances".
Access Your Instance:

Use Mobaxterm to access the virtual machines
