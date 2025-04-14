#!/bin/bash

BACKUP_SOURCE_DIRS=("$HOME/Documents" "$HOME/Desktop") 
BACKUP_TARGET_DIR="$HOME/Backups"                       
LOG_FILE="$HOME/system_cleanup.log"                     
DATE=$(date +"%Y-%m-%d_%H-%M-%S")
ARCHIVE_NAME="backup_$DATE.tar.gz"

mkdir -p "$BACKUP_TARGET_DIR"

log() {
    echo "[$(date +"%Y-%m-%d %H:%M:%S")] $1" | tee -a "$LOG_FILE"
}

log "=== Старт скрипта ==="

log "Очистка /tmp..."
sudo rm -rf /tmp/* && log "/tmp очищен"

log "Очистка ~/.cache..."
rm -rf ~/.cache/* && log "~/.cache очищен"

log "Архивирование директорий: ${BACKUP_SOURCE_DIRS[*]}"
tar -czf "$BACKUP_TARGET_DIR/$ARCHIVE_NAME" "${BACKUP_SOURCE_DIRS[@]}"
log "Резервная копия сохранена: $BACKUP_TARGET_DIR/$ARCHIVE_NAME"
log "Свободное место на диске:"
df -h "$BACKUP_TARGET_DIR" | tee -a "$LOG_FILE"

log "=== Завершено ==="
