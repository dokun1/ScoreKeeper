#!/bin/sh

set -eo pipefail

xcodebuild -archivePath ./ScoreKeeper.xcarchive \
           -exportOptionsPlist ./ExportOptions.plist \
           -exportPath ./ScoreKeeperProducts \
           -allowProvisioningUpdates \
           -exportArchive
