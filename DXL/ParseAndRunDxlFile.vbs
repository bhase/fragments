Dim component
Set component = CreateObject("Microsoft.CmdLib")
Dim doors
Set doors = CreateObject("DOORS.Application")

' the dxl file name, passed from commandline
Dim cmdline, i
Do while i <= Wscript.arguments.count - 1
	cmdline = cmdline & Wscript.arguments.Item(i) & " "
	i = i + 1
Loop
Dim dxlfile
dxlfile = Replace(cmdline, "\", "/")

' get the logfile environment variable
doors.runStr("oleSetResult getenv ""DOORSLOGFILE""")
logfilename = doors.result

' check for syntax errors
Dim result
doors.runStr("oleSetResult checkDXLFile """ & dxlfile & """" )
result = doors.result
If Len(result) = 0 Then
	Dim fs, logfile
	Dim oldsize, newsize
	Set fs = CreateObject("Scripting.FileSystemObject")
	Set logfile = fs.GetFile(logfilename)
	oldsize = logfile.Size
	doors.runFile(dxlfile)
	newsize = logfile.Size
	If newsize > oldsize Then
		Dim logstream
		Set logstream = logfile.OpenAsTextStream(1)
		logstream.Skip(oldsize)
		result = logstream.ReadAll
		logstream.Close
	End If
End If
If result <> "" Then Wscript.Echo result
