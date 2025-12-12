#!/bin/bash

# Hugo Theme Switcher
# Usage: ./switch-theme.sh [congo|papermod]

THEME=${1:-""}

if [ -z "$THEME" ]; then
    echo "Usage: ./switch-theme.sh [congo|papermod]"
    echo ""
    echo "Available themes:"
    echo "  congo    - Elegant Tailwind-based theme"
    echo "  papermod - Clean & minimal theme (most popular)"
    echo ""
    echo "Current config.yaml theme:"
    grep "^theme:" config.yaml 2>/dev/null || echo "  (not set)"
    exit 0
fi

case $THEME in
    congo)
        cp config.congo.yaml config.yaml
        echo "Switched to Congo theme"
        ;;
    papermod)
        cp config.papermod.yaml config.yaml
        echo "Switched to PaperMod theme"
        ;;
    *)
        echo "Unknown theme: $THEME"
        echo "Use 'congo' or 'papermod'"
        exit 1
        ;;
esac

echo "Testing build..."
hugo --minify

echo ""
echo "To preview: hugo server -D"
echo "To deploy:  git add . && git commit -m 'Switch to $THEME theme' && git push"
