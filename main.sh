#!/bin/bash
#
# Dependencias: curl, unzip, grep, awk, sed
#
#

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

for zipfile in ${zips[@]}
do
	echo -e "Descomprimiendo: \e[34m $zipfile \e[0m"
	unzip $zipfile -d nacional/
done;



## F I L T R A D O  ---------------------------------------------------------------#

#------------------------------------------------------------------------
#(Nacional):
#1 id_norma		#6 fecha_sancion	#11 titulo_sumario  	#16 modificada_por
#2 tipo_norma		#7 numero_boletin	#12 texto_resumido  	#17 modifica_a
#3 numero_norma		#8 fecha_boletin	#13 observaciones   	
#4 clase_norma		#9 pagina_boletin	#14 texto_original  	
#5 organismo_origen	#10 titulo_resumido	#15 texto_actualizado

#A json:
cat nacional/base-infoleg-normativa-nacional.csv | awk -F "\",\"" '
	BEGIN{printf "nacional=[\n" }
	$2 ~ /(Ley|Resolución|Decreto)/ && \
	$5 !~ /(ECONOM|EDUCA|EMPLEO|TURISMO|PENAL|TRANSPORTE|COMERCIO|FINANZAS|GENERO|COMUNICACIONES|AVIACION|DIGITAL|SEGURIDAD|CENSO|ALIMENTOS|JUSTICIA|DISCAPACIDAD|HOSPITAL|ANTICORRUPCION|TESORO|COMUNICACION|ADMINISTRATIVA|TASACIONES|CULTURA|DEFENZA|ARSENAL|MILITAR|MUSICA|TEATRO|ARTE|MAGISTRATURA|JUBILACIONES|AFIP)/ && \
	$10 !~ /(CONTRATACION|DESIGNACION|RENUNCIA|CREACION|GASTO|COMPRA|FONDO|PREMIO|SINTETIZ|DENOMINAC|NOMBRAMIENTO|RECOMENDACION)/ &&\
	$12 ~ /((CONTAMIN|PROTECCION|CUIDADO|CONSERVA|RECURSO).(AGUA|AIRE|HIDR|SUELO|ATMOSF|AMBIENT|BOSQUE|NATURAL)|(DESECHO|VERTIDO|VUELCO|RESIDU|EMISION).(GAS|LIQ|AGUA|AQU|EFLU|ATMOSF|HIDR|RIOS|LAGOS|SUELO|NATURA|PATOLOG|PATOGEN))/{
	      printf "   {\n"
	      printf "     \"id\":\""          $3"/"substr($6,1,4)"\",\n"
	      printf "     \"tipo_norma\":\""       substr($2,1,3)"\",\n"
	      printf "     \"organismo_origen\":\""$5 "\",\n"
	      printf "     \"titulo_resumido\":\"" $10"\",\n"
	      printf "     \"titulo_sumario\":\""  $11"\",\n"
	      printf "     \"texto_resumido\":\""  $12"\",\n"
	      printf "     \"observaciones\":\""   $13"\",\n"
	      printf "     \"texto_original\":\""  $14"\",\n"
	      printf "     \"texto_actualzado\":\""$15"\"\n"
	      printf "   },\n"
	   }
	END{printf "]\n"}' > matleg-nacional.json
	#	printf "\"id_norma\":"          $1 "\",\n"
	#       printf "\"numero_norma\":\""    $3 "\",\n"
	#       printf "\"clase_norma\":\""     $4 "\",\n"
	#       printf "\"fecha_sancion\":\""   $6 "\",\n"
	#	printf "\"numero_boletin\":\""  $7 "\",\n"
	#	printf "\"fecha_boletin\":\""   $8 "\",\n"
	#	printf "\"pagina_boletin\":\""  $9 "\",\n"
	#	printf "\"modificada_por\":\""  $16"\",\n"
	#	printf "\"modifica_a\":\""      $17"\n"

#------------------------------------------------------------------------
#(Provincial)
#1 provincia_nombre	#5 fecha		#9  titulo_sumario
#2 tipo_norma       	#6 fecha_publicacion    #10 informacion_digesto
#3 numero_norma     	#7 nombre_norma         #11 texto_actualizado
#4 estado_vigencia  	#8 titulo_resumido      #12 provincia_id

#tipo_norma:
# CCA:CODIGO CONTENCIOSO ADMINISTRATIVO
# CCC:CODIGO CONTRAVENCIONAL
# CFP:CODIGO FISCAL
# CON:CONSTITUCION PROVINCIAL
# COT:CODIGO TRIBUTARIO
# CPC:CODIGO PROCESAL CIVIL
# CPP:CODIGO PROCESAL PENAL/CRIMINAL
# CPT:CODIGO PROCESAL LABORAL
# DLE:DECRETO/LEY
# LEY:LEY
# NJF:
# TOR:
cat provincial/base-saij-normativa-provincial.csv | awk -F "\",\"" '
	BEGIN{printf "provincial=[\n" }
	#$2 ~ /(DLE|LEY|NJF|TOR)/ && \
	#$4 ~ /Vigente/ && \
	$8 ~ /(MEDIO.AMBIENTE|(CONTAMIN|PROTECCION|RECURSO).(AGUA|AIRE|HIDR|SUELO|ATMOSF|AMBIENT)|(DESECHOS|VERTIDOS|VUELCO|RESIDU|EMISION).(GAS|LIQ|AQU|EFLU|ATMOSF|HIDR|RIOS|LAGOS|SUELO))/{
	      printf "   {\n"
	      printf "     \"provincia\":"         $1"\",\n"
	      printf "     \"tipo_norma\":\""      $2"\",\n"
	      printf "     \"estado\":\""          $4 "\",\n"
	      printf "     \"id\":\""              $2":"$3"-"substr($6,3,2)"\",\n"
	      printf "     \"nombre_norma\":\""    $7 "\",\n"
	      printf "     \"titulo_resumido\":\"" $8"\",\n"
	      printf "     \"titulo_sumario\":\""  $9"\",\n"
	      printf "     \"texto_actualzado\":\""$11"\"\n"
	     #printf "     \"informacion_digesto\":\""   $10"\",\n"
	      printf "   },\n"
	   }
	END{printf "]\n"}' > matleg-provincial.json


#------------------------------------------------------------------------
#COFEMA
#------------------------------------------------------------------------
#OPDS
#------------------------------------------------------------------------
#APRA
#------------------------------------------------------------------------
#ENRE
#------------------------------------------------------------------------
#AYSA
#------------------------------------------------------------------------
#ACUMAR



## P A R S E O --------------------------------------------------------------------#

awk -F "\"*,\"*" '{print $5}' nacional/base-infoleg-normativa-nacional.csv | sort | uniq | grep "AMBIENTE"








