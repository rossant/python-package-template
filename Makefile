clean-build:
	rm -fr build/
	rm -fr dist/
	rm -fr *.egg-info

clean-pyc:
	find . -name '*.pyc' -exec rm -f {} +
	find . -name '*.pyo' -exec rm -f {} +
	find . -name '*~' -exec rm -f {} +
	find . -name '__pycache__' -exec rm -fr {} +

clean: clean-build clean-pyc

lint:
	flake8 NAME

test: lint
	py.test -vv --cov-report term-missing --cov=NAME NAME

build:
	python setup.py sdist --formats=zip

upload:
	python setup.py sdist --formats=zip upload
