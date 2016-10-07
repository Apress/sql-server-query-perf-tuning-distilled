<%@ LANGUAGE="VBSCRIPT" %>
<HTML>
<BODY>
<%
Dim StartTime, EndTime, strConn, Conn

'Disable OLE DB session pooling, and use Windows
'authentication
strConn = "Provider=SQLOLEDB;" _
          & "Data Source=DOPEY\DOPEY;" _
          & "Initial Catalog=Northwind;" _
          & "Integrated Security=SSPI;" _
          & "OLE DB Services=0;"
Set Conn = CreateObject("ADODB.Connection")

StartTime = Now()	'Now() is equivalent to the GETDATE()
			'function of SQL Server
For NumberOfConn = 1 to 1000
  Conn.Open strConn	'Open a database connection
  Conn.Close		'Close the database connection
Next
EndTime = Now()

Response.Write "Time to open/close 1000 connections: " _
               & DateDiff("s", StartTime, EndTime) & " seconds."

Set Conn = Nothing
%>
</BODY>
</HTML>
