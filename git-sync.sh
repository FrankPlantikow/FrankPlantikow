#!/bin/bash

# ==========================================
# Git Sync - aktuelles Verzeichnis
# ==========================================

set -e

# Prüfen, ob wir in einem Git-Repository sind
if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    echo "❌ Dieses Verzeichnis ist kein Git-Repository."
    exit 1
fi

# Repository-Verzeichnis ermitteln
REPO_DIR=$(git rev-parse --show-toplevel)

echo "=========================================="
echo " Git Synchronisation"
echo "=========================================="
echo "Repository: $REPO_DIR"
echo

cd "$REPO_DIR"

# Aktuellen Branch ermitteln
BRANCH=$(git branch --show-current)

if [ -z "$BRANCH" ]; then
    echo "❌ Kein aktiver Branch gefunden."
    exit 1
fi

echo "Branch: $BRANCH"
echo

# Status anzeigen
echo "📋 Aktueller Status:"
git status --short
echo

# Änderungen hinzufügen
echo "➕ Änderungen werden hinzugefügt..."
git add .

# Prüfen, ob Änderungen vorhanden sind
if git diff --cached --quiet; then
    echo "ℹ️ Keine lokalen Änderungen zum Committen."
else
    echo "💾 Änderungen committen..."
    
    MESSAGE="Automatischer Sync $(date '+%Y-%m-%d %H:%M:%S')"
    
    git commit -m "$MESSAGE"
fi

# Remote-Änderungen holen
echo
echo "⬇️ Änderungen vom Remote-Repository holen..."
git pull --rebase origin "$BRANCH"

# Lokale Änderungen hochladen
echo
echo "⬆️ Änderungen zu GitHub/GitLab hochladen..."
git push origin "$BRANCH"

echo
echo "=========================================="
echo "✅ Synchronisation abgeschlossen"
echo "=========================================="
