#!/bin/bash
set -eu

name="$1"

# Reinit git
rm -rf .git
git init

# Replace placeholder name with real name
for file in **/*.*
do
  echo "Replacing seed-element with ${name} in ${file}"
  sed -i '' "s/seed-element/${name}/g" "$file"
done

# Rename files
mv seed-element.html "${name}.html"

# Install dependencies
bower install
