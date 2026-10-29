# Script de Broma: Simulador de Hackeo (Rickroll)

Este es un script escrito en **VBScript** que simula un "hackeo" en sistemas operativos Windows. Utiliza el Bloc de notas, el motor de voz del sistema y la terminal para gastar una broma clásica que termina reproduciendo el famoso video de Rick Astley en arte ASCII.

## 🚀 ¿Qué hace el script?

1. **Configuración silenciosa:** Ejecuta un comando en segundo plano a través de PowerShell para intentar preparar el entorno gráfico y asegurar el volumen del sistema.
2. **Apertura de la interfaz:** Abre el Bloc de notas de Windows en primer plano.
3. **Simulación de escritura y voz:** Empieza a escribir un mensaje de advertencia paso a paso ("Vas a ser hackeado...", seguido de una cuenta regresiva del 3 al 1) mientras el sistema lo reproduce en voz alta usando la API de voz de Windows (SAPI).
4. **El Desenlace (Rickroll):** Abre una ventana de la consola (`cmd.exe`) y utiliza el comando `curl` para conectar con un servidor externo que reproduce la animación de "Never Gonna Give You Up" en formato de texto (ASCII art) directamente en la terminal.

## 🛠️ Requisitos

* **Sistema Operativo:** Windows 10 o Windows 11 (ya que incluye `curl` nativamente en la consola).
* **Conexión a Internet:** Requerida para que el comando `curl ascii.live/rick` funcione correctamente y cargue la animación.

## 💻 Código Fuente

El script utiliza el siguiente código (`broma.vbs`):

Dim shl, voz
Set shl = CreateObject("WScript.Shell")
Set voz = CreateObject("SAPI.SpVoice")

' Configuración inicial en segundo plano
shl.Run "powershell -WindowStyle Hidden -Command ""(New-Object -ComObject Interop.UIAutomationCore.CUIAutomation).GetRootElement() | Out-Null; (New-Object -ComObject WScript.Shell); [Audio]::Volume = 1.0""", 0, True
WScript.Sleep 500

' Abre el Bloc de notas
shl.Run "notepad.exe", 1, False
WScript.Sleep 1000

' Asegura el foco en la ventana del Bloc de notas
shl.AppActivate "Sin título: Bloc de notas"
WScript.Sleep 500

' Escritura y locución del mensaje de hackeo
shl.SendKeys "Vas a ser hackeado..."
voz.Speak "Vas a ser hackeado"
WScript.Sleep 1000
shl.SendKeys "{ENTER}"

' Cuenta regresiva
shl.SendKeys "3..."
voz.Speak "Tres"
WScript.Sleep 500

shl.SendKeys "2..."
voz.Speak "Dos"
WScript.Sleep 500

shl.SendKeys "1..."
voz.Speak "Uno"
WScript.Sleep 1000

' Ejecución del Rickroll en la consola
shl.Run "cmd.exe /k curl ascii.live/rick"

' Limpieza de memoria
Set shl = Nothing
Set voz = Nothing
`

## Creado por rTech
