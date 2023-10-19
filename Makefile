clean:
	rm -rf build
compile: clean
	mkdir -p build
	gcc ./src/main.c -o build/seek_last_five
generate_script: compile
	cp ./src/test_script_base.sh ./build/test_script.sh
	$(eval ENCODED := $(shell base64 ./build/seek_last_five))
	@sed -i "s#B64CONTENTS_#$(ENCODED)#g" ./build/test_script.sh
	chmod u+x ./build/test_script.sh
