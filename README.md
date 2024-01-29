# Sistema de encriptación/desencriptación de texto con el microprocesador 8085
## Descripción
El proyecto consiste en un programa en ensamblador para el micriprocesador 8085 que permite encriptar y desencriptar un texto predefinido que se muestra en pantalla. Para encriptar el texto se utiliza una rutina que suma 0x07 a cada carácter ASCII. Para desencriptar se resta 0x07. El proceso se controla desde el teclado, pulsando "E" para encriptar y "D" para desencriptar.

La encriptación es extremadamente importante en la actualidad para proteger la confidencialidad y privacidad de la información. Casi toda la comunicación digital hoy en día utiliza algún tipo de encriptación, desde sitios web seguros (HTTPS) hasta aplicaciones de mensajería como WhatsApp.

El proyecto descrito, aunque simple, demuestra los conceptos básicos detrás de la encriptación de datos. Al aplicar una operación matemática sencilla (sumar un valor) a cada carácter, se oculta el contenido original del texto, haciéndolo ilegible para cualquiera que no tenga la clave de desencriptación (en este caso, restar el mismo valor).

Esto mismo se aplica en encriptaciones más robustas y complejas usadas hoy en día. Métodos como AES, RSA, etc. utilizan claves y algoritmos mucho más avanzados, pero la idea es esencialmente la misma: aplicar una transformación reversible a los datos para ocultar su contenido.

La encriptación protege la confidencialidad de información crítica como contraseñas, números de tarjetas de crédito, comunicaciones privadas, etc. Sin encriptación, muchas aplicaciones de Internet y servicios digitales no serían posibles o seguros de usar. Este proyecto sirve como un buen ejemplo didáctico de sus fundamentos.
## Diagrama de flujo
El diagrama de flujo es el siguiente:

<br>

<div align="center">
  <img src="https://github.com/strix07/8085-TextEncryptor/assets/142692042/297998f3-00dd-4e14-9b38-dc03b47396f9" alt="Texto Alternativo de la Imagen">
</div>

<br>

## Descripción del código

- Definición de variables y texto a encriptar
- Bucle principal infinito
- Rutina de interrupción por teclado
  * Lee tecla pulsada
  * Si "E": encripta texto
  * Si "D": desencripta texto
  * Otra tecla: regresa a bucle principal
- Subrutina de encriptación
  * Recorre texto suma 0x07 a cada carácter
  * Detiene al llegar a 0xFF (fin de texto)
- Subrutina de desencriptación
  * Recorre texto resta 0x07 a cada carácter
  * Detiene al llegar a 0xFF (fin de texto)


Se utilizan registros para controlar si se ha encriptado previamente antes de desencriptar.

Simulación
Se probó satisfactoriamente el programa en el simulador Granada:

<br>
<div align="center">
  <img src="https://github.com/strix07/8085-TextEncryptor/assets/142692042/2ece0eed-b3ee-446c-9b8e-4788e9740df0" alt="Texto Alternativo de la Imagen">
</div>
<br>

<div align="center">
  <img src="https://github.com/strix07/8085-TextEncryptor/assets/142692042/0bebefe0-e54a-4465-82b3-4b9178a047fc" alt="Texto Alternativo de la Imagen">
</div>

<br>


Conclusión
El programa cumple con los requerimientos planteados de encriptar y desencriptar un texto utilizando el teclado y rutinas de interrupción en lenguaje ensamblador 8085.

El código completo comentado se encuentra disponible en este repositorio.
