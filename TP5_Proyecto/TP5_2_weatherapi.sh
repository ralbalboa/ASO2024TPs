#!/bin/bash

#La página de api weather, modificando que cosas quería ver, me dió API Key: 6a261aaa782a403c8bc23135241406
#y luego ingresando en la api-explorer con esa clave, eligiendo Bahía Blanca y apretando Show Response
#obtuve la  dirección web en call:
#http://api.weatherapi.com/v1/current.json?key=6a261aaa782a403c8bc23135241406&q=Bahia Blanca&aqi=no
#luego del igual se ve mi api----------------- 6a261aaa782a403c8bc23135241406
#después del &q= se ve la ciudad------------------------------------------------Bahia Blanca
#con el curl y definiendo la ciudad como variable podría ingresar cualquier ciudad y me la mostraría

echo "Ingrese una ciudad para obtener los datos climáticos: "
read ciudad

#tengo problemas al leer los espacios en las ciudades de nombre compuesto como explicó el profesor en clase,
#debo reemplazarlos por %20
ciudadArreglada=$(echo "ciudad" | sed 's/ /%20/g')

datos=$(curl -s "http://api.weatherapi.com/v1/current.json?key=6a261aaa782a403c8bc23135241406&q=${ciudadArreglada}&aqi=no")
#guardo en la variable datos la página de respuesta de la api por ciudad pidiéndola con curl

#ahora grabo en algunas variables las respuestas de los datos que quiero, pegando los datos de respuesta de json
#y así luego las muestro en pantalla
temperaturaActual=$(echo $datos | jq -r '.current.temp_c')
sensacionTermica=$(echo $datos | jq -r '.current.feelslike_c')
maxima=$(echo $datos | jq -r '.current.heatindex_c')
minima=$(echo $datos | jq -r '.current.dewpoint_c')


echo "El clima actual en $ciudad es:"
echo "Temperatura Actual: $temperaturaActual"
echo "Sensación Térmica: $sensacionTermica"
echo "Temperatura Máxima: $maxima"
echo "Temperatura Mínima: $minima"


