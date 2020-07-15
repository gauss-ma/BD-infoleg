#!/bin/bash
#
# Dependencias: curl, unzip, grep, awk, sed
#
#

## D E S C A R G A ----------------------------------------------------------------#
echo $1


if [[ $1 == "descarga" || $1 == "-descarga" || $1 == "--descarga" ]]
then
	if [ ! -d provincial/ ];	then mkdir provincial;fi;
        if [ ! -d nacional/   ];	then mkdir nacional  ;fi;

	echo -e "\e[32mDescargando archivos..\e[0m"
	infoleg="http://datos.jus.gob.ar/dataset/base-de-datos-legislativos-infoleg"
	saij="http://datos.jus.gob.ar/dataset/base-saij-de-normativa-provincial"
	
	files_infoleg=($(curl -silent ${infoleg}  | grep -Eoi '<a [^>]+>'| grep -Eo 'href="[^\"]+"' |  grep -Eo '(http|https)://.*.zip'))
	files_saij=($(curl -silent ${saij}  | grep -Eoi '<a [^>]+>' | grep -Eo 'href="[^\"]+"' |  grep -Eo '(http|https)://.*.csv'))


	for file in ${files_infoleg[@]}
	do
		echo -e "Descargando: \e[35m $file \e[0m"
		wget $file 
	done;
	
	
	for file in ${files_saij[@]}
	do
		echo -e "Descargando: \e[35m $file \e[0m"
		wget $file -P provincial/.
	done;
	
	zips=($(ls *.zip))
	
	for zipfile in ${zips[@]}
	do
		echo -e "Descomprimiendo: \e[35m $zipfile \e[0m"
		unzip $zipfile -d nacional/
	done;

fi;

## F I L T R A D O  ---------------------------------------------------------------#
if [[ $1 == "database" || $1 == "-database" || $1 == "--database" ]]
then
#------------------------------------------------------------------------
#(Nacional):
#1 id_norma		#6 fecha_sancion	#11 titulo_sumario  	#16 modificada_por
#2 tipo_norma		#7 numero_boletin	#12 texto_resumido  	#17 modifica_a
#3 numero_norma		#8 fecha_boletin	#13 observaciones   	
#4 clase_norma		#9 pagina_boletin	#14 texto_original  	
#5 organismo_origen	#10 titulo_resumido	#15 texto_actualizado

#A json:
	echo -e "\e[32mParseando base de normativa nacional..\e[0m"

cat nacional/base-infoleg-normativa-nacional.csv | awk -F "\",\"" '
	 BEGIN{printf "[\n" }
	$2  ~ /(Ley|Resolución|Decreto)/ && \
	$5 !~ /(ECONOM|EDUCA|EMPLEO|TURISMO|PENAL|COMERCIO|FINANZAS|GENERO|COMUNICACIONES|AVIACION|DIGITAL|CENSO|ALIMENTOS|JUSTICIA|DISCAPACIDAD|HOSPITAL|ANTICORRUPCION|TESORO|COMUNICACION|ADMINISTRATIVA|TASACIONES|CULTURA|DEFENZA|ARSENAL|MILITAR|MUSICA|TEATRO|ARTE|MAGISTRATURA|JUBILACIONES|AFIP)/ &&\
	$10 !~ /(CONTRATACION|DESIGNA|RENUNCIA|CREACION|GASTO|COMPRA|FONDO|PREMIO|SINTETIZ|DENOMINAC|NOMBRAMIENTO|RECOMENDACION|PAVIMENTACION|URBANIZACION|RECHAZ|DESESTIMA|DESCONSIDERACION|(LICITACION.PUBLICA)|SUSTITUYE|INTENDENTE|CONCURSO|(AUDIENCIA.PUBLICA)|RECTIFICACION|REENCACILLAMIENTO|(ASIGNACION.*FUNCIONES)|TESORO|LLAMADO|SALARI|CREDITO|EXPROPIAC|JORNADA|SIMPOSIO|(EVASION.FISCAL))/ &&\
	($12 ~ /(DESECHO|VERTIDO|VUELCO|RESIDU|EMISION|GESTION|CONTAMIN|POLUCION|REMEDIA|PROTECCION|CUIDADO).*(AGUA|HIDR|ACU|AIRE|GAS|ATMOS|SUELO|GEO|GLACIA|SEDIMEN|RIO|LAGO|NATURA|PATOGEN|PATOLOG|CLOACA|AMBIENTE)/ ||\
	$12 ~ /(RESERVA|PARQUE|CONSERVACION).*(NATURAL|ECOLO|AUTOCT|NACIONAL)/ ||\
	$12 ~ /(MINER|EXPLOTACION|APROVECHAMIENTO).*(NATURAL|AMBIENT)/ ||\
	$12 ~ /(EVALUACION).*(IMPACTO|RIESGO).AMBIENTAL/ ) \
	{
	 printf "   {\n";
	 printf "     \"id\":\"%s/%4i\",\n",$3,substr($6,1,4);
	 printf "     \"tipo\":\"%3s\",\n",toupper(substr($2,1,3));
	 printf "     \"provincia\":\"NACION\",\n";
	 printf "     \"tema\":\"%s\",\n",$11;
	 printf "     \"titulo\":\"%s\",\n",$10;
	 printf "     \"texto\":\"%s\",\n",$12;
	 printf "     \"link\":\"%s\"\n", $14;
	 printf "   },\n"
	}
	#END{printf "]\n"}
	' > ../db/matleg.json

