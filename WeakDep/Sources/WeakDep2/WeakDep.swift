// The Swift Programming Language
// https://docs.swift.org/swift-book

#if canImport(WeakDep1)
private import WeakDep1
#endif

public func test2() {
    print(#function)

#if canImport(WeakDep1)
    test1()
#endif
}
