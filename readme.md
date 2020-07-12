<p align="center"><img src="./img/matrix_icon.svg" alt="logo" height="60"/></p>
<h1 align="center">Matleg</h1>
<p align="center">Base de datos de legislación ambiental.</p>

-----------------------------------------------------

### Fuentes:

- [Base SAIJ de Normativa Provincial](http://datos.jus.gob.ar/dataset/base-saij-de-normativa-provincial)
- [Base de datos legislativos INFOLEG](http://datos.jus.gob.ar/dataset/base-de-datos-legislativos-infoleg)

-[Servicio de información normativa, CABA](https://data.buenosaires.gob.ar/dataset/servicio-informacion-normativa)
===========================================================

Este recurso contiene las leyes, decisiones administrativas, decretos, resoluciones, disposiciones, acordadas y todo acto administrativo publicado en la primera sección del Boletín Oficial de la República Argentina desde mayo 1997 más la normativa referenciada. La información se actualiza diariamente y las consultas actualizadas están disponibles en [Infoleg](http://www.infoleg.gob.ar/).

http://datos.jus.gob.ar/dataset/base-de-datos-legislativos-infoleg

Características
---------------

- **Fecha de Primera Publicación:** 05/09/2016

- **Tags o Etiquetas:** leyes, decisiones administrativas, decretos, resoluciones, disposiciones, acordadas, boletín oficial

- **Organización:** Ministerio de Justicia y Derechos Humanos. Secretaría de Planificación Estratégica. Dirección Nacional del Sistema Argentino de Información Jurídica

- **Autor:** Ministerio de Justicia y Derechos Humanos. Secretaría de Planificación Estratégica. Dirección Nacional del Sistema Argentino de Información Jurídica

- **Responsable:** Ministerio de Justicia y Derechos Humanos. Secretaría de Planificación Estratégica. Dirección Nacional del Sistema Argentino de Información Jurídica

- **Grupo:** Información Jurídica

- **Frecuencia de Actualización:** Mensualmente

Recursos disponibles
--------------------

### Base Infoleg de Normativa Nacional - Muestreo

- **Nombre del archivo:** base-infoleg-normativa-nacional-muestreo.csv

- **Descripción del contenido:** Muestreo de 1000 registros de la base de documentos digitales legislativos: leyes, decisiones administrativas, decretos, resoluciones, disposiciones, acordadas y todo acto administrativo publicado en la primera sección del Boletín Oficial de la República Argentina desde mayo 1997 más la normativa referenciada. Los datos completos están publicados en formato zip.

- **Formato:** CSV delimitado por comas, codificado en UTF-8

- **Rango temporal:** muestreo de la base Infoleg de normativa nacional informado hasta la fecha consignada como "Datos actualizados al"

### Base Infoleg de Normativa Nacional

- **Nombre del archivo:** base-infoleg-normativa-nacional.zip

- **Descripción del contenido:** base de documentos digitales normativos nacionales: leyes, decisiones administrativas, decretos, resoluciones, disposiciones, acordadas y todo acto administrativo publicado en la primera sección del Boletín Oficial de la República Argentina desde mayo 1997 más la normativa referenciada. La información se actualiza diariamente y las consultas actualizadas están disponibles en Infoleg <http://www.infoleg.gob.ar/> . 
Los DNU que figuran en este registro son todos los que fueron publicados en el Boletín Oficial y que fueron dictados conforme el artículo 99 inc. 3 de la Constitución Nacional, en acuerdo general de ministros.

- **Formato:** ZIP

- **Rango temporal:** base Infoleg de normativa nacional desde mayo de 1997 hasta la fecha consignada como "Datos actualizados al"

### Campos del recurso

- **id_norma (entero):** identificador de la Norma

- **tipo_norma (string):** clasificación de la norma de acuerdo a la jerarquía normativa (ej. leyes, decisiones administrativas, decretos, etc.)

- **numero_norma (string):** número de la norma o S/N (sin número)

- **clase_norma (string):** atributo complementario del tipo de norma (ej. Comunicaciones A B C, Resoluciones Conjuntas, etc.)

- **organismo_origen (string):** organismo emisor de la norma

- **fecha_sancion (fecha):** fecha que se sancionó la ley o se emitió el acto administrativo

- **numero_boletin (entero):** número de boletín donde se publicó la norma

- **fecha_boletin (fecha):** fecha del Boletín Oficial (BO) donde se publicó la norma

- **pagina_boletin (entero):** número de página del boletín

- **titulo_resumido (string):** tema específico que trata la norma

- **titulo_sumario (string):** tema genérico que trata la norma

- **texto_resumido (string):** sintesis de la norma (se reproduce el copete o el art. 1)

- **observaciones (string):** anotaciones complementarias a la norma (ej. fe de erratas, aclaraciones, abrogación, etc.)

- **texto_original (string):** link al texto original de la norma tal como fue publicado

- **texto_actualizado (string):** link al texto actual vigente de la norma

- **modificada_por (entero):** cantidad de normas que modifican/complementan a la presente

- **modifica_a (entero):** cantidad de normas a las que modifica/complementa la presente


### Base Complementaria Infoleg de Normas Modificadas - Muestreo

- **Nombre:** base-complementaria-infoleg-normas-modificadas-muestreo.csv

- **Descripción:** Muestreo de 1000 registros de la base complementaria Infoleg con normas nacionales modificadas: leyes, decisiones administrativas, decretos, resoluciones, disposiciones, acordadas y todo acto administrativo publicado en la primera sección del Boletín Oficial de la República Argentina desde mayo 1997 más la normativa referenciada. Los datos completos están publicados en formato zip.

- **Formato:** CSV delimitado por comas, codificado en UTF-8

- **Rango temporal:** muestreo de la base complementaria Infoleg de normas modificadas informado hasta la fecha consignada como "Datos actualizados al"

### Base Complementaria Infoleg de Normas Modificadas

- **Nombre:** base-complementaria-infoleg-normas-modificadas.zip

- **Descripción:** base complementaria Infoleg con normas nacionales modificadas: leyes, decisiones administrativas, decretos, resoluciones, disposiciones, acordadas y todo acto administrativo publicado en la primera sección del Boletín Oficial de la República Argentina desde mayo 1997 más la normativa referenciada

- **Formato:** ZIP

- **Rango temporal:** base complementaria Infoleg de normas modificadas desde mayo de 1997 hasta la fecha consignada como "Datos actualizados al"

### Campos del recurso

- **id_norma_modificada (entero):** identificador de la Norma modificada

- **id_norma_modificatoria (entero):** identificador de la Norma modificante

- **tipo_norma (string):** clasificación de la norma de acuerdo a la jerarquía normativa (ej. leyes, decisiones administrativas, decretos, etc.)

- **numero_norma (string):** número de la norma o S/N (sin número)

- **clase_norma (string):** atributo complementario del tipo de norma (ej. Comunicaciones A B C, Resoluciones Conjuntas, etc.)

- **organismo_origen (string):** organismo emisor de la norma

- **fecha_boletin (fecha):** fecha del Boletín Oficial (BO) donde se publicó la norma

- **titulo_sumario (string):** tema genérico que trata la norma

- **titulo_resumido (string):** tema específico que trata la norma


### Base Complementaria Infoleg de Normas Modificatorias - Muestreo

- **Nombre:** base-complementaria-infoleg-normas-modificatorias-muestreo.csv

- **Descripción:** Muestreo de 1000 registros de la base complementaria Infoleg con normas nacionales modificatorias: leyes, decisiones administrativas, decretos, resoluciones, disposiciones, acordadas y todo acto administrativo publicado en la primera sección del Boletín Oficial de la República Argentina desde mayo 1997 más la normativa referenciada. Los datos completos están publicados en formato zip.

- **Formato:** CSV delimitado por comas, codificado en UTF-8

- **Rango temporal:** muetreo de la base complementaria Infoleg de normas modificatorias informado hasta la fecha consignada como "Datos actualizados al"

### Base Complementaria Infoleg de Normas Modificatorias

- **Nombre:** base-complementaria-infoleg-normas-modificatorias.zip

- **Descripción:** base complementaria Infoleg con normas nacionales modificatorias: leyes, decisiones administrativas, decretos, resoluciones, disposiciones, acordadas y todo acto administrativo publicado en la primera sección del Boletín Oficial de la República Argentina desde mayo 1997 más la normativa referenciada

- **Formato:** ZIP

- **Rango temporal:** base complementaria Infoleg de normas modificatorias desde mayo de 1997 hasta la fecha consignada como "Datos actualizados al"

### Campos del recurso

- **id_norma_modificatoria (entero):** identificador de la norma modificatoria

- **id_norma_modificada (entero):** identificador de la norma modificada

- **tipo_norma (string):** clasificación de la norma de acuerdo a la jerarquía normativa (ej. leyes, decisiones administrativas, decretos, etc.)

- **numero_norma (string):** número de la norma o S/N (sin número)

- **clase_norma (string):** atributo complementario del tipo de norma (ej. Comunicaciones A B C, Resoluciones Conjuntas, etc.)

- **organismo_origen (string):** organismo emisor de la norma

- **fecha_boletin (fecha):** fecha del Boletín Oficial (BO) donde se publicó la norma

- **titulo_sumario (string):** tema genérico que trata la norma

- **titulo_resumido (string):** tema específico que trata la norma

Notas
------

[Ley 27.275 - Derecho de Acceso a la Información Pública]( http://servicios.infoleg.gob.ar/infolegInternet/anexos/265000-269999/265949/norma.htm)

Este Conjunto de datos es publicado en el Portal de Datos Abiertos de la Justicia Argentina mediante [Resolución Nº 986 del Ministerio de Justicia y Derechos Humanos](http://datos.jus.gob.ar/resoluciones/RESOL-2016-986-E-APN-MJ.pdf), del 26 de Octubre de 2016.






# Base SAIJ de Normativa Provincial

Este conjunto de datos contiene documentos digitales normativos provinciales: leyes,decretos leyes, textos ordenados, códigos y Constituciones publicados en el Boletín Oficial de la Provincia correspondiente.

http://datos.jus.gob.ar/dataset/base-saij-de-normativa-provincial

Características
---------------

- **Fecha de Primera Publicación:** 05/12/2016

- **Tags o Etiquetas:** leyes, decretos, códigos provinciales, constituciones provinciales, boletín oficial

- **Organización:** Ministerio de Justicia y Derechos Humanos. Secretaría de Planificación Estratégica. Dirección Nacional del Sistema Argentino de Información Jurídica

- **Autor:** Ministerio de Justicia y Derechos Humanos. Secretaría de Planificación Estratégica. Dirección Nacional del Sistema Argentino de Información Jurídica

- **Responsable:** Ministerio de Justicia y Derechos Humanos. Secretaría de Planificación Estratégica. Dirección Nacional del Sistema Argentino de Información Jurídica

- **Grupo:** Información Jurídica

- **Frecuencia de Actualización:** Mensualmente

Recursos disponibles
--------------------

### Base SAIJ de Normativa Provincial

- **Nombre del archivo:** base-saij-normativa-provincial.csv

- **Descripción del contenido:** base de documentos digitales normativos provinciales: leyes, decretos leyes, textos ordenados, códigos y Constituciones publicados en el Boletín Oficial de la Provincia correspondiente

- **Formato:** CSV delimitado por comas, codificado en UTF-8

- **Rango temporal:** documentos digitales normativos provinciales desde el año 1886 hasta la fecha consignada como "Datos actualizados al"

### Campos del recurso

- **provincia_nombre (string):** nombre de la provincia

- **tipo_norma (string):** clasificación de la norma de acuerdo a la jerarquía normativa (ej. leyes, decisiones administrativas, decretos, etc.)

- **numero_norma (string):** número de la norma o S/N (sin número)

- **estado_vigencia (string):** estado de vigencia de la norma (vigente de alcance general, derogada, individual, solo modificatoria o sin eficacia)

- **fecha (date):** fecha que se sancionó la ley o se emitió el acto administrativo

- **fecha_publicacion (date):** fecha del Boletín Oficial provincial donde se publicó la norma

- **nombre_norma (string):** nombre coloquial de la norma y/o nomenclatura conforme digesto provincial

- **titulo_resumido (string):** descripción específica del contenido de la norma

- **titulo_sumario (string):** descripción genérica del contenido de la norma

- **informacion_digesto (string):** información proveniente de las consolidaciones por digesto a la norma

- **texto_actualizado (string):** link al texto actual vigente de la norma

- **provincia_id (string):** código de la provincia en la que se publicó la norma según la codificación de provincia implementada por INDEC (este campo está disponible desde agosto de 2018)

Notas
-----

[Ley 27.275 - Derecho de Acceso a la Información Pública]( http://servicios.infoleg.gob.ar/infolegInternet/anexos/265000-269999/265949/norma.htm)

Este Conjunto de datos es publicado en el Portal de Datos Abiertos de la Justicia Argentina mediante [Resolución Nº 106 del Ministerio de Justicia y Derechos Humanos](http://datos.jus.gob.ar/resoluciones/RESOL-2017-106-APN-MJ.pdf), del 2 de Febrero de 2017.

