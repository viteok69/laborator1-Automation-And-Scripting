#!/bin/bash

DIR=$1
MAX_MB=$2
THRESHOLD=${3:-80}
LOG_FILE="disk_usage.log"
EMAIL="utilizator@example.com"

if [ -z "$DIR" ] || [ -z "$MAX_MB" ]; then
  echo "Utilizare: $0 <director> <max_MB> [prag%]"
  exit 1
fi

if [ ! -d "$DIR" ]; then
  echo "Eroare: Directorul nu există!"
  exit 1
fi

# Calculează spațiul utilizat în MB
USAGE_MB=$(du -sm "$DIR" | awk '{print $1}')
USAGE_PERCENT=$((USAGE_MB * 100 / MAX_MB))

echo "Utilizare: $USAGE_PERCENT% din $MAX_MB MB" >> "$LOG_FILE"

if [ "$USAGE_PERCENT" -ge "$THRESHOLD" ]; then
  echo "Avertizare: Directorul $DIR a depășit pragul de $THRESHOLD% ($USAGE_PERCENT%)" \
  | mail -s "Avertizare spațiu disc" "$EMAIL"
fi
