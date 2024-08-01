# Welcome to Global Mobility's Ansible Project

We are on the road to infrastructure automation! This is still a work in progress.

We now have working scripts for:

[JHS HCloud Migration](roles/code-deployment/README.md)

[CQM Deployment](roles/deploy_cqm_web/README.md)

### NOTE: Ansible is using 'rsync'. This need to install via 'yum'.
yum install rsync -y

### ANSIBLE COMMAND STRUCTURE:
Running a Playbook
  
    ```bash
    python ansible-playbook \<playbookname\> # Specifies playbook to run 
    ``` 
Passing Inline Variables

    ```bash
    --extra-vars "somevar=value" # Passes additional variables. used to override defaults 
    ```
Passing Variables in Files

    ```bash
    --extra-vars="@deployment_vars/jmc/dev.yml" # Option for specifying variables in files for long list of variables. Good for variable grouping  
    ```


### Installation of Middlewares

**N.B Check the role readme for more specifics on role installation.**
<br>
<br>

The Setups in Broken Down into 4 Parts.

**Part 1:** Step 1 to 2  
Setting up tools needed to run the playbooks such as portable ansible, group development tools, users 

**Part 2:** Step 3 to 7  
Compilation / Deployment stage. These roles can either compile or deploy the middlewares that will be used on the server. variables are used to specify tasks to be carried out by the playbook.  

**Part 3:** Step 8 to 10.   
Contains the roles needed for the initial HMS deployment and Updates. The HMS deploy is used for the initial deployment of the Hms web setup. This creates the virtual hosts, setups the certificates. while the code-deployment role is used for subsequent deployments, like updating the deployed code or deploying new code versions.
<br>
<br>
<br>

### Step 1. Enable Portable Ansible  
###
A) On Internet Enabled Systems.  
The first step is to download portable ansible which allows us to run the ansible playbooks on the virtual machine we would be setting up. The Repo includes a make target which downloads and creates the portable ansible symlink.
    
    make setup

The make target does the following- 

1) Downloads the Portable Ansible Compressed File  

    ```bash
    wget https://github.com/ownport/portable-ansible/releases/download/v0.4.2/portable-ansible-v0.4.2-py2.tar.bz2 -O ansible.tar.bz2
    ```

2) Extract the Portable Ansible Compressed File

    ```
	tar -xjf ansible.tar.bz2
    ```

3) Create a Symlink to ansible-playbook as the ansible command uses ansible-playbook to run commands  
    
    ```
    ln -s ansible-playbook ansible
    ```

B) Systems without access to internet  
1) Download the Portable Ansible ZIp on a System with Internet Access.  
2) Copy the Zip file to intended system  
3) Run Steps 2 and 3  
<br>
<br>

### Step 2. Setup Users and Limits  
The initialize Playbook is the first playbook that is run. The initial_vm.yml playbook runs the deploy-setup role.

    ```bash
    make initialize

        or

    python ansible-playbook initialize_vm.yml --extra-vars "enable_sudo=true download_online_dependencies=true code_user=hmsops"
    ```

The Role performs the following actions.

1) Creates a group named after the user in the "code_user" variable if the group does not exist
2) Creates the user in the "code_user" variable if user does not exist. The default code_user is "hmsops". This can be changed by changing the "code_user" variable in the command
3) Adding the Code_user to Sudoers group. This is an optional task and can be turned off by changing the enable_sudo variable to false.
4) Create Config Files, Limits and Library Config
5) Downloads the Group development tools and Epel release. This task is dependent on vm having internet access and can be turned off by using the variable "download_online_dependencies=false".
<br>
<br>

  
### Step 3. Install Curl and PCRE3.
This is needed for thee apache and php compilation stage. The playbook calls the ansible-source-prelim role which installs pcre and curl.

    ```bash
    make install_curl_prce

        or
	
    python ansible-playbook pcre_curl_install.yml --extra-vars "install_pcre=true install_curl=true code_user=hmsops"
    ```

The installed binaries are used for installing apache and php. to toogle, change `install_pcre=false` or `install_curl=false`.  
<br>
<br>

