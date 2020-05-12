# Metagenomica 8.1

En este tutorial hace un ejercicio de metagenómica, que se enfoca en el estudio de un conjunto de materiales genéticos,en éste caso de hongos
 Se ensamblan los reads forward y reverse,se eliminan los primers y secuencias cortas (menores de 200)

Los datos empleados son de ITS2 (hongos) generados por Illumina MiSeq

Las lecturas se ensamblaron forward y reverse y se eliminan los primers y secuencias cortas (menores de 200). En el procesamiento de AMPtk uno parametro importantes está en referencia al filtrado de lecturas según una longitud (pares de bases) establecida, el problema es que establecer éstas longitudes puede ser complejo cuando los pools empleados presentan lecturas con lecturas de distintas longitudes.
Cuando se emplean una min lenght de 200 para nuestras lecturas permitimos que las lecturas con longitudes menores de 300 fueran incluidas en nuestro estudio, lo cual evita en la pérdida de secuencias. 
Posteriormente se les  filtró por calidad y se agruparon las secuencias en OTUs.
Para después indexadas y la base de datos de secuencias de [UNITE] (https://unite.ut.ee/) para asignar la taxonomía de los OTUs





