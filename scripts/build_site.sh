#!/usr/bin/env bash
# Bygger GitHub Pages-nettstedet med MkDocs.
# Kopierer README.md (-> index.md) og Salmar_2026/ inn i _docs/, og bygger til _site/.
# Bruk: scripts/build_site.sh [ekstra mkdocs-argumenter], f.eks. "serve" for lokal forhåndsvisning.
set -euo pipefail
cd "$(dirname "$0")/.."

rm -rf _docs _site
mkdir -p _docs
cp README.md _docs/index.md
cp -R Salmar_2026 _docs/Salmar_2026

if [[ "${1:-}" == "serve" ]]; then
  shift
  exec mkdocs serve "$@"
fi
mkdocs build "$@"
