# Makefile for creating a new release of the package and uploading it to PyPI
# This way is prefered to manual because it also resets config.json

PYTHON = python3
CONFIG = sentinelhub.config

help:
	@echo "Use 'make upload' to reset config.json and upload the package to PyPi"

reset-config:
	$(CONFIG) --reset

upload: reset-config
	$(PYTHON) setup.py sdist
	twine upload dist/*

# For testing:
test-upload: reset-config
	$(PYTHON) setup.py sdist
	twine upload --repository testpypi dist/*
