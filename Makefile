help:
	@echo "  lint          Check coding styles."
	@echo "  install       Install dependencies."
	@echo "  start         Run development server."

lint:
	./node_modules/eslint/bin/eslint.js ./src/**

install:
	npm install

start:
	npm start
