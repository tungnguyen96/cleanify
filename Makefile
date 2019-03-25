help:
	@echo "  lint          Check coding styles."
	@echo "  install       Install dependencies."
	@echo "  start         Run development server."
	@echo "  test          Run test suite."

test:
	npm test

lint:
	node ./node_modules/eslint/bin/eslint.js ./src/**

install:
	npm install

start:
	npm start
