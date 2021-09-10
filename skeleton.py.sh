#!/bin/bash

# este es un script para un skeleton para proyecto con base python.

# ingresar donde se quiere crear el proyecto.
dp=$1 # directory project(dp).

# paso 1 crear los directorios.
mkdir $dp  
mkdir $dp/bin 
mkdir $dp/$dp
mkdir $dp/tests
mkdir $dp/docs
mkdir $dp/templates

# paso 2 crear archivos relevantes.
echo -e "#!/usr/bin/env python
# -*- coding: utf-8 -*-

try:
    from setuptools import setup\n
except ImportError:
    from distutils.core import setup\n
setup(name='$dp',
      version='1.0.0',
      description='',
      author='Juan Pablo Nahuelpán',
      author_email='juanpablonahuelpan@gmail.com',
      url=''
      )
" >> $dp/setup.py 

touch $dp/README.md

echo -e "#!/usr/bin/env python
# -*- coding: utf-8 -*-" >> $dp/bin/app.py 

touch $dp/$dp/__init__.py
touch $dp/tests/__init__.py

echo -e "#!/usr/bin/env python
# -*- coding: utf-8 -*-" >> $dp/tests/$dp\_tests.py 

# paso 3 crear enviroment.
cd $dp
virtualenv venv

# paso 4 inicializar git
git init
echo -e "# Folders
venv/" >> .gitignore

# paso 5 agregar github-actions
mkdir .github
mkdir .github/workflows
echo -e "name: Pylint

on: [push]

jobs:
  build:

    runs-on: ubuntu-latest

    steps:
    - uses: actions/checkout@v2
    - name: Set up Python 3.8.10
      uses: actions/setup-python@v2
      with:
        python-version: 3.8.10
    - name: Install dependencies
      run: |
        python -m pip install --upgrade pip
        pip install pylint
    - name: Analysing the code with pylint
      run: |
        pylint \`ls -R|grep .py$|xargs\`
" >> .github/workflows/pylint.yml

echo -e "name: Python application

on:
  push:
    branches: [ $default-branch ]
  pull_request:
    branches: [ $default-branch ]

jobs:
  build:

    runs-on: ubuntu-latest

    steps:
    - uses: actions/checkout@v2
    - name: Set up Python 3.8.10
      uses: actions/setup-python@v2
      with:
        python-version: 3.8.10
    - name: Install dependencies
      run: |
        python -m pip install --upgrade pip
        pip install flake8 pytest
        if [ -f requirements.txt ]; then pip install -r requirements.txt; fi
    - name: Lint with flake8
      run: |
        # stop the build if there are Python syntax errors or undefined names
        flake8 . --count --select=E9,F63,F7,F82 --show-source --statistics
        # exit-zero treats all errors as warnings. The GitHub editor is 127 chars wide
        flake8 . --count --exit-zero --max-complexity=10 --max-line-length=127 --statistics
    - name: Test with pytest
      run: |
        pytest
" >> .github/workflows/python-app.yml
