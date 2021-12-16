# dummy-swiftSettings
The proposal of the repository is to check if `swiftSettings` values defined inside of the target are being sent properly to dependencies.

We have the next example:

## Goodbye dependency
It is a dummy `swift` library, it just does:
```swift
public struct Goodbye {
    static public func say() {
    #if DUMMY_FLAG
        print("Goodbye with DUMMY FLAG! 😊")
    #else
        print("Sadly Goodbye 😢")
    #endif
    }
}
```

And the `Package.swift` it is:
```swift
let package = Package(
    name: "Goodbye",
    products: [
        .library(
            name: "Goodbye",
            targets: ["Goodbye"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Goodbye",
            dependencies: []),
    ]
)
```

As you can see based if the `DUMMY_FLAG` is being sent or not, it will print one message or the other.


## Main Swift package
This is dummy package that use `Goodbye` as dependency, and it is just doing:
```swift
import Goodbye

#if DUMMY_FLAG
print("Hello World with DUMMY FLAG! 😊")
#else
print("Sadly Hello World 😢")
#endif

Goodbye.say()
```

And the `Package.swift` is:
```swift
let package = Package(
    name: "dummy-swiftSettings",
    platforms: [
        .macOS(.v10_12)
    ],
    products: [
        .executable(name: "dummy-swiftSettings", targets: ["dummy-swiftSettings"]),
    ],
    dependencies: [
        .package(path: "Goodbye"),
    ],
    targets: [
        .executableTarget(
            name: "dummy-swiftSettings",
            dependencies: ["Goodbye"],
            swiftSettings: [.define("DUMMY_FLAG")])
    ]
)
```

Once again, you can see how based on the `DUMMY_FLAG` we are printing a different hello world message.

# Expected behaviour
It should print something as:
```
Hello World with DUMMY FLAG! 😊
Goodbye with DUMMY FLAG! 😊
```

# Current behaviour
```
Hello World with DUMMY FLAG! 😊
Sadly Goodbye 😢
```