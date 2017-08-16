.PHONY: cover

BIN_PATH:=node_modules/.bin/

all:	btccore-wallet-client.min.js

clean:
	rm btccore-wallet-client.js
	rm btccore-wallet-client.min.js

btccore-wallet-client.js: index.js lib/*.js
	${BIN_PATH}browserify $< > $@

btccore-wallet-client.min.js: btccore-wallet-client.js
	uglify  -s $<  -o $@

cover:
	./node_modules/.bin/istanbul cover ./node_modules/.bin/_mocha -- --reporter spec test
