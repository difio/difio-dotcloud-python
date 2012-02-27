build:
	./setup.py sdist

upload:
	./setup.py sdist upload

clean:
	./setup.py clean
	rm -f MANIFEST *.pyc

distclean: clean
	rm -rf dist/

help:
	@echo "Usage: make <target>                   "
	@echo "                                       "
	@echo " build - build the package             "
	@echo " upload - upload to PyPI               "
	@echo " clean - remove all build files        "
	@echo " distclean - remove all non git files  "
	@echo " help - show this help and exit        "
