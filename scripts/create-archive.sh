#!/bin/sh

set -eo pipefail

xcodebuild -project ScoreKeeper.xcodeproj \
           -scheme "ScoreKeeper" \
           -sdk iphoneos \
           -archivePath ./ScoreKeeper.xcarchive \
           -configuration "ScoreKeeper" \
           clean archive
