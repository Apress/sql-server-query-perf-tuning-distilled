<%@ LANGUAGE="VBSCRIPT" %>
<HTML>
<BODY>
<%
Dim StartTime, EndTime, strConn, Conn

'Enable OLEDB session pooling, and use SQL Server login
strConn = "Provider=SQLOLEDB;" _
          & "Data Source=<Server Name>;" _
          & "Initial Catalog=Northwind;" _
          & "User ID=<User ID>; Password=<Password>;" _
          & "OLE DB Services=-1;" 'Or remove this flag
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
