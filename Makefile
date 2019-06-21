BUNDLER:=./node_modules/.bin/browserify
TSC:=./node_modules/.bin/tsc
TS_SOURCES:=$(shell find src -type f)

public/js/app.js: lib
	mkdir -p public/js
	$(BUNDLER) lib/index.js > $@

lib: $(TS_SOURCES)
	@rm -R lib || true
	cp -R src lib
	$(TSC) --project $@	