<%@ LANGUAGE="VBSCRIPT" %>
<HTML>
<HEAD><TITLE>Efficient use of Cursors</TITLE></HEAD>
<BODY>
<%
'Cursor constants
Const adUseClient = 3 'Server-side cursor NOT required
Const adOpenStatic = 3 'Dynamic cursor NOT required
Const adLockReadOnly = 1 'Optimistic concurrency model NOT required

'Cursor open
Dim Conn, Rs, strConn
strConn = "Provider=SQLOLEDB;" _
          & "Data Source=<Server Name>;" _
          & "Initial Catalog=Northwind;" _
          & "User ID=<User ID>; Password=<Password>;"
Set Conn = Server.CreateObject("ADODB.Connection")
Conn.Open strConn
Set Rs = Server.CreateObject("ADODB.Recordset")
'Declare and open an API cursor to retrieve shippers
'information
'Cursor location: Client-side
Rs.CursorLocation = adUseClient
'Cursor type: Static; Cursor concurrency: Read-only
Rs.Open "SELECT * FROM Shippers", Conn, adOpenStatic, adLockReadOnly
%>

<!--Display information of all Shippers-->
<TABLE BORDER="1">
  <TR><TH>Shipper ID</TH><TH>Company Name</TH></TR>
  <%Do While Not Rs.EOF%>
  <!--Display information of a shipper by processing one row at a time-->
  <TR><TD><%=Rs("ShipperID")%></TD><TD><%=Rs("CompanyName")%></TD></TR>
  <%
  Rs.MoveNext
  Loop
  %>
</TABLE>

<!--Display Company Name of last Shipper-->
<BR>Company name of the last shipper is
<%Rs.MovePrevious%>
<INPUT TYPE=TEXT VALUE="<%=Rs("CompanyName")%>" SIZE=40>

<%
'Update the last shipper's company name
'Modify the row directly using SQL statement without going
'through the cursor
Conn.execute "UPDATE Shippers " _
         & "SET CompanyName = '" & Left(Rs("CompanyName"),16) & CStr(now) & "' " _
         & "WHERE ShipperID = " & Rs("ShipperID")

'Close the cursor and release all resources assigned to the
'cursor
Rs.close
Set Rs = Nothing
Conn.close
Set Conn = Nothing
%>
</BODY>
</HTML>
