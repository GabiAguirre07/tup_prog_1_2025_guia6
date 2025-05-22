Proceso sin_titulo
	Definir cantdomic,cantdomic1bloq,domictot,cantzona  Como Entero;
	Definir mayornum, medidornum, medidornummayor, mont1,mont2,mont3, estact,estant,canttotalkw,preckw,prectotal,mont10,montfinal,rectotal,totalrec,recprom,cantkwcons Como Real;
	totalrec<-0;
	domictot<-0;
	medidornummayor <- -9999;
	medidornum<-1;
	Escribir " Ingrese el identificador númerico del medidor: (número negativo para terminar zona / 0 para terminar zonas) ";
	Leer medidornum;
	Escribir " Ingrese el estado actual del medidor en kVatios por hora ";
	Leer estact;
	Escribir "  Ingrese el estado anterior del medidor en kVatios por hora: (número negativo para terminar todas las zonas) ";
	Leer estant;
	Mientras medidornum <> 0 Hacer
		cantdomic<-0;
		cantdomic1bloq<-0;
		rectotal<-0;
		Repetir
			prectotal<-0;
			mont1<-0;
			mont2<-0;
			cantkwcons<-0;
			mont3<-0;
			mont10<-0;
			montfinal<-0;
			cantkwcons <- estact - estant;
			Si cantkwcons > 1000  Entonces
				prectotal <- 500 * 43.5 + 500 * 85 + (cantkwcons - 1000) * 150;
				mont1 <- 500 * 43.5;
				mont2 <- 500 * 85;
				mont3 <- (cantkwcons-1000) * 150;
				Escribir " El identificador del medidor es: ",medidornum;
				Escribir " La cantidad total de kW/h consumidos es de: ",cantkwcons;
				Escribir " El precio del kW/h aplicado en el bloque 1 es de $43.5 ";
				Escribir " El precio del kW/h aplicado en el bloque 2 es de $85 ";
				Escribir " El precio del kW/h aplicado en el bloque 3 es de $150 ";
				Escribir " El monto cobrado en el bloque 1 es de: ","$",mont1;
				Escribir " El monto cobrado en el bloque 2 es de: ","$",mont2;
				Escribir " El monto cobrado en el bloque 3 es de: ","$",mont3;
				Escribir " El precio total del consumo de todos los bloques es de: ","$",prectotal;
				mont10 <- (prectotal * 1.1) - prectotal;
				mont10 <- trunc (mont10*100)/100;
				Escribir " El monto del impuesto aplicado es: ","$",mont10;
				montfinal <- prectotal + mont10;
				montfinal <- trunc (montfinal*100)/100;
				Escribir " El monto final a pagar es: ","$",montfinal;
				rectotal <- montfinal + rectotal;
				Si cantkwcons > medidornummayor Entonces
					medidornummayor <- cantkwcons;
					mayornum <- medidornum;
				FinSi
			FinSi
			Si cantkwcons >= 500 Y cantkwcons <= 1000 Entonces
				prectotal <- 500 * 43.5 + (cantkwcons-500) * 85;
				mont1 <- 500 * 43.5;
				mont2 <- (cantkwcons-500) * 85;
				Escribir " El identificador del medidor es: ",medidornum;
				Escribir " La cantidad total de kW/h consumidos es de: ",cantkwcons;
				Escribir " El precio del kW/h aplicado en el bloque 1 es de $43.5 ";
				Escribir " El precio del kW/h aplicado en el bloque 2 es de $85 ";
				Escribir " El monto cobrado en el bloque 1 es de: ","$",mont1;
				Escribir " El monto cobrado en el bloque 2 es de: ","$",mont2;
				Escribir " El precio total del consumo de todos los bloques es de: ","$",prectotal;
				mont10 <- (prectotal * 1.1) - prectotal;
				Escribir " El monto del impuesto aplicado es: ","$",mont10;
				montfinal <- prectotal + mont10;
				Escribir " El monto final a pagar es: ","$",montfinal;
				rectotal <- montfinal + rectotal;
				Si cantkwcons > medidornummayor Entonces
					medidornummayor <- cantkwcons;
					mayornum <- medidornum;
				FinSi
			FinSi
			Si cantkwcons < 500 Entonces
				prectotal <- cantkwcons * 43.5;
				mont1 <- cantkwcons * 43.5;
				Escribir " El identificador del medidor es: ",medidornum;
				Escribir " La cantidad total de kW/h consumidos es de: ",cantkwcons;
				Escribir " El precio del kW/h aplicado en el bloque 1 es de $43.5 ";
				Escribir " El monto cobrado en el bloque 1 es de: ","$",mont1;
				Escribir " El precio total del consumo de todos los bloques es de: ","$",prectotal;
				mont10 <- (prectotal * 1.1) - prectotal;
				Escribir " El monto del impuesto aplicado es: ","$",mont10;
				montfinal <- prectotal + mont10;
				Escribir " El monto final a pagar es: ","$",montfinal;
				cantdomic1bloq <- cantdomic1bloq + 1;
				rectotal <- montfinal + rectotal;
				Si cantkwcons > medidornummayor Entonces
					medidornummayor <- cantkwcons;
					mayornum <- medidornum;
				FinSi
			FinSi
			cantdomic<- cantdomic + 1;
			Escribir " Ingrese el identificador númerico del medidor: (número negativo para terminar zona / 0 para terminar zonas) ";
			Leer medidornum;
			Escribir " Ingrese el estado actual del medidor en kVatios por hora ";
			Leer estact;
			Escribir "  Ingrese el estado anterior del medidor en kVatios por hora: (número negativo para terminar todas las zonas) ";
			Leer estant;
		Hasta Que medidornum < 0 
			cantzona<-cantzona+1;
			Escribir " La cantidad de domicilios procesados en la zona ",cantzona, " es de ",cantdomic;
			Escribir " La cantidad de domicilios que no pasaron el primer bloque es de: ",cantdomic1bloq;
			Escribir " La recaudación total de la zona es de: ","$",rectotal;
			Si (cantdomic1bloq/cantdomic) * 100 < 30 Entonces
				Escribir " Enviar resumen de  zona ",cantzona, " a la Gerencia técnica";
			FinSi
		totalrec <- rectotal+totalrec;
		domictot <- cantdomic + domictot;
		Escribir " Ingrese el identificador númerico del medidor: (número negativo para terminar zona / 0 para terminar zonas) ";
		Leer medidornum;
		Escribir " Ingrese el estado actual del medidor en kVatios por hora ";
		Leer estact;
		Escribir "  Ingrese el estado anterior del medidor en kVatios por hora: (número negativo para terminar todas las zonas) ";
		Leer estant;
	FinMientras
	Escribir " La cantidad de domicilios relevados es de: ",domictot;
	Escribir " La recaudación total es de: ","$",totalrec;
	recprom <- totalrec/domictot;
	recprom <- trunc (recprom*100)/100;
	Escribir " La recaudación promedio por domicilio es de: ","$",recprom;
	Escribir " El identificador númerico del domicilio que tuvo mayor consumo es: ",mayornum;
FinProceso
