<%@ page import="java.util.*" %>
<%@ page import="ProfileBean" %>

<table border="1">

<tr>
<th>ID</th>
<th>Name</th>
<th>Program</th>
<th>Email</th>
</tr>

<%
ArrayList<ProfileBean> list =
(ArrayList<ProfileBean>)request.getAttribute("profiles");

for(ProfileBean p : list){
%>

<tr>
<td><%= p.getStudentId() %></td>
<td><%= p.getName() %></td>
<td><%= p.getProgram() %></td>
<td><%= p.getEmail() %></td>
</tr>

<%
}
%>

</table>
