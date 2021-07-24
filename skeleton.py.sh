#!/bin/bash

# este es un script para un skeleton para proyecto de base python.

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
touch $dp/tests/__init__.py
touch $dp/$dp/__init__.py
echo -e "#!/usr/bin/env python
# -*- coding: utf-8 -*-
try:
    from setuptools import setup\n
except ImportError:
    from distutils.core import setup\n
config = [
    'description': '',
    'author': 'Juan Pablo Nahuelpán',
    'url': 'github.com/jpnahuelpan/$dp',
    'download_url': '',
    'author_email': 'juanpablonahuelpan@mail.com',
    'version': '0.1',
    'install_requires': [''],
    'packages': [''],
    'scripts': [],
    'name': '$dp'\n
setup(**config)" >> $dp/setup.py 
 
echo -e "#!/usr/bin/env python
# -*- coding: utf-8 -*-" >> $dp/tests/$dp_tests.py 