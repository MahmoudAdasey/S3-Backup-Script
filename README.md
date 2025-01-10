# S3-Backup-Script
A Bash script designed to automate the process of creating compressed backups of a directory and uploading them to an AWS S3 bucket. The script includes built-in error handling, logging, and ensures compliance with risk management best practices by verifying AWS CLI installation and avoiding file overwrites.

## Overview
This repository contains a Bash script designed for creating backups of a specified directory and uploading the backup file to an AWS S3 bucket. The script ensures that the AWS CLI is installed and operational, performs the backup, logs the process, and uploads the file to S3.

## Script Details
### Script Name
`backup_script.sh`

### Functionality
1. Creates a compressed backup of the specified directory.
2. Logs the backup and upload operations to a logfile.
3. Uploads the backup file to a specified S3 bucket.

## Prerequisites
1. **AWS CLI**:
   - Ensure that the AWS CLI is installed and configured with the necessary credentials.
   - You can install AWS CLI by following [AWS CLI Installation Guide](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html).
2. **Directories**:
   - The script expects the following directories:
     - `Backup_file`: `/home/ubuntu/bash`
     - `Destination`: `/home/ubuntu/backup`
   - Make sure these directories exist and have the necessary read/write permissions.
3. **S3 Bucket**:
   - A valid S3 bucket should exist. The bucket name used in the script is `s3-bash-mahmoud-adasey`.

## Script Variables
- `Time`: The timestamp used to create unique backup filenames.
- `Backup_file`: Directory to be backed up (`/home/ubuntu/bash`).
- `Dest`: Directory where the backup file will be saved locally (`/home/ubuntu/backup`).
- `Filename`: Name of the backup file (e.g., `file-backup-<timestamp>.tar.gz`).
- `LOG_FILE`: Log file to store operation logs (`/home/ubuntu/backup/logfile.log`).
- `S3_BUCKET`: S3 bucket name for uploads (`s3-bash-mahmoud-adasey`).
- `FILE_TO_UPLOAD`: Full path of the file to be uploaded to the S3 bucket.

## Usage
1. Clone this repository to your local machine.
2. Ensure the script is executable by running:
   ```bash
   chmod +x backup_script.sh
   ```
3. Run the script:
   ```bash
   ./backup_script.sh
   ```

## Logging
- All operations are logged in `/home/ubuntu/backup/logfile.log`.
- In case of any issues, refer to this logfile for debugging.

## Error Handling
- If AWS CLI is not installed, the script will exit with an error message.
- If a backup file with the same name already exists, the script will log an error and stop the backup process.
- If the upload to S3 fails, the script will notify the user.

## Sample Output
### Successful Backup and Upload
```
Backup Completed successfully. Backup file: /home/ubuntu/backup/file-backup-<timestamp>.tar.gz
File Uploaded successfully to the S3 bucket: s3-bash-mahmoud-adasey
```

### Errors
- If AWS CLI is not installed:
  ```
  AWS CLI IS NOT INSTALLED, please install it first.
  ```
- If a file already exists:
  ```
  Error file file-backup-<timestamp>.tar.gz already exists!
  ```
- If upload fails:
  ```
  File Upload to S3 failed
  ```

## License
This project is licensed under the MIT License. See the LICENSE file for details.

