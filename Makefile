SOURCE="https://github.com/NatronGitHub/Natron/releases/download/v2.3.15/Natron-2.3.15-Linux-64-no-installer.tar.xz"
DESTINATION="natron.tar.xz"
OUTPUT="Natron.AppImage"


all:
	echo "Building: $(OUTPUT)"
	wget --output-document=$(DESTINATION) --continue $(SOURCE)
	
	mkdir -p ./build
	tar -xf $(DESTINATION) -C ./build
	rm -rf AppDir/application
	
	mkdir --parents AppDir/application
	cp -r build/Natron-2.3.15-Linux-64-no-installer/* AppDir/application

	chmod +x AppDir/AppRun

	export ARCH=x86_64 && bin/appimagetool.AppImage AppDir $(OUTPUT)
	chmod +x $(OUTPUT)

	rm -f $(DESTINATION)
	rm -rf AppDir/application
	rm -rf build
