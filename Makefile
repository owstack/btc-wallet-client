.PHONY: cover

BIN_PATH:=node_modules/.bin/

all:	btc-wallet-client.min.js

clean:
	rm btc-wallet-client.js
	rm btc-wallet-client.min.js

btc-wallet-client.js: index.js lib/*.js
	${BIN_PATH}browserify $< > $@

btc-wallet-client.min.js: btc-wallet-client.js
	uglify  -s $<  -o $@

cover:
	./node_modules/.bin/istanbul cover ./node_modules/.bin/_mocha -- --reporter spec test
