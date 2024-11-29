Automated Jenkins Installation Script
====================================
This script provides an automated way to install and set up Jenkins on multiple operating systems. It checks for Java dependencies, installs the required Java version if not found, downloads the Jenkins WAR file, and starts the Jenkins server.
Features

    Validates input parameters to ensure proper usage.
    Supports installation on Ubuntu/Debian, CentOS/RHEL, and macOS.
    Installs OpenJDK 11 if Java is not already installed.
    Downloads the specified version of Jenkins (via argument).
    Starts Jenkins and sets up an HTTP server on port 8080.
    Provides error handling to ensure smooth execution.

Usage Instructions
1. Prerequisites

    Supported Operating Systems:
        Ubuntu/Debian
        CentOS/RHEL
        macOS

    Required Software:
        wget or a similar downloading utility.
        Sudo privileges for the user executing the script.

2. Script Arguments

The script requires two arguments:

    Jenkins Version: The desired Jenkins version to install (e.g., 2.361.1).
    OS Type: Your operating system type (ubuntu, centos, or macos).

3. How to Run the Script

    Clone or download the script to your local machine.
    Make the script executable:

chmod +x <script_name>.sh

Run the script with the required arguments:

./<script_name>.sh <Jenkins_Version> <OS_Type>

Example:

    ./jenkins_install.sh 2.361.1 ubuntu

4. Steps Performed by the Script

    Input Validation:
    Ensures the user provides the required Jenkins version and OS type as arguments.

    Java Check:
        Verifies if Java is installed.
        Installs OpenJDK 11 if Java is not found.

    Jenkins WAR File Download:
        Downloads the specified Jenkins version from the Jenkins official repository.
        Saves the file to /usr/local/bin/jenkins.war.

    Jenkins Start-Up:
        Launches Jenkins using the WAR file.
        Opens Jenkins on port 8080.

5. Output

    Jenkins will be accessible at http://localhost:8080.
    The initial admin password can be retrieved from the Jenkins log output or found in the system at /var/lib/jenkins/secrets/initialAdminPassword.

Error Handling

The script includes robust error handling mechanisms:

    Missing Arguments:
    Prompts the user to provide the required arguments.
    Unsupported OS Types:
    Displays a message if an unsupported OS type is entered.
    Java Installation Failure:
    Notifies the user if Java installation fails.
    Jenkins Download Failure:
    Informs the user of any issues during the Jenkins WAR file download.
    Jenkins Startup Issues:
    Displays an error message if Jenkins fails to start.
