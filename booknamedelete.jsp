<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page language="java" import="java.sql.*" %> 
<%
String bookname = request.getParameter("bookname");
Connection con=null;
Statement st=null;    
String sql=null;

try {
   Class.forName("org.gjt.mm.mysql.Driver");
   } catch (ClassNotFoundException e){
     out.println(e.getMessage());
   }

try {
   con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookdatabase?useUnicode=true&characterEncoding=UTF-8","root","1234");
   st = con.createStatement();
   sql = "delete from books where bookname='"+bookname+"';";
   st.executeUpdate(sql);
   con.close();
   st.close();  
   } catch (SQLException e) {
   }
   out.println(bookname);
 %>
<script>
		 alert('삭제가 완료되었습니다'); 
	     location.href="bookselectall.jsp";
</script>


