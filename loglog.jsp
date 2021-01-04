<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page language="java" import="java.sql.*" %> 
<%
String userid = request.getParameter("userid");
String userpw = request.getParameter("userpw").trim();
String sql="select * from idpw where userid=?" ;

Connection con=null;
PreparedStatement pst=null;    
ResultSet rs=null;

try {
    Class.forName("org.gjt.mm.mysql.Driver");
     } catch (ClassNotFoundException e){
     out.println(e.getMessage());
     }

try {
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookdatabase?useUnicode=true&true&characterEncoding=UTF-8","root","1234");
    } catch (SQLException e) {
    out.println(e);
    }
try {
    pst = con.prepareStatement(sql);
    pst.setString(1,userid);
    rs = pst.executeQuery();  
    %> 
	    
		<!doctype html>
		<center>
		<body style="background-color:#becfdf;">
		<font color="black"><h2 style="background-color:#7ea9d4;">도서관 관리 시스템<BR>[로그인]</h2></font>
       <HR size=4>
      <UL type="disc">
	  </ul>
    <%
    if (!(rs.next())) {%>
	<script>
		alert('등록되지 않은 아이디 입니다'); 
	    location.href="login.html";
	 </script>
      <BR>
    <% } else 
         {
		   if(userpw.equals(rs.getString("userpw"))){%>
			   <script>
		       
	           location.href="Book.html";
			   </script>
			   
			   
			   
           <%}
		   else{%>
			   <script>
		       alert('비밀번호가 다릅니다'); 
	           location.href="login.html";
	           </script>
			   
		   <%}

           
		   
          } 
	
     rs.close();
     con.close();
     pst.close();
     } catch (SQLException e) {
       out.println(e);
     }
	 
%>
<BR>
<font size="1" color=""><br>@2016341018 parksangwoo jspwork bookdatabase-idpw/books</font>
</body></center>