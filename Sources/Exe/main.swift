#if canImport(WeakDep2)
import WeakDep2
    test2()
    print("have weak lib")
#else
    print("No weak lib")
#endif
