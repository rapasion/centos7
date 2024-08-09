# Timers Role

This role will deploy the timer service which includes the logrotate and daily backup services

## Usage

To use the timer role, you can just add the role onto your main playbook.

    ```bash
      roles:
        - timers
    ```

Sample usage:

    ```bash
        python ansible-playbook -v timer.yml
    ```

Sample usage with specific variables:

    ```bash
        python ansible-playbook -v timer.yml --extra-vars "code_user=hmsops hospital=ntfgh server=app"
    ```

## Understanding Variables

The main variables to focus on are the following
    ```bash
    server: web
    hospital: jmc
    ```

## Logrotate Service

The daily lograte service will run every 23:55 and will include the following logs to logrotate:
    ```bash
    php-fpm
    httpd
    mysql
    laravel
    pgbouncer
    ```

## Backup Service

The daily backup will run every 21:30 and will have specific backups depending on the server type specified. This can be changed directly on the timer script as needed.


## Hospital

You can just specify which hospital the playbook is going to be used on.

### Server Types

The folowing server types are configured on this playbook: web, db, app, hl7_web, hl7_db
Each server types have their own variables to use for the backup service

### Server-specific Variables

All server types will include the following variables

    ```bash
                        <server_type>_backup_dir:    -> Directory where the backup files are to be stored
                        <server_type>_backup_script: -> Filename of the backup script to be used
                        <server_type>_backup_file:   -> Filename of the backup file to be created
    ```

DB Servers will include the following variables

    ```bash
                        <server_type>_backup_dir:    -> Directory where the backup files are to be stored
                        <server_type>_backup_script: -> Filename of the backup script to be used
                        <server_type>_backup_file:   -> Filename of the backup file to be created
    ```
Web Servers will include the following variables

    ```bash
                        <server_type>_code_backup_dir:    -> Directory where the backup files are to be stored
                        <server_type>_exclude_script: -> Filename of the exclude to be used
                        <server_type>_onramp_dir:   -> Directory of Web Codes
                        <server_type>_htdocs_dir:   -> Directory of System Codes
    ```
