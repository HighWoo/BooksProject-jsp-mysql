<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import="java.sql.*" %> 
<% request.setCharacterEncoding("UTF-8"); %>
<%
String bookid = request.getParameter("bookid");
String bookname = request.getParameter("bookname");
String bookstate = request.getParameter("bookstate");
                             
String sql=null;                              
Connection con=null;                              
Statement st=null;                                  
                                                        
try {                              
     Class.forName("org.gjt.mm.mysql.Driver");             
     } catch (ClassNotFoundException e){                          
     out.println(e.getMessage());                              
     }                              
                             
                            
try {                              
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookdatabase?useUnicode=true&characterEncoding=UTF-8","root","1234");
    } catch (SQLException e) {                              
    out.println(e);                              
    }                              
try {                              
    st = con.createStatement();                              
                             
                             
    sql = "update books set " ;                              
    sql = sql + "bookname ='" + bookname + "'," + "bookstate ='" + bookstate + "'" ;
    sql = sql + "  where bookid = '" + bookid + "'" ;                     
    st.executeUpdate(sql);                                
    con.close();                              
    st.close();                              
     } catch (SQLException e) {                              
       out.println(e);                              
     }                               
%>                   
<script>
		 alert('수정이 완료되었습니다'); 
	     location.href="bookselectall.jsp";
</script>


