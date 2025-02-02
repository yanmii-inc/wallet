#!/bin/bash

flavor="dev"

while getopts f: flag
do
    case "${flag}" in
        f) flavor=${OPTARG};;
    esac
done

apiUrl=https://yanmii-wallet-dev.web.app/

capitalizedFlavor=$(echo "$flavor" | tr '[:lower:]' '[:upper:]')


output="../build/ios_integ"
product="build/ios_integ/Build/Products"
flavor_target="16.4"

# Pass --simulator if building for the simulator.
flutter build ios integration_test/login_e2e_test.dart --flavor=$flavor --dart-define=ENV=$capitalizedFlavor --dart-define=API_URL=$apiUrl --release

pushd ios
xcodebuild build-for-testing \
  -workspace Runner.xcworkspace \
  -scheme ${flavor}Test \
  -xcconfig Flutter/Release.xcconfig \
  -configuration Release-$flavor \
  -derivedDataPath \
  $output -sdk iphoneos
popd

pushd $product
zip -r "ios_tests.zip" "Release-$flavor-iphoneos" "${flavor}Test_iphoneos$flavor_target-arm64.xctestrun"
popd