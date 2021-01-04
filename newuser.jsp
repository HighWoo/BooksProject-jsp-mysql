<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page language="java" import="java.sql.*" %> 
<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page language="java" import="java.sql.*" %> 
<% request.setCharacterEncoding("UTF-8"); %>
<%
String userid = request.getParameter("userid");
String userpw=request.getParameter("userpw"); 
String username = request.getParameter("username");
String sql=null;
Connection conn=null;
Statement st=null; 
ResultSet rs =null;
int cnt=0; 
try {
     Class.forName("org.gjt.mm.mysql.Driver");
    } catch (ClassNotFoundException e){
     out.println(e.getMessage());
    }
%>
<!doctype html>
<center>
<body style="background-color:#becfdf;">
<font color="black"><h2 style="background-color:#7ea9d4;">도서관 관리 시스템<BR>[회원가입]</h2></font>
<HR size=4>
<UL type="disc">
</ul>

<%
try {
     conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookdatabase?useUnicode=true&characterEncoding=UTF-8","root","1234");
     st=conn.createStatement();
     rs = st.executeQuery("select * from idpw where userid= '"+ userid + "'");
   
     if (!(rs.next())) {
  
         
          sql="insert into idpw(userid,userpw,username)";
          sql=sql + " values('"+ userid +"',";
          sql=sql + "'"+ userpw +"','"+ username +"')";
      
      
          cnt = st.executeUpdate(sql); 
          if (cnt >0) 
			  %>
            <script>
		    alert('회원가입이 완료되었습니다'); 
	        location.href="login.html";
			</script>
         <%
       
      } else 
		  %>
		    <script>
		    alert('중복된 아이디 입니다'); 
	        location.href="newuser.html";
			</script>
	       <%
	    
			   
               
		  
		  
           
     st.close();
     conn.close();
     } catch (SQLException e) {
       out.println(e.getMessage());   
     }
%>
<BR><BR>
<HR size=4>
<BR>

<font size="1" color=""><BR><BR>@2016341018 parksangwoo jspwork bookdatabase-idpw/books</font>

</body>
</center>