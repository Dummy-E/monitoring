#!/bin/bash

# Define directories and filenames
BACKUP_DIR="/root/.backups"
DB_FILE="/root/.auth/db.sqlite3"
EXCEL_FILE="/root/.data/bookingStripe.xlsx"
DATE=$(date +"%Y%m%d")

# Ensure the backup directory exists
mkdir -p "$BACKUP_DIR"

# Backup SQLite database
sqlite3 "$DB_FILE" ".backup '$BACKUP_DIR/db.sqlite3_$DATE'"

# Backup Excel file
cp "$EXCEL_FILE" "$BACKUP_DIR/bookingStripe_$DATE.xlsx"

# Optional: Delete old backups older than 30 days
find "$BACKUP_DIR" -type f -mtime +30 -delete

echo "Backup completed on $(date)"
