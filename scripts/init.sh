#!/bin/bash
set -eu

name="$1"

echo "Re-initialising git repo"
rm -rf .git
git init

echo "Replacing seed-element with ${name}"
for file in **/*.* *.*
do
  echo "Processing ${file}"
  sed -i '' "s/seed-element/${name}/g" "$file"
done

echo "Renaming seed-element.html to ${name}.html"
mv seed-element.html "${name}.html"

echo "Install bower dependencies"
bower install