### Step 4: Install Apache
The install_apache.yml playbook calls the "`ansible-apache`" role which installs the apache middleware. 

The playbook allows the users to deploy apache from existing middleware file using the "`deploy_from_zip`" option. This requires that a precompiled middleware exists in the "`ansible/downloads`" folder and the variable. 
The default variables for deploy_from_zip expects a file "`export_gml_source_httpd-2.4.46.tar.gz`".
The File can be changed by using the variable 

    gml_source_httpd_file: "export_gml_source_httpd-<version>.tar.gz"
    httpd_version_number: "<version>"

The "install_from_source" variable allows the playbook to compile a new apache version. This however requires internet connection to download the source files to be compiled. The compiled apache version can be changed using the variable:

    httpd_version_number: "<version>"

The 2 variables can be used together to compile and deploy in one run.

deploy from zip:

    make install_apache
            
    or

    python ansible-playbook install_apache.yml --extra-vars="deploy_from_zip=true code_user=hmsops"

install_from_source:

    python ansible-playbook install_apache.yml --extra-vars="install_from_source=true code_user=hmsops"

install and deploy:

    python ansible-playbook install_apache.yml --extra-vars="install_from_source=true deploy_from_zip=true"
        
The default version installed is `2.4.46 `

The output of the playbook is the zip file "`ansible/downloads/export_gml_source_2.4.46.tar.gz`"

### Step 5. Install Pgbouncer
The install_pgbouncer.yml playbook calles the "ansible-pgbouncer" role which installs pgbouncer.
    
The playbook also uses the `deploy_from_zip` variable to deploy from an existing middleware file or use the `install_from_source` variable to compile the middleware.  
The default variables for deploy_from_zip expects a file "`export_gml_source_pgbouncer_1_12_0.tar.gz`" in the downloads folder.  
The File can be changed by using the variable  

    gml_source_pgbouncer_file: export_gml_source_pgbouncer_<version>.tar.gz"
    pgbouncer_source_version: "<version>"

The compiled pgbouncer version can be changed using the variable:

    pgbouncer_source_version: "<version>"

Deployment commands

deploy from zip:

    make install_pgbouncer
        
        or 

    python ansible-playbook install_pgbouncer.yml --extra-vars="deploy_from_zip=true code_user=hmsops"
    
install_from_source:

    python ansible-playbook install_pgbouncer.yml --extra-vars="install_from_source=true code_user=hmsops"

install and deploy:

    python ansible-playbook install_pgbouncer.yml --extra-vars="install_from_source=true deploy_from_zip=true"

The default installed pgbouncer version is `1.12.0`. The output of the playbook is the zip file "`export_gml_source_pgbouncer_1_12_0.tar.gz`"
  
## 
### Step 6. Install Postgres
The install_db.yml calls the ansible-postgresql role which installs postgresql. This role is a dependency for the php installation which requires the postgres binary. 

        make install_postgres

        or

        python ansible-playbook install_db.yml

The postgres version 12 is installed and the playbook output is "ansible/downloads/export_gml_source_psql_12.tar.gz"

### Step 7. Install PHP  

This calls the ansible-php role. The playbook allows the users to deploy php from existing middleware file using the "deploy_from_zip" option. This requires that a precompile middleware exists in the "`ansible/downloads`" folder and the variable.
The default variables for `deploy_from_zip` expects a file "`export_gml_source_php-7.4.21.tar.gz`".
The File can be changed by using the variable 

    gml_source_php_file: "export_gml_source_php-<version>.tar.gz"
    php_version_number: "<version>"

The "`php_install_from_source`" variable allows the playbook to compile a new middleware using the middlewares installed in step 3 to 6.. This however requires internet connection to download the source files to be compiled. The compiled php version can be changed using the variable:

    php_version_number: "<version>"

The 2 variables can be used together to compile and deploy in one run.

deploy:

    make install_php
            
        or

    python ansible-playbook install_php.yml --extra-vars="deploy_from_zip=true code_user=hmsops"

