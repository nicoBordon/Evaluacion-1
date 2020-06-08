Proceso  pizeriaPepito
	Definir  opcion,PrecioxTipo,CantVentaxTipo,CantTiposEntregas,CantTipoCobro,tp,te,tc,cantidadP,TotalTC,ttlRec,i,ttlEntg   Como Entero ;
	Definir  TiposPizas,TiposEntregas,TiposCobro Como Cadena;
	Dimension TiposPizas[4];//arreglo con los nombre de las variedades de pizas
	Dimension PrecioxTipo[4];//arreglo con los precios de las pizas
	Dimension TiposEntregas[3];//arreglo con los tipos de entrega de las pizas
	Dimension TiposCobro[3];//arreglo con los medios de cobro
	Dimension CantVentaxTipo[4];//arreglo con las cantidades de pizas vendidas por tipo
	Dimension CantTiposEntregas[3];//arreglo con la cantidad de ventas registradas segun el tipo de venta comer en 1-local 2-para llevar 3-envio a domicilio 
	Dimension CantTipoCobro[3];//arreglo con la cantidad de ventas por tipo de cobro Efvo, tarjeta Debito, tarjeta Credito.
	//inicializamos arreglos con datos fijos
	PrecioxTipo[0]<- 150;
	PrecioxTipo[1]<- 200;
	PrecioxTipo[2]<- 220;
	PrecioxTipo[3]<- 170;
	
	TiposPizas[0]<-"Muzarella";
	TiposPizas[1]<-"Especial con morron";
	TiposPizas[2]<-"Calabresa";
	TiposPizas[3]<-"Fugazzetta";
	CantVentaxTipo[0]<-0;
	CantVentaxTipo[1]<-0;
	CantVentaxTipo[2]<-0;
	CantVentaxTipo[3]<-0;
	
	TiposEntregas[0]<-"Consumo en local";
	TiposEntregas[1]<-"Pedido para llevar";
	TiposEntregas[2]<-"Envio a domicilio";
	CantTiposEntregas[0]<-0;
	CantTiposEntregas[1]<-0;
	CantTiposEntregas[2]<-0;
	
	TiposCobro[0]<-"Efectivo";
	TiposCobro[1]<-"Tarjeta Debito";
	TiposCobro[2]<-"Tarjeta Credito";
	CantTipoCobro[0]<-0;
	CantTipoCobro[1]<-0;
	CantTipoCobro[2]<-0;                                      
	opcion <-0;
	Repetir
		
		opcion<-MenuPizeria(opcion);
		Segun opcion Hacer
			1:
				
				tp <-0;//variable para guardar el tipo de piza seleccionado
				te <-0;//variable para guardar el tipo de entrega seleccionado
				tc <-0;//variable para guardar el tipo de entrega seleccionado
				tp<-SeleccionarTipodePizas(TiposPizas,PrecioxTipo);
				si tp>-1 Entonces
					  cantidadP<-0;
					Repetir
						Escribir "Ingrese la cantidad de pizas vendidas *como maximo 10 unidades por venta.";
						Leer cantidadP;//variable para guardar la cantidad vendida
						si cantidadP>10|cantidadP<0 entonces
							Escribir "Ingrese una cantidad valida.";
						FinSi
					Hasta Que cantidadP>0&cantidadP<11
					te<- seleccionarTipodeEntregas(TiposEntregas) ; 
					tc<-seleccionarTipodeCobro(TiposCobro);
					
					CantVentaxTipo[tp]<-cantidadP;
					CantTiposEntregas[te]<-CantTiposEntregas[te]+1;
					CantTipoCobro[tc]<-CantTipoCobro[tc]+1;
					Escribir "Venta registrada con exito presione una tecla para continuar.";
					Esperar Tecla;
				FinSi
			2:
				
				TotalTC<-0;
				ttlRec<-0;
				ttlRec<-totalRecaudado(PrecioxTipo,CantVentaxTipo);
				TotalTC<-totalTipoCobro(CantTipoCobro);
				Escribir "El total Recuadado es $",ttlRec,".";
				Escribir  "Distribuidos en el siguiente porcentaje: ";
				Para i<-0 Hasta 2 Con Paso 1 Hacer
					Escribir "Cobro en ",TiposCobro[i]," ",(CantTipoCobro[i]*100) 	/TotalTC,"%";
				FinPara
				Escribir "Fin del reporte. Presiones una tecla para continuar";
				Esperar Tecla;
			3:
				Escribir "Se registraron un total de ", totalVendidos(CantVentaxTipo)," pizas vendidas.";
				Escribir "Distribuido de la siguiente manera:";
				Para i<-0 Hasta 3 Con Paso 1 Hacer
					Escribir TiposPizas[i]," ",CantVentaxTipo[i]," unidades vendidas.";
				FinPara
				Escribir "Fin del reporte. Presiones una tecla para continuar";
				Esperar Tecla;
			4:
				ttlEntg <-0;
				ttlEntg<-totalEntregado(CantTiposEntregas);
				Escribir "Las entregas se distribuyeron de la siguiente manera:" ;
				Para i<-0 Hasta 2 Con Paso 1 Hacer
					Escribir TiposEntregas[i]," ", (CantTiposEntregas[i]*100)/ttlEntg,"%"; 
				FinPara
				Escribir "Fin del reporte. Presiones una tecla para continuar";
				Esperar Tecla;		
			De Otro Modo:
		Escribir "Gracias por usar el sistema de pizeria Pepito";
		FinSegun
	Hasta Que opcion=0
