#!/bin/bash

DIR=$1
shift
EXTENSIONS=${@:-".tmp"}

if [ -z "$DIR" ]; then
  echo "Eroare: Nu ați specificat directorul!"
  exit 1
fi

if [ ! -d "$DIR" ]; then
  echo "Eroare: Directorul nu există!"
  exit 1
fi

COUNT=0
for EXT in $EXTENSIONS; do
  FILES=$(find "$DIR" -type f -name "*$EXT")
  for FILE in $FILES; do
    rm -f "$FILE"
    COUNT=$((COUNT+1))
  done
done

echo "Au fost șterse $COUNT fișiere din $DIR"
