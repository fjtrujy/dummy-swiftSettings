public struct Goodbye {
    static public func say() {
    #if DUMMY_FLAG
        print("Goodbye with DUMMY FLAG! 😊")
    #else
        print("Sadly Goodbye 😢")
    #endif
    }
}
