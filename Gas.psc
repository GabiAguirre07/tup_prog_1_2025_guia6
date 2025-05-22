Proceso sin_titulo
	Definir cantdomic,cantdomictot Como Entero;
	Definir cantdesc10, idnum, estactmed,estantmedid,precmcub,cantsum,montsum,montdesc,montfin,rectotal,acummontfin,montot10,montot8,totalrec,recprom Como Real;
	recprom<-0;
	totalrec<-0;
	cantdomictot<-0;
	Escribir " Ingrese el identificador númerico del domicilio: (número negativo para terminzar zona / 0 para terminar todas las zonas) ";
	Leer idnum;
	Escribir " Ingrese el estado actual del medidor de gas en metros cúbicos: ";
	Leer estactmed;
	Escribir " Ingrese el estado anterior del medidor de gas en metros cúbicos: ";
	Leer estantmedid;
	Escribir " Ingrese el precio por metro cúbico: ";
	Leer precmcub;
	Mientras idnum <> 0 Hacer
		rectotal <- 0;
		cantdomic<-0;
		Repetir
			cantsum <- 0;
			montsum <- 0;
			montdesc <- 0;
			montfin <- 0;
			Si idnum % 10 = 4 O idnum % 10 = 9 Entonces
				Escribir " El identificador del medidor es: ",idnum;
				Escribir " El precio por metro cúbico es: ","$",precmcub;
				cantsum <- estactmed - estantmedid;
				Escribir " La cantidad de metros cúbicos suministrados fue: ",cantsum;
				montsum <- cantsum * precmcub;
				Escribir " El monto por suministro es de: ","$",montsum;
				montdesc <- montsum * 0.1;
				Escribir " El monto en concepto de descuento es de: ",montdesc,"%";
				montfin <- montsum - montdesc;
				Escribir " El monto final a pagar es de: ","$",montfin;
				cantdesc10 <- cantdesc10 + 1;
				montot10 <- montfin + montot10;
			Sino
				Si idnum % 10 = 5 Entonces
					Escribir " El identificador del medidor es: ",idnum;
					Escribir " El precio por metro cúbico es: ",precmcub;
					cantsum <- estactmed - estantmedid;
					Escribir " La cantidad de metros cúbicos suministrados fue: ",cantsum;
					montsum <- cantsum * precmcub;
					Escribir " El monto por suministro es de: ","$",montsum;
					montdesc <- montsum * 0.08;
					Escribir " El monto en concepto de descuento es de: ",montdesc,"%";
					montfin <- montsum - montdesc;
					Escribir " El monto final a pagar es de: ","$",montfin;
					montot8 <- montfin + montot8;
				SiNo
					Escribir " El identificador del medidor es: ",idnum;
					Escribir " El precio por metro cúbico es: ",precmcub;
					cantsum <- estactmed - estantmedid;
					Escribir " La cantidad de metros cúbicos suministrados fue: ",cantsum;
					montsum <- cantsum * precmcub;
					Escribir " El monto por suministro es de: ","$",montsum;
					Escribir " No se realiza descuento ";
					montfin <- montsum;
					Escribir " El monto final a pagar es de: ","$",montfin;
				FinSi
				FinSi
			cantdomic <- cantdomic+1;
			rectotal <- montfin + rectotal;
			Escribir " Ingrese el identificador númerico del domicilio: (número negativo para terminzar zona / 0 para terminar todas las zonas) ";
			Leer idnum;
			Escribir " Ingrese el estado actual del medidor de gas en metros cúbicos: ";
			Leer estactmed;
			Escribir " Ingrese el estado anterior del medidor de gas en metros cúbicos: ";
			Leer estantmedid;
			Escribir " Ingrese el precio por metro cúbico: ";
			Leer precmcub;
		Hasta Que idnum <= 0
		Escribir " La cantidad de domicilios procesados es de: ",cantdomic;
		Escribir " La recaudación total de la zona es de: ","$",rectotal;
		Escribir " La cantidad de descuentos realizados del 10% es de: ",cantdesc10;
		Escribir " El monto total recaudado en descuentos de 10% es de: ","$",montot10;
		Escribir " El monto total recaudado en descuentos de 8% es de: ","$",montot8;
		Si (cantdesc10 / cantdomic) * 100 > (((cantdomic / 2) / cantdomic)*100)  Entonces
			Escribir " Se superó la cantidad de descuentos admitida: ";
		FinSi
		cantdomictot<-cantdomic+cantdomictot;
		totalrec <- rectotal + totalrec;
		Escribir " Ingrese el identificador númerico del domicilio: (número negativo para terminzar zona / 0 para terminar todas las zonas) ";
		Leer idnum;
		Escribir " Ingrese el estado actual del medidor de gas en metros cúbicos: ";
		Leer estactmed;
		Escribir " Ingrese el estado anterior del medidor de gas en metros cúbicos: ";
		Leer estantmedid;
		Escribir " Ingrese el precio por metro cúbico: ";
		Leer precmcub;
	FinMientras
	recprom <- totalrec / cantdomictot;
	Escribir " La cantidad de domicilios relevados es de: ",cantdomictot;
	Escribir " La recaudación total de todas las zonas es de: ","$",totalrec;
	recprom <- trunc(recprom*100)/100;
	Escribir " La recaudación promedio por domicilio es de: ","$",recprom;
FinProceso
