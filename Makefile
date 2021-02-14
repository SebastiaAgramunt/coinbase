 .PHONY: bootstrap # : install all requirements needed
bootstrap:
	pip install --upgrade pip
	pip install -r ./pip-dep/requirements.txt
	pip install -r ./pip-dep/requirements.test.txt
	pip install -e .

.PHONY: tests
tests:
	nosetests tests

.PHONY: coverage
coverage:
	nosetests --with-coverage --cover-branches --cover-package=coinbase tests
	coverage html --include='coinbase*'

release:
	python setup.py sdist bdist_wheel upload
