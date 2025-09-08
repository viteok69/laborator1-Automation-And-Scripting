#!/bin/bash

SRC_DIR=$1
DEST_DIR=${2:-/backup}
DATE=$(date +%Y-%m-%d)
ARCHIVE_NAME="backup_$DATE.tar.gz"

if [ -z "$SRC_DIR" ]; then
  echo "Eroare: Nu ați specificat directorul sursă!"
  exit 1
fi

if [ ! -d "$SRC_DIR" ]; then
  echo "Eroare: Directorul sursă nu există!"
  exit 1
fi

if [ ! -d "$DEST_DIR" ]; then
  echo "Directorul destinație nu există. Îl creez..."
  mkdir -p "$DEST_DIR"
fi

tar -czf "$DEST_DIR/$ARCHIVE_NAME" -C "$SRC_DIR" .
echo "Backup realizat cu succes: $DEST_DIR/$ARCHIVE_NAME"

