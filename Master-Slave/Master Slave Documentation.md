Configuring a Jenkins Permanent Agent
=====================================
Ensure SSH Service is Running

Check if the SSH service is running:

sudo systemctl status ssh

If the SSH service is not running, start it:

sudo systemctl start ssh

If SSH is not installed, execute the following commands:

sudo apt update
sudo apt install openssh-server
sudo systemctl start ssh
sudo systemctl enable ssh  # To start SSH on boot

Creating a Permanent Jenkins Agent
Step-by-Step Configuration

    Name: Enter a name for your agent (e.g., agent1).
    Description: Add a description for the agent.
    Number of Executors: Define how many jobs the agent can run in parallel. This typically depends on the server's processing capability.
    Remote Root Directory:
        Case 1: Agent on the Same Machine as Jenkins Master:
            Create a new user for the agent (recommended to keep isolation).
            Use the path to the new user’s home directory as the remote root directory.
            Note: It is advisable to keep agent-specific users separate from admin or regular users for security and isolation.

Setting Up the SSH Key Pair

Log in as the Jenkins user in the terminal (if creating an agent on the same machine):

su - jenkins

Generate an SSH key pair:

ssh-keygen

Standard Path for SSH Keys: By default, keys are stored in /var/lib/jenkins/.ssh/id_ed25519.

On the Agent Machine:

    Copy the public SSH key from the master and paste it into the new agent’s .ssh directory:

    mkdir ~/.ssh

Create an authorized_keys file in the .ssh directory and paste the public key into it:

nano ~/.ssh/authorized_keys

    Copy the private SSH key from the master.

Node Configuration on Jenkins

Labels: Assign labels to categorize agents into clusters or groups based on their purpose.

Launch Method: Choose "Launch agent via SSH" and provide the following details:

    SSH Username and Private Key:
        Paste the private key copied earlier.
    ID: Provide an identifier for this configuration.
    Description: Add a description.
    Username: Enter the username of the agent machine (e.g., agent1).

Host Key Verification Strategy:

    Select "Non-verifying Verification Strategy."

Java Path:

    If the agent machine has multiple Java versions installed, find the path for Java using:

    sudo update-alternatives --config java

        Copy the selected path and paste it into the Java Path field in Jenkins.

Final Step

    Save the configuration and launch the agent!
