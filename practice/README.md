## dwnld_nexus_lates_artifact.sh

This script downloads the latest artifact from the given nexus repository and runs it.
If no information was returned from Nexus REST API it exists with an error.

### Usage
Before using the script you need to export enviromental variables about Nexus.

The Nexus user:
```console
$ export USER_NEXUS={user}
```
The password to Nexus user:
```console
$ export USER_NEXUS_PSSWD={password} 
```
The IP of Nexus Repository Manager and it's port:
```console
$ export NEXUS_IP_PORT={nexus_ip:nexus_port} 
```
The name of the Nexus repository to pull from:
```console
$ export NEXUS_REPO={nexus_repo_name} 
```

Then run:
```console
$ ./dwnld_nexus_lates_artifact.sh
```

## install_java.sh

This script checks if java is present on the system. If not it will install the lates version of java

### Usage

```console
$ ./install_java.sh
```

## node_app.sh

This script downloads an example node application. Installs nodejs, npm, curl, wget and net-tools. Displays node and npm versions. Unpacks the application. Asks for a absolute path for a dir to contain logs for application. Launches the app and checks if everything went well.

### Usage

```console
$ ./node_app.sh
``` 
## user_processes.sh

This script displays the processes for the current user. It can be sorted by memory or cpu utilization. If no input is provided, shows the unsorted user processes.

### Usage

```console
$ ./user_processes.sh
```

