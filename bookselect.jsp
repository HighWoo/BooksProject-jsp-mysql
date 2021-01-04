<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page language="java" import="java.sql.*" %> 
<%
String bookid = request.getParameter("bookid");
String sql="select * from books where bookid=?" ;
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
    pst.setString(1,bookid);
    rs = pst.executeQuery();  
    %>
		<center>
		<body style="background-color:#becfdf;">
		<font color="black"><h1 style="background-color:#7ea9d4;">도서관 관리 시스템<BR>[검색성공]</h1></font>
       <HR size=4>
      <UL type="disc">
	  </ul>
    <%
    if (!(rs.next())) {%>
		<script>
		 alert('[검색실패]등록되지않은 도서번호입니다'); 
	     location.href="bookselect.html";
	    </script>
      
    <% } else 
         {
           %>
           검색하신 자료의 정보입니다<br>수정하시려면 정보를 바꾸신 뒤 수정하기를 누르세요
           <FORM  name=form1 method=post action=bookupdate.jsp> 
		   <BR> 책 번호   : 
           <INPUT type=text name=bookid value="<%=bookid%>"style="WIDTH: 170pt; HEIGHT: 25pt; color:#7ea9d4; background:#11234b; font-size:1.5em;">  
           <BR> 책 이름   : 
           <INPUT type=text name=bookname value="<%=rs.getString("bookname")%>" style="WIDTH: 170pt; HEIGHT: 25pt; color:#7ea9d4; background:#11234b; font-size:1.5em;">
           <BR> 책 상태   :  
           <INPUT type=text name=bookstate value="<%=rs.getString("bookstate")%>"style="WIDTH: 170pt; HEIGHT: 25pt; color:#7ea9d4; background:#11234b; font-size:1.5em;">
		   <BR>
		   <table>
		   <BR>
		   <tr>
           <INPUT type=submit  name=change value="수정하기"  button style="WIDTH: 115pt; HEIGHT: 30pt; color:#7ea9d4; background:#11234b; font-size:1.5em;" >
           &nbsp;
           </FORM>
           <FORM  name=form1 method=post action=bookdelete.jsp?bookid=<%=bookid%>>
           <INPUT type=submit  name=delete value="삭제하기"  button style="WIDTH: 115pt; HEIGHT: 30pt; color:#7ea9d4; background:#11234b; font-size:1.5em;" >

           </FORM>
		   
           </table>
		   </tr>
		   
         <% } 
	
     rs.close();
     con.close();
     pst.close();
     } catch (SQLException e) {
       out.println(e);
     }
	 
%>
<HR size=4>
<BR>
메인메뉴로 돌아가고 싶으신가요?
<A href="Book.html"> 메인으로</A>&nbsp;<br>
다시 검색을 원하시나요?
<A href="bookselect.html"> 검색페이지로 </A>
</body>
</center>