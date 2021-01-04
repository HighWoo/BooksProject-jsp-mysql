<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page language="java" import="java.sql.*" %> 
<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page language="java" import="java.sql.*" %> 
<% request.setCharacterEncoding("UTF-8"); %>
<%
String bookid = request.getParameter("bookid");
String bookname=request.getParameter("bookname"); 
String bookstate = request.getParameter("bookstate");
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




try {
     conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookdatabase?useUnicode=true&characterEncoding=UTF-8","root","1234");
     st=conn.createStatement();
     rs = st.executeQuery("select * from books where bookid= '"+ bookid + "'");
   
     if (!(rs.next())) {
  
         
          sql="insert into books(bookid,bookname,bookstate)";
          sql=sql + " values('"+ bookid +"',";
          sql=sql + "'"+ bookname +"','"+ bookstate +"')";
      
      
          cnt = st.executeUpdate(sql); 
          if (cnt >0){%> 
			  <script>
		       alert('[등록성공]도서 등록이 완료되었습니다'); 
	           location.href="bookinsert.html";
			   </script>
			   <%}
            
         
       
      } else {%> 
			  <script>
		       alert('[등록실패]이미 등록되어있는 도서 번호입니다'); 
	           location.href="bookinsert.html";
			   </script>
			   <%}
       
           
     st.close();
     conn.close();
     } catch (SQLException e) {
       out.println(e.getMessage());   
     }
%>

