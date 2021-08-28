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
)\n
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