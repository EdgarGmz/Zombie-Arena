#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

status=0
count=0

while IFS= read -r -d '' file; do
    count=$((count + 1))

    if grep -nE '[[:space:]]+$' "$file" >/dev/null; then
        echo "[TRAILING_WS] $file"
        grep -nE '[[:space:]]+$' "$file" || true
        status=1
    fi

    if grep -n $'\r' "$file" >/dev/null; then
        echo "[CRLF] $file"
        grep -n $'\r' "$file" || true
        status=1
    fi

    if grep -nE '^[ ]+' "$file" >/dev/null; then
        echo "[LEADING_SPACES] $file"
        grep -nE '^[ ]+' "$file" || true
        status=1
    fi
done < <(find . -type d \( -name .git -o -name Build \) -prune -o -type f -name '*.gml' -print0)

if [[ "$count" -eq 0 ]]; then
    echo "No se encontraron archivos .gml para revisar."
    exit 0
fi

if [[ "$status" -eq 0 ]]; then
    echo "OK: estilo GML validado en $count archivos."
else
    echo "Fallo: se detectaron problemas de estilo GML."
fi

exit "$status"
