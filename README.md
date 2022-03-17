# Swift-Module-Issue
Minimal Reproducible Example of swiftinterface module resolution doesn't respect `-fmodule-map-file`.

```
-fmodule-map-file=<file>
  Load the given module map file if a header from its directory or one of its subdirectories is loaded.
```

This is a way to specify custom modulemap filename other than the default `module.modulemap` name. CocoaPods heavily uses this compiler flag for its module system.


# Modules walkthrough

### `App`

### `ModuleA`

### `ModuleB`

### `ModuleContainer`

# How to run this example

Run this command to compile the `App` target

`xcodebuild build -workspace SwiftIssue.xcworkspace -scheme App -sdk iphonesimulator`

the compile error is something like this:

```
CompileSwift normal x86_64 /Users/kudo/SwiftIssue/App/App/SceneDelegate.swift (in target 'App' from project 'App')
    cd /Users/kudo/SwiftIssue/App
    /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/swift-frontend -frontend -c /Users/kudo/SwiftIssue/App/App/ViewController.swift /Users/kudo/SwiftIssue/App/App/AppDelegate.swift -primary-file /Users/kudo/SwiftIssue/App/App/SceneDelegate.swift -emit-dependencies-path /Users/kudo/Library/Developer/Xcode/DerivedData/SwiftIssue-dkubhfivwlkbwefrzralcgvppcaw/Build/Intermediates.noindex/App.build/Debug-iphonesimulator/App.build/Objects-normal/x86_64/SceneDelegate.d -emit-reference-dependencies-path /Users/kudo/Library/Developer/Xcode/DerivedData/SwiftIssue-dkubhfivwlkbwefrzralcgvppcaw/Build/Intermediates.noindex/App.build/Debug-iphonesimulator/App.build/Objects-normal/x86_64/SceneDelegate.swiftdeps -serialize-diagnostics-path /Users/kudo/Library/Developer/Xcode/DerivedData/SwiftIssue-dkubhfivwlkbwefrzralcgvppcaw/Build/Intermediates.noindex/App.build/Debug-iphonesimulator/App.build/Objects-normal/x86_64/SceneDelegate.dia -emit-localized-strings -emit-localized-strings-path /Users/kudo/Library/Developer/Xcode/DerivedData/SwiftIssue-dkubhfivwlkbwefrzralcgvppcaw/Build/Intermediates.noindex/App.build/Debug-iphonesimulator/App.build/Objects-normal/x86_64 -target x86_64-apple-ios15.4-simulator -enable-objc-interop -sdk /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator15.4.sdk -I /Users/kudo/Library/Developer/Xcode/DerivedData/SwiftIssue-dkubhfivwlkbwefrzralcgvppcaw/Build/Products/Debug-iphonesimulator -I /Users/kudo/SwiftIssue/ModuleA/ModuleA -I /Users/kudo/SwiftIssue/ModuleB/ModuleB -F /Users/kudo/Library/Developer/Xcode/DerivedData/SwiftIssue-dkubhfivwlkbwefrzralcgvppcaw/Build/Products/Debug-iphonesimulator -F /Users/kudo/SwiftIssue/ModuleContainer.xcframework -F /Users/kudo/SwiftIssue/ModuleContainer.xcframework/ios-arm64_x86_64-simulator -enable-testing -g -module-cache-path /Users/kudo/Library/Developer/Xcode/DerivedData/ModuleCache.noindex -swift-version 5 -enforce-exclusivity\=checked -Onone -D DEBUG -new-driver-path /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/swift-driver -serialize-debugging-options -Xcc -working-directory -Xcc /Users/kudo/SwiftIssue/App -resource-dir /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift -enable-anonymous-context-mangled-names -Xcc -fmodule-map-file\=/Users/kudo/SwiftIssue/App/../ModuleA/ModuleA/module.modulemap -Xcc -fmodule-map-file\=/Users/kudo/SwiftIssue/App/../ModuleB/ModuleB/ModuleB.modulemap -Xcc -I/Users/kudo/Library/Developer/Xcode/DerivedData/SwiftIssue-dkubhfivwlkbwefrzralcgvppcaw/Build/Intermediates.noindex/App.build/Debug-iphonesimulator/App.build/swift-overrides.hmap -Xcc -iquote -Xcc /Users/kudo/Library/Developer/Xcode/DerivedData/SwiftIssue-dkubhfivwlkbwefrzralcgvppcaw/Build/Intermediates.noindex/App.build/Debug-iphonesimulator/App.build/App-generated-files.hmap -Xcc -I/Users/kudo/Library/Developer/Xcode/DerivedData/SwiftIssue-dkubhfivwlkbwefrzralcgvppcaw/Build/Intermediates.noindex/App.build/Debug-iphonesimulator/App.build/App-own-target-headers.hmap -Xcc -I/Users/kudo/Library/Developer/Xcode/DerivedData/SwiftIssue-dkubhfivwlkbwefrzralcgvppcaw/Build/Intermediates.noindex/App.build/Debug-iphonesimulator/App.build/App-all-non-framework-target-headers.hmap -Xcc -ivfsoverlay -Xcc /Users/kudo/Library/Developer/Xcode/DerivedData/SwiftIssue-dkubhfivwlkbwefrzralcgvppcaw/Build/Intermediates.noindex/App.build/Debug-iphonesimulator/App.build/all-product-headers.yaml -Xcc -iquote -Xcc /Users/kudo/Library/Developer/Xcode/DerivedData/SwiftIssue-dkubhfivwlkbwefrzralcgvppcaw/Build/Intermediates.noindex/App.build/Debug-iphonesimulator/App.build/App-project-headers.hmap -Xcc -I/Users/kudo/Library/Developer/Xcode/DerivedData/SwiftIssue-dkubhfivwlkbwefrzralcgvppcaw/Build/Products/Debug-iphonesimulator/include -Xcc -I/Users/kudo/Library/Developer/Xcode/DerivedData/SwiftIssue-dkubhfivwlkbwefrzralcgvppcaw/Build/Intermediates.noindex/App.build/Debug-iphonesimulator/App.build/DerivedSources-normal/x86_64 -Xcc -I/Users/kudo/Library/Developer/Xcode/DerivedData/SwiftIssue-dkubhfivwlkbwefrzralcgvppcaw/Build/Intermediates.noindex/App.build/Debug-iphonesimulator/App.build/DerivedSources/x86_64 -Xcc -I/Users/kudo/Library/Developer/Xcode/DerivedData/SwiftIssue-dkubhfivwlkbwefrzralcgvppcaw/Build/Intermediates.noindex/App.build/Debug-iphonesimulator/App.build/DerivedSources -Xcc -DDEBUG\=1 -module-name App -target-sdk-version 15.4 -o /Users/kudo/Library/Developer/Xcode/DerivedData/SwiftIssue-dkubhfivwlkbwefrzralcgvppcaw/Build/Intermediates.noindex/App.build/Debug-iphonesimulator/App.build/Objects-normal/x86_64/SceneDelegate.o -index-unit-output-path /App.build/Debug-iphonesimulator/App.build/Objects-normal/x86_64/SceneDelegate.o -index-store-path /Users/kudo/Library/Developer/Xcode/DerivedData/SwiftIssue-dkubhfivwlkbwefrzralcgvppcaw/Index/DataStore -index-system-modules
/Users/kudo/SwiftIssue/ModuleContainer.xcframework/ios-arm64_x86_64-simulator/ModuleContainer.framework/Modules/ModuleContainer.swiftmodule/x86_64-apple-ios-simulator.swiftinterface:5:8: error: no such module 'ModuleB'
import ModuleB
       ^
<module-includes>:2:9: note: in file included from <module-includes>:2:
#import "Headers/ModuleContainer-Swift.h"
        ^
/Users/kudo/SwiftIssue/App/App/AppDelegate.swift:11:8: error: failed to build module 'ModuleContainer' for importation due to the errors above; the textual interface may be broken by project issues or a compiler bug
import ModuleContainer
       ^
/Users/kudo/SwiftIssue/ModuleContainer.xcframework/ios-arm64_x86_64-simulator/ModuleContainer.framework/Modules/ModuleContainer.swiftmodule/x86_64-apple-ios-simulator.swiftinterface:5:8: error: no such module 'ModuleB'
import ModuleB
       ^
<module-includes>:2:9: note: in file included from <module-includes>:2:
#import "Headers/ModuleContainer-Swift.h"
        ^
```

## Rebuild `ModuleContainer.xcframework`

The prebuilt `ModuleContainer.xcframework` is committed into git. If you want to rebuild the xcframework, you can run the `build_xcframework.sh` script.
