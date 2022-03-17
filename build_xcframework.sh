#!/bin/sh

rm -rf ModuleContainer.xcframework

xcodebuild archive -workspace SwiftIssue.xcworkspace -scheme ModuleContainer -sdk iphonesimulator -arch x86_64 -arch arm64 -archivePath ./output BUILD_LIBRARY_FOR_DISTRIBUTION=YES SKIP_INSTALL=NO
xcodebuild -create-xcframework -framework ./output.xcarchive/Products/Library/Frameworks/ModuleContainer.framework -output ModuleContainer.xcframework

rm -rf output.xcarchive
