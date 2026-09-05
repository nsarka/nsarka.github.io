#!/usr/bin/env bash
set -euo pipefail
cd "$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"

build_only=false
if [[ "${1:-}" == "--build-only" ]]; then
  build_only=true
  shift
fi
if [[ $# -gt 1 ]]; then
  echo 'Usage: ./publish.sh [--build-only] [commit message]' >&2
  exit 1
fi
if [[ "$build_only" == false && "$(git branch --show-current)" != master ]]; then
  echo 'Publish from master. Use --build-only to build on another branch.' >&2
  exit 1
fi

# A failed build leaves the previously generated site intact.
build_dir=$(mktemp -d "${TMPDIR:-/tmp}/nsarka-publish.XXXXXX")
trap 'rm -rf -- "$build_dir"' EXIT
hugo --source "$PWD/nsarka" --destination "$build_dir" --minify
test -s "$build_dir/index.html"
printf 'nsarka.com\n' > "$build_dir/CNAME"
touch "$build_dir/.nojekyll"
mkdir -p docs
rsync -a --delete "$build_dir/" docs/

if [[ "$build_only" == true ]]; then
  echo 'Built site in docs/ (nothing committed or pushed).'
  exit 0
fi

# Keep source changes and generated files together.
git add -A
if ! git diff --cached --quiet; then
  git commit -m "${1:-Publish site}"
fi
git push origin master
echo 'Pushed master. GitHub Pages will publish docs/.'
