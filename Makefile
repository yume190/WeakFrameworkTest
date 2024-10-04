build0: 
	-rm -Rf .build
	swift build

build1: 
	-rm -Rf .build
	swift build \
		-Xlinker "-weak_framework" -Xlinker "WeakDep"

build: 
	-rm -Rf .build
	swift build \
		-Xlinker "-weak_framework" -Xlinker "WeakDep1" \
		-Xlinker "-weak_framework" -Xlinker "WeakDep2" 
build2: 
	-rm -Rf .build
	swift build \
		-Xlinker "-weak_library" -Xlinker "libWeakDep.dylib" 

run: 
	otool -L .build/debug/Exe
	@echo "---"
	
	otool -L .build/debug/WeakDep1.framework/WeakDep1
	@echo "---"
	otool -L .build/debug/WeakDep2.framework/WeakDep2
	@echo "---"
	.build/debug/Exe
	@echo "---"
	-rm -Rf .build/debug/WeakDep1.framework
	@echo "---"
	.build/debug/Exe

# install_name_tool -delete_rpath @rpath/WeakDep1.framework/Versions/A/WeakDep1 .build/debug/WeakDep1.framework/WeakDep1
# install_name_tool -delete_rpath @rpath/WeakDep2.framework/Versions/A/WeakDep2 .build/debug/WeakDep2.framework/WeakDep2
