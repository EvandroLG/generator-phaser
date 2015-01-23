NODE_MODULES=./node_modules/
HTTP_SERVER=$(NODE_MODULES)http-server/bin/http-server
BROWSERIFY=$(NODE_MODULES)browserify/bin/cmd.js
VIGILIA=$(NODE_MODULES)vigilia/bin/vigilia
UGLIFY=$(NODE_MODULES)uglify-js/bin/uglifyjs

DIR_SRC="src/"
DIR_DIST="dist/"

.SILENT:

run:
	$(HTTP_SERVER)

browserify:
	$(BROWSERIFY) $(DIR_SRC)main.js -o $(DIR_DIST)main.js
	echo "browserified!"

minify:
	$(UGLIFY) $(DIR_DIST)main.js -o  $(DIR_DIST)main.min.js
	echo "minified!"

build: browserify minify

watch:
	$(VIGILIA) '$(DIR_SRC)*.js':'make build'
