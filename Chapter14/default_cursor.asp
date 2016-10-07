<%@ LANGUAGE="VBSCRIPT" %>
<%
Dim strConn, Conn, Rs
Set Conn = CreateObject("ADODB.Connection")
strConn = "Provider=SQLOLEDB;" _
          & "Data Source=<Server Name>;" _
          & "Initial Catalog=Northwind;" _
          & "User ID=<User ID>; Password=<Password>;"
Conn.Open strConn
Set Rs = CreateObject("ADODB.Recordset")
'Declare & open a database API cursor with default settings
' (forward-only, read-only are the default settings)
Rs.Open "SELECT * FROM t1", Conn
'Consume the rows in the cursor one row at a time
While Not Rs.EOF
  'Fetch a row from the cursor
  Response.Write "c1 = " & Rs.Fields("c1").Value & "<BR>"
  Rs.MoveNext
Wend
'Close the cursor and release all resources assigned to the
'cursor
Rs.Close
Set Rs = Nothing
Conn.Close
Set Conn = Nothing
%>
