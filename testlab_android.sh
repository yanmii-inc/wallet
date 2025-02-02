#!/bin/bash

flavor="dev"

while getopts f: flag
do
    case "${flag}" in
        f) flavor=${OPTARG};;
    esac
done

apiUrl=https://yanmii-wallet-dev.web.app/


camelCaseFlavor=$(echo "$flavor" | awk '{print toupper(substr($0, 1, 1)) tolower(substr($0, 2))}')
capitalizedFlavor=$(echo "$flavor" | tr '[:lower:]' '[:upper:]')

apiUrlParam="API_URL=https://yanmii-wallet-dev.web.app/"

base64EnvParam=$(echo -n "ENV=$capitalizedFlavor" | base64)
base64ApiUrlParam=$(echo -n $apiUrlParam | base64)


pushd android
# flutter build generates files in android/ for building the app
fvm flutter build apk
./gradlew app:assembleAndroidTest -Pdart-defines="$base64EnvParam,$base64ApiUrlParam"  -Ptarget=`pwd`/../integration_test/login_e2e_test.dart
./gradlew app:assemble${camelCaseFlavor}Debug -Pdart-defines="$base64EnvParam,$base64ApiUrlParam"  -Ptarget=`pwd`/../integration_test/login_e2e_test.dart
popd

gcloud auth activate-service-account --key-file=key.json
gcloud --quiet config set project yanmii-wallet-dev
gcloud firebase test android run --type instrumentation \
  --app build/app/outputs/apk/$flavor/debug/app-$flavor-debug.apk \
  --test build/app/outputs/apk/androidTest/$flavor/debug/app-$flavor-debug-androidTest.apk\
  --timeout 2m \