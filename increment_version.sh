#!/bin/bash

   file="pubspec.yaml"
   version=$(cat $file | grep "version:")
   build=$(( ${version##*.} + 1 ))
   newVersion="${version%.*}.$build"
   sed -Ia "s/$version/$newVersion/g" "$file"

  echo "build new version $newVersion"


