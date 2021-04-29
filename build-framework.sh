#!/usr/bin/env bash

## Variables
BUILD_CONFIGURATION="Release"

function build_sdk_framework() {
  echo "➡️  Start build STIPOP Framework. 🤘🤘🤘"

  until carthage update --platform ios --no-build; do
    sleep 5
  done

  echo "BUILD_LIBRARIES_FOR_DISTRIBUTION = YES" >>"${xcconfig}"

  carthage build --configuration "$BUILD_CONFIGURATION" --cache-builds --no-skip-current --platform iOS --use-xcframeworks

  echo "➡️  Build STIPOP Framework Completed!!!"
}

function main() {
  build_sdk_framework
}

main