#------------------------------------------------------------------------
#(Provincial)
#1 provincia_nombre	#5 fecha		#9  titulo_sumario
#2 tipo_norma       	#6 fecha_publicacion    #10 informacion_digesto
#3 numero_norma     	#7 nombre_norma         #11 texto_actualizado
#4 estado_vigencia  	#8 titulo_resumido      #12 provincia_id

#tipo_norma:
#	CON: Constitución Nacional 	LEY: Ley 	DEC : Decreto		DLE: Decreto Ley  	ACU: Acuerdo 			
#	DIR: Directiva 			DOR: Decreto Ordenanza		COV: Convenio
#	DIS: Disposición 		TOR: Texto Ordenado Ley         
#	RES: Resolución	RID: Resolución	REG: Resolución	REN: Resolución	RSC: Resolución 	REM: Resolución 
#	LEE: Ley Extranjera
#	TOD: Texto Ordenado Decreto 	CIR: Circular 	CIT: Circular Técnica 
#	CIA: Circular Administrativa 	COM: Comunicación (Banco)" 
#	NOR: Norma 			DAN: Decisión Administrativa    LCT: Ley de Contrato de Trabajo 
#	ORD: Ordenanza 			TRA: Tratado 			
#	CCI: Código Civil 		CPT: Código Procesal del Trabajo
#	CCN: Código Civil y Comercial 	CCO: Código Comercial 		CPE: Código Penal 
#	CPC: Código Procesal Civil 	CPP: Código Procesal Penal 	CJM: Código Justicia Militar 
#	CMI: Código Minería 		CAD: Código Aduanero 		CTL: Comunicado Telefónico 
#	CAE: Código Aeronáutico 	CCA: Código Contencioso Admin.  CFP: Código Fiscal 
#	CEL: Código Electoral 		CAL: Cód.Alimenticio Nac.	
#	CAT: Código Contencioso Administrativo y Tributario 		
#	CCT: Convenio Colect.Trabajo 	EXP: Expediente 		LDO: Laudo 
#	NJF: Norma Jurídica de Facto    
#	DEM: Decisión del Mercosur 	
#	LPA: Ley de Procedim. Admin. 	LSO: Ley de Sociedades 		
#	ZZZ: Otros 			REA: Resolución 		CCC: Código Contravencional 
#	CCP: Cód. de P.Contravencional  ADG: Actuación ADGA (Aduana)" 	DAD: Dictamen Aduana
#	DID: Dictamen de AFIP o DGI 	NCM: Nomenclatura Común del Mercosur DNU : Decreto de Necesidad y Urgencia
#	DAC: Decreto Acuerdo 		COT: Código Tributario 		ACO: Acordada 
#	CPM: Código Procesal Minero 	ACP: Acordada de Corte Provincial 
#	CFA: Código de Faltas 
#	CRU: Código Rural 		
#	OPI: Opinión Consultiva		
	echo -e "\e[32mParseando base de normativa provincial..\e[0m"
cat provincial/base-saij-normativa-provincial.csv | awk -F "\",\"" '
	#BEGIN{printf "provincial=[\n" }
	#$2 ~ /(DLE|DEC|LEY|RE.|NOR)/ && \
	#$4 ~ /Vigente/ && \
	($9 ~ /(RECURSO|DESECHO|VERTIDO|VUELCO|RESIDU|EMISION|GESTION|CONTAMIN|REMEDIA|PROTECCION|CUIDADO).*(AGUA|HIDR|ACU|AIRE|GAS|ATMOS|SUELO|GEO|SEDIMEN|RIO|LAGO|NATURA|PATOGEN|PATOLOG|CLOACA)/ ||\
	$9 ~ /(RESERVA|PARQUE|CONSERVACION).*(NATURAL|NACIONAL)/ ||\
	$9 ~ /(EVALUACION).*(IMPACTO|RIESGO).AMBIENTAL/ ) \
	 {
		printf "   {\n";
		printf "     \"id\":\"%s/%4i\",\n",$3,substr($6,1,4);
		printf "     \"tipo\":\"%3s\",\n",toupper($2);
		printf "     \"provincia\":%s\",\n",$1;
		printf "     \"tema\":\"%s\",\n",$7;
		printf "     \"titulo\":\"%s\",\n",$8;
		printf "     \"texto\":\"%s\",\n",$9;
		printf "     \"link\":\"%s\"\n", $11;
	      printf "   },\n"
	 }
	 END{printf "]\n"}
	' >> ../db/matleg.json

	sed -i 's/tipo:"DLE"/tipo:"DEC"/;s/tipo:"RE."\,/tipo:"RES",/;' ../db/matleg.json
fi;




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

