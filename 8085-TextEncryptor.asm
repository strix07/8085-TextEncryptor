		.define 
   		texto E000h			; Dirección comienzo pantalla
   
; -------------------------------
; PROGRAMA PRINCIPAL
; -------------------------------
		.org 1000h
BUCLE:	EI				;Habilito interrupciones
	      JMP BUCLE			;Bucle constante, solo sale con interrupción

; ---------------------------------------------------------------
; RUTINA DE INTERRUPCIÓN QUE DETECTA SI: A)SE PRECIONA TECLA "E" ENCRIPTA, B)SI SE PRCIONA LA TECLA "D"
; DESMCRIPTA Y C)SI SE PRECIONA CUALQUIER OTRA TECLA, REGRESA AL BUCLE PRINCIPAL
; ---------------------------------------------------------------
     		.org 0034h										
		IN 00				;Leemos lo que este en el puerto 0
		CPI 'E'			;Comparamos la tacla presionada con el ASCII de E
		JNZ PASAR1			;Si no es E, ver si es D 
		INR E				;si es E aviso de que encripté
		CALL ENCRIPTA        	;encriptar el texto
		JMP PASAR2			;Luego de encriptar regreso al programa principal
PASAR1:	MOV A, E			;
		CPI  00h			;Reviso si ya he encriptado al menos 1 vez
		JZ PASAR5			;si no he encriptado coloco un codigo ASCCI distinto al de D
		IN 00h			;Si ya encripté leo nuevamente el caracter
		JMP PASAR6 			;Salto a comparar directamente el caracter con el ASCII de D
PASAR5:	MVI A,30h			;Coloco un codigo ASCCI cualquiera distinto del de D
PASAR6:	CPI 'D'			;Comparamos la tacla presionada con el ASCII de D
		JNZ PASAR2			;Si no es D volver al programa principal 
		DCR E				;Si es D aviso que desemcripté
		CALL DESENCRIPTA       	;Encriptar el texto
PASAR2:	RET				;Regrsar al programa principal
 
; ------------------------------------------------
; SUBRUTINA QUE ENCRIPTA EL TEXTO
; ------------------------------------------------
ENCRIPTA:	
		LXI H, texto		;cargamos dirección origen del texto		
repite_1:	MOV A,M			;Copiamos en A el primer caracter
		CPI FFH			;Comprovamos si el codogo ASSCI del caracter no es FFh
		JNZ PASAR3			;SI no es FFh encriptar caracter
		RET				;Si es FFh volver a la rutina de interrupcion 
PASAR3:	ADI 07H 			;Encriptar carater 
		MOV M,A			;Guardamos el caracter encriptado
		INX H				;Incrementar direccion			
		JMP repite_1		;continuar con el siguiente caracter 
				
; -------------------------------------------
; SUBRUTINA QUE DESENCRIPTA EL TEXTO
; -------------------------------------------
DESENCRIPTA:
		LXI H, texto		;cargamos dirección origen 		
repite_2:	MOV A,M			;Copiamos en A el primer caracter
		CPI FFH			;Comprovamos si el codigo ASCII del caracter no es FFh
		JNZ PASAR4			;SI no es FFh desencriptar caracter
		RET				;Si es FFh volver a la rutina de interrupcion
PASAR4:	SUI 07H 			;Desencriptar carater
		MOV M,A			;Guardamos el caracter encriptado
		INX H				;incrementar direccion			
		JMP repite_2		;continuar con el sguiente caracter


			
		
.data E000h
DB 41h, 64h, 72h, 69h, 61h, 6Eh, 20h, 4Dh, 61h, 79h, 6Fh, 72h, 61h, 20h, 43h, 61h, 72h, 6Eh, 65h, 74h, 3Ah, 31h, 36h, 30h, 30h, 31h, 33h, 31h, FFh 						