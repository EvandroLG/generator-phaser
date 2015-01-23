NODE_MODULES=./node_modules/
HTTP_SERVER=$(NODE_MODULES)http-server/bin/http-server
BROWSERIFY=$(NODE_MODULES)browserify/bin/cmd.js

.SILENT:

run:
	$(HTTP_SERVER)

browserify:
	$(BROWSERIFY) src/main.js -o dist/main.js
	echo "browserified!"
