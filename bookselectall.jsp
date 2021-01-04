<!doctype html>
<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page language="java" import="java.sql.*" %> 
<% request.setCharacterEncoding("UTF-8"); %>
<%
Connection con= null;
Statement st =null;
ResultSet rs =null;

try {
    Class.forName("org.gjt.mm.mysql.Driver");
    } catch (ClassNotFoundException e ) {
      out.println(e);
    }
 
try{
   con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookdatabase?useUnicode=true&characterEncoding=UTF-8","root","1234");
  } catch (SQLException e) {
    out.println(e);
  }
 
try {
   st = con.createStatement();
   rs = st.executeQuery("select * from books order by bookid");
%>

<HTML>
<center>
<BODY style="background-color:#becfdf;">
 <H1 style="background-color:#7ea9d4;">도서관 관리 시스템<BR>[전체 도서 정보 보기]</H1>
 
 <HR size=4>
 <UL type="disc">
 </ul>
 현재 도서관에서 보유하고 있는 전체 도서의 목록입니다<BR><BR><BR>
<TABLE border=1 button style="color:#7ea9d4; background:#11234b;font-size:1.3em;">
   <TR>
    <TH>도서 번호</TH>
    <TH>도서 제목</TH>
    <TH>대출 여부</TH>
   </TR>
  <% if (!(rs.next()))  {%>

      <TR><TD colspan=4>등록된도서가없습니다.</TD></TR>

  <%  } else {
       do {
          out.println("<TR>");
          out.println("<TD>" + rs.getString("bookid") + "</TD>");
          out.println("<TD>" + rs.getString("bookname") + "</TD>");
          out.println("<TD>" + rs.getString("bookstate") + "</TD>");
          out.println("</TR>");
        }while(rs.next());
     }
     rs.close();
     st.close();
     con.close();
  } catch (SQLException e) {
    System.out.println(e);
  }

%>
</TABLE>
<BR><BR>
<HR size=4>
  메인메뉴로 돌아가고 싶으신가요?
  <A href="Book.html"><font size="4" color="black">[HOME]</font></A><br><br>
  도서를 수정하고 싶으신가요?
  <A href="bookselect.html"><font size="4" color="black">[도서수정]</font></A><br><br>
  <font size="1" color="">@2016341018 parksangwoo jspwork bookdatabase-idpw/books</font>
</BODY>
</center>
</HTML>