FinProceso
SubProceso opcion <- MenuPizeria(opcion)
	Definir  flag como Logico;
	flag<-Verdadero;
	Limpiar Pantalla;
	Mientras flag = Verdadero Hacer
	Escribir "Pizeria Pepito";
	Escribir "1) Registrar nueva venta.";
	Escribir "2) Totales de recuadacion.";
	Escribir "3) Cantidad vendidad Por tipo.";
	Escribir "4) Porcentaje de tipo de entrega(consumo en local/para llevar/con envio).";
	Escribir "0) Salir";
	Escribir "Ingrese una Opcion.";Leer opcion;
	si opcion >=0 & opcion<=5 Entonces
		flag <- Falso;
	SiNo
		Limpiar Pantalla;
		Escribir "**Opcion invalida ingrese otra opcion**.";
	FinSi
	FinMientras
FinSubProceso
SubProceso tp<- SeleccionarTipodePizas(TiposPizas,PrecioxTipo)
	Definir  flag como Logico;
	Definir  tp como entero;
	flag<-Verdadero;
	
	Mientras flag = Verdadero Hacer
		Escribir "Tipo de Pizzas";
		Definir  i Como Real;
		Para i<-0 Hasta 3 Con Paso 1 Hacer
			Escribir i+1,") ", TiposPizas[i],". Precio $",PrecioxTipo[i];
		FinPara
		Escribir "0) Cancelar";
		Escribir "Ingrese una Opcion.";Leer tp;
		si tp >=0 & tp<=5 Entonces
			flag <- Falso;
			tp<-tp-1;
		SiNo
			Limpiar Pantalla;
			Escribir "**Opcion invalida ingrese otra opcion**.";
		FinSi
	FinMientras
FinSubProceso
SubProceso te <- seleccionarTipodeEntregas(TipoEntregas)
	Definir  flag como Logico;
	Definir  te como Numero;
	flag<-Verdadero;
    Definir  i Como Real;
	Mientras flag = Verdadero Hacer
		Escribir "Tipo de Entrega";
		Para i<-0 Hasta 2 Con Paso 1 Hacer
			Escribir i+1,") ", TipoEntregas[i],".";
		FinPara
		Escribir "Ingrese una Opcion.";Leer te;
		si te>=0 & te<=4 Entonces
			flag <- Falso;
			te<-te-1;
		SiNo
			Limpiar Pantalla;
			Escribir "**Opcion invalida ingrese otra opcion**.";
		FinSi
	FinMientras
FinSubProceso
SubProceso tc <- seleccionarTipodeCobro(TipoCobro)
	Definir  flag como Logico;
	Definir  tc como Numero;
	Definir  i Como Real;
	flag<-Verdadero;
	Mientras flag = Verdadero Hacer
		Escribir "Cobro realizado en";
		Para i<-0 Hasta 2 Con Paso 1 Hacer
			Escribir i+1,") ", TipoCobro[i],".";
		FinPara
		Escribir "Ingrese una Opcion.";Leer tc;
		si tc>=0 & tc<=4 Entonces
			flag <- Falso;
			tc<-tc-1;
		SiNo
			Limpiar Pantalla;
			Escribir "**Opcion invalida ingrese otra opcion**.";
		FinSi
	FinMientras
FinSubProceso	
SubProceso totalVentas  <- totalVendidos(CantVentaxTipo)//total de pizas vendidas
	Definir  totalVentas como Numero;
	totalVentas<- CantVentaxTipo[0]+CantVentaxTipo[1]+CantVentaxTipo[2]+CantVentaxTipo[3];
FinSubProceso
SubProceso totalEntregas  <- totalEntregado(CantTiposEntregas)//total de pizas vendidas
	Definir  totalEntregas como Numero;
	totalEntregas<- CantTiposEntregas[0]+CantTiposEntregas[1]+CantTiposEntregas[2];
FinSubProceso	
SubProceso  totalR <- totalRecaudado(PrecioxTipo,CantVentaxTipo)
	Definir  totalR,i como Numero;
	totalR<-0;
	Para i<-0 Hasta 3 Con Paso 1 Hacer
		totalR<-(PrecioxTipo[i]*CantVentaxTipo[i])+totalR;		
	FinPara
FinSubProceso
SubProceso  totalTC<-totalTipoCobro(CantTipoCobro)
	Definir  totalTC como Numero;
	totalTC<-CantTipoCobro[0]+CantTipoCobro[1]+CantTipoCobro[2];
FinSubProceso