install_from_source:

    python ansible-playbook install_php.yml --extra-vars="php_install_from_source=true code_user=hmsops"

install and deploy:

    python ansible-playbook install_php.yml --extra-vars="php_install_from_source=true deploy_from_zip=true code_user=hmsops"


Memcached is a dependency of the php installation process and can be enabled using "`enable_memcached: true`".  

To enable memcached during the offline deployment, the memcached and libmemcached source files have to be placed in the downloads directory in the form of

    - memcached-3.1.5.tar.gz
    - libmemcached-1.0.18.tar.gz

The playbook should also be passed the version_number of memcached and libmemcached with the following variables

    - memcached_source_version: "memcached-3.1.5" 
    - libmemcached_source_version: "libmemcached-1.0.18"

The Option of having the playbook download memcached can also be used by setting the memcached version and setting the "download_memcached_online" variable to true.

Note the default value of download_memcached_online is false, and the memcached task will fail if the 2 memcached source files are not found in the downloads directory.

For the Compile phase, The playbook uses the following default variables

    - curl_version: curl-7.29.0
    - pcre_version: pcre-8.43
    - httpd_version_number: "2.4.48"
    - php_source_pgsql_path: "/export/home/gml_source/postgres/12-gml"

The default php version is controlled using

    - php_version_number: "7.4.21"

to change any of the variables, add the intended change as an extra var.  

The `php_install_from_source` option generates "`ansible/downloads/export_gml_source_php-7.4.9.tar.gz`" file which can be used for other installations.


### Step 8. Initial HMS Deployment
The hms_deploy is used to deploy and setup the environment needed for the specified hospital.
It takes in environment variables such as hospital (jmc, jch), deployment environment (dev, sit)

    make deploy_hms_jmcdev

    or
	
    python ansible-playbook -v hms_deploy.yml --extra-vars="@deployment_vars/jhs.yml" --extra-vars="@deployment_vars/jmc/jmc_dev.yml" --extra-vars="code_deploy=true code_user=hmsops"

The hms-deploy role is used for the initial hms deployment. It performs the following actions.
1) Runs the Code Deployment task which calls the code-deploy Role to deploy Application Code
2) Creates a Virtual host file for the environment being deployed
3) Include Virtualhosts in apache config
4) Deploys SSL Certificates
5) Deploys Log browser
6) Opens up firewall for HMS application ports
7) Deploys php-Info page
<br>
<br>  

Variables are grouped into the deployment_vars directory.
- `jhs.yml` contains variables that overlap in the hospital environment 
- `jmc/{dev,sit}.yml` contains environment specific variables e.g. dev environment, sit environment for jmc
- `defaults/main.yml` default playbook directories

Notable variables that can change: 

    httpd_version_number: "2.4.46"
    php_version_number: "7.4.21"

Note: The Code-deployment task uses the code-deployment role variables which will be explained in the next step
At the end of the role, The following should be in place
1) Login on the Deployed HMS WebSite
2) Log Browsing Page found on port 8080/jhs-logs
3) A phpinfo.php page in root folder
<br>
<br> 

### Step 9. Code Deployment
The code deployment tasks is used to deploy hms code to existing environment. This can be used to download code from git, deploy code types and rollback to a code_version.
The 3 main variables for the role are

- git_dl: Downloads Code from Git and compresses it to a folder that can be used by the deploy task or transferrred to another server for deployment
- code_deploy: Deploys Application code from a source folder. It requires that compress code file is present on the server before deployment. Defaults to true
- rollback: Used to rollback to previous deployment
The variables should be set to true to activate it

    make code_deploy_jmcdev
    
    or

	python ansible-playbook -v code_deploy.yml --extra-vars="@deployment_vars/jhs.yml" --extra-vars="@deployment_vars/jmc/jmc_dev.yml" --extra-vars="code_deploy=true code_user=hmsops"

Other Noteable Variables

- git_repo: repo url to download codes
- code_source: Location of Download compressed code for deployment
- code_type: List containing Type of code to be deployed. E.g ['hms_htdocs','onramp_web','config','libraries']
- code_version: Git_tag/ or branch to be deployed

