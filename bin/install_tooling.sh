#!/bin/bash
if ! which swiftlint > /dev/null; then
  echo "installing swiftlint..."
  brew install swiftlint
else
  echo "swift lint installed"
fi

if ! which swiftformat > /dev/null; then
  echo "installing swiftformat..."
  brew install swiftformat
else
  echo "swiftformat installed"
fi