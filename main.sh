#!/bin/bash


## D E S C A R G A ----------------------------------------------------------------#

infoleg="http://datos.jus.gob.ar/dataset/base-de-datos-legislativos-infoleg"
saij="http://datos.jus.gob.ar/dataset/base-saij-de-normativa-provincial"


files_infoleg=($(curl -silent ${infoleg}  | grep -Eoi '<a [^>]+>' ${1} | grep -Eo 'href="[^\"]+"' |  grep -Eo '(http|https)://.*.zip'))
files_saij=($(curl -silent ${saij}  | grep -Eoi '<a [^>]+>' ${1} | grep -Eo 'href="[^\"]+"' |  grep -Eo '(http|https)://.*.csv'))


for file in ${files_infoleg[@]}
do
	echo -e "Descargando: \e[34m $file \e[0m"
	wget $file 
done;


for file in ${files_saij[@]}
do
	echo -e "Descargando: \e[34m $file \e[0m"
	wget $file -P provincial/.
done;

zips=($(ls *.zip))

for zip in ${zips[@]}
do
	echo -e "Descomprimiendo: \e[34m $zip \e[0m"
	unzip $zip -d nacional/
done;



## F I L T R A D O  ---------------------------------------------------------------#

#Columnas (Nacional):
#1 id_norma		#6 fecha_sancion	#11 titulo_sumario  	#16 modificada_por
#2 tipo_norma		#7 numero_boletin	#12 texto_resumido  	#17 modifica_a
#3 numero_norma		#8 fecha_boletin	#13 observaciones   	
#4 clase_norma		#9 pagina_boletin	#14 texto_original  	
#5 organismo_origen	#10 titulo_resumido	#15texto_actualizado


#ideas para filtrar:
awk -F "\"*,\"*" '$6 ~ /2020-01-27/{print $6}' nacional/base-infoleg-normativa-nacional.csv







## P A R S E O --------------------------------------------------------------------#

awk -F "\"*,\"*" '{print $5}' nacional/base-infoleg-normativa-nacional.csv | sort | uniq | grep "AMBIENTE"








