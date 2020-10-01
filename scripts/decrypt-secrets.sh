#!/bin/sh

set -eo pipefail

ENCRYPTION_KEY=${1}
GH_ACCESS_TOKEN=${2}

echo "========================================"
echo "Cloning repo with profiles and certs..."

git clone https://dokun1:${GH_ACCESS_TOKEN}@github.com/dokun1/ScoreKeeperCreds.git

echo "========================================"
echo "Decrypting certs and profiles..."

gpg --quiet --batch --yes --decrypt --passphrase="${ENCRYPTION_KEY}" --output ./ScoreKeeperCreds/Profiles/Development/ScoreKeeperDevelopmentProfile.mobileprovision ./ScoreKeeperCreds/Profiles/Development/ScoreKeeperDevelopmentProfile.mobileprovision.gpg
gpg --quiet --batch --yes --decrypt --passphrase="${ENCRYPTION_KEY}" --output ./ScoreKeeperCreds/Profiles/Distribution/AdHocProfileScoreKeeper.mobileprovision ./ScoreKeeperCreds/Profiles/Distribution/AdHocProfileScoreKeeper.mobileprovision.gpg
gpg --quiet --batch --yes --decrypt --passphrase="${ENCRYPTION_KEY}" --output ./ScoreKeeperCreds/Profiles/Distribution/ScoreKeeperAppStoreProfile.mobileprovision ./ScoreKeeperCreds/Profiles/Distribution/ScoreKeeperAppStoreProfile.mobileprovision.gpg
gpg --quiet --batch --yes --decrypt --passphrase="${ENCRYPTION_KEY}" --output ./ScoreKeeperCreds/Certs/Distribution/Certificate.p12 ./ScoreKeeperCreds/Certs/Distribution/Certificate.p12.gpg

echo "========================================"
echo "Making Provisioning Profiles directory..."

mkdir -p ~/Library/MobileDevice/Provisioning\ Profiles

echo "========================================"
echo "Copying provisioning profile..."

cp ./ScoreKeeperCreds/Profiles/Development/ScoreKeeperDevelopmentProfile.mobileprovision ~/Library/MobileDevice/Provisioning\ Profiles/ScoreKeeperDevelopmentProfile.mobileprovision
cp ./ScoreKeeperCreds/Profiles/Distribution/AdHocProfileScoreKeeper.mobileprovision ~/Library/MobileDevice/Provisioning\ Profiles/AdHocProfileScoreKeeper.mobileprovision
cp ./ScoreKeeperCreds/Profiles/Distribution/ScoreKeeperAppStoreProfile.mobileprovision ~/Library/MobileDevice/Provisioning\ Profiles/ScoreKeeperAppStoreProfile.mobileprovision

echo "========================================"
echo "Creating keychain..."

security create-keychain -p "" build.keychain

echo "========================================"
echo "Importing certs into keychain..."

security import ./ScoreKeeperCreds/Certs/Distribution/Certificate.p12 -t agg -k ~/Library/Keychains/build.keychain -P ${ENCRYPTION_KEY} -A

echo "========================================"
echo "Unlocking main keychain..."

security list-keychains -s ~/Library/Keychains/build.keychain
security default-keychain -s ~/Library/Keychains/build.keychain
security unlock-keychain -p "" ~/Library/Keychains/build.keychain

echo "========================================"
echo "Setting key partition..."

security set-key-partition-list -S apple-tool:,apple: -s -k "" ~/Library/Keychains/build.keychain

echo "========================================"
echo "Available Certificates:"

security find-identity -p codesigning -v

echo "========================================"
echo "Available Provisioning Profiles:"

ls ~/Library/MobileDevice/Provisioning\ Profiles/
