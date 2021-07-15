#!/bin/bash

# este es in script para crear arbol de directorios para las tareas de mdrsp.

# ingresar donde se quiere crear el proyecto.
read -p "ingresar nombre del proyecto: " dp # directory project(dp).

# paso 1 crear los directorios.
mkdir $dp  
mkdir $dp/input 
mkdir $dp/output
mkdir $dp/src


# paso 2 agregar main.py
cat <<EOF>>$dp/src/main.py 
#!/usr/bin/env python
# -*- coding: utf-8 -*-
# integrantes: Juan Pablo Nahuelpán 


def main():





if __name__ == '__main__':
    main() 	 
