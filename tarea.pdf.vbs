Dim shl, voz
Set shl = CreateObject("WScript.Shell")
Set voz = CreateObject("SAPI.SpVoice")

shl.Run "powershell -WindowStyle Hidden -Command ""(New-Object -ComObject Interop.UIAutomationCore.CUIAutomation).GetRootElement() | Out-Null; (New-Object -ComObject WScript.Shell); [Audio]::Volume = 1.0""", 0, True

WScript.Sleep 500

shl.Run "notepad.exe", 1, False
WScript.Sleep 1000

shl.AppActivate "Sin título: Bloc de notas"
WScript.Sleep 500

shl.SendKeys "Vas a ser hackeado..."
voz.Speak "Vas a ser hackeado"
WScript.Sleep 1000
shl.SendKeys "{ENTER}"

shl.SendKeys "3..."
voz.Speak "Tres"
WScript.Sleep 500

shl.SendKeys "2..."
voz.Speak "Dos"
WScript.Sleep 500

shl.SendKeys "1..."
voz.Speak "Uno"
WScript.Sleep 1000

shl.Run "cmd.exe /k curl ascii.live/rick"

Set shl = Nothing
Set voz = Nothing
