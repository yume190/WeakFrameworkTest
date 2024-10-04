// The Swift Programming Language
// https://docs.swift.org/swift-book
#if canImport(WeakDep2)
private import WeakDep2
#endif


public func weakF() {
#if canImport(WeakDep2)
    test2()
    print("have weak lib")
#else
    print("No weak lib")
#endif
}


//@main
//struct Entry {
//    static func main() {
//#if canImport(WeakDep)
//    }
//}
