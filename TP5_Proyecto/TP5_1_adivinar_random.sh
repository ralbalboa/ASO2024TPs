#!/bin/bash

numero_aleatorio=$((RANDOM % 100 + 1))
#acá generé un número aleatorio entre 1 y 100

intento=0
#acá inicializo el contador de intentos para adivinar y lo pongo inicialmente en 0

echo "Intente adivinar el número guardado en la memoria entre 1 y 100. Tiene sólo 6 intentos."
echo
#ahora voy a empezar un bucle que repite hasta 6 intentos de adivinar...
while [ $intento -lt 6 ]; 
do 
	intento=$((intento + 1))
	#voy aumentando los intentos de a uno empezando en 1  hasta que sea menor (-lt)  a 6, terminaría en el 6to intento

	echo "Ingrese el número para el intento $intento: "
	read ingreso
	#pido al usuario el primer intento de número y lo leo/guardo en la variable (ingreso)

	if [ $ingreso -eq $numero_aleatorio ]
		then
		#si el número ingresado (ingreso) es igual al número random guardado, entonces...
		echo "¡Usted adivinó! El número era $numero_aleatorio."
		exit 0
		#con exit 0 salgo del programa porque ya se adivinó el número
	elif [ $ingreso -gt $numero_aleatorio ]
		then
		#si el número ingresado es mayor (-gt) al aleatorio entonces...
		echo "El número ingresado es mayor que el buscado."
		echo
	else
		#si fue igual o fue mayor solo me queda que es menor, entonces...
		echo "El número ingresado es menor que el buscado."
		echo
	fi
done
#terminó el ciclo de adivinanza, si se adivinaba se cerraba solo, sino, al llegar al 6to intento sale del bucle y anuncio que no se adivinó
echo "Se terminaron los 6 intentos, usted no pudo adivinar el número $numero_aleatorio."

