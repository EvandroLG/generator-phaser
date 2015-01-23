NODE_MODULES=./node_modules/
HTTP_SERVER=$(NODE_MODULES)http-server/bin/http-server
BROWSERIFY=$(NODE_MODULES)browserify/bin/cmd.js
VIGILIA=$(NODE_MODULES)vigilia/bin/vigilia
UGLIFY=$(NODE_MODULES)uglify-js/bin/uglifyjs
JSHINT=$(NODE_MODULES)jshint/bin/jshint
MOCHA=$(NODE_MODULES)mocha-phantomjs/bin/mocha-phantomjs

DIR_SRC=src/
DIR_DIST=dist/
DIR_SRC_IMAGE=$(DIR_SRC)image/
DIR_DIST_IMAGE=$(DIR_DIST)image/
DIR_SRC_SCRIPT=$(DIR_SRC)script/
DIR_DIST_SCRIPT=$(DIR_DIST)script/

.SILENT:

run:
	$(HTTP_SERVER)

jshint:
	$(JSHINT) $(DIR_SRC_SCRIPT)*.js
	echo "jshint!"

browserify:
	$(BROWSERIFY) $(DIR_SRC_SCRIPT)main.js -o $(DIR_DIST_SCRIPT)main.js
	echo "browserified!"

minify:
	$(UGLIFY) $(DIR_SRC_SCRIPT)main.js -o $(DIR_DIST_SCRIPT)main.min.js
	echo "minified!"

tree:
	mkdir -p $(DIR_DIST_IMAGE)

build: tree jshint browserify minify
	cp -r $(DIR_SRC_IMAGE)* 2>$(DIR_DIST_IMAGE)

test_js:
	$(MOCHA) test/SpecRunner.html

watch:
	$(VIGILIA) '$(DIR_SRC_SCRIPT)*.js':'make build'
