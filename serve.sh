#!/usr/bin/env bash
# Local preview.
# Ruby 4.0's bundled WEBrick returns empty responses on this machine, so we
# build with Jekyll (watching for changes) and serve the static _site folder
# with Python's http.server, which is reliable.
#
# Usage:  ./serve.sh   then open http://127.0.0.1:8080/  (refresh after edits)
set -euo pipefail

export PATH="/opt/homebrew/opt/ruby/bin:/opt/homebrew/lib/ruby/gems/4.0.0/bin:$PATH"
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export JEKYLL_ENV=development

cd "$(dirname "$0")"

echo "Building site (first build can take ~10s)..."
bundle exec jekyll build

echo "Starting file watcher (rebuilds _site on change)..."
bundle exec jekyll build --watch --quiet &
WATCH_PID=$!
trap 'kill $WATCH_PID 2>/dev/null || true' EXIT

echo "Serving at http://127.0.0.1:8080/  (Ctrl-C to stop; refresh browser after edits)"
cd _site
exec python3 -m http.server 8080 --bind 127.0.0.1
