<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>

<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
<FONT size = 5 COLOR="#0000FF">
        Instance 1 <br/><br/>
        </FONT>
       
        <hr/>

        <FONT size = 5 COLOR="#CC0000">
         <br/>
        Session Id : <%=request.getSession().getId()%> <br/>
        Is it New Session : <%=request.getSession().isNew()%><br/>
        Session Creation Date : <%=new Date(request.getSession().getCreationTime())%><br/>
        Session Access Date : <%=new Date(request.getSession().getLastAccessedTime())%><br/><br/>
        </FONT>
        <b>Data List </b><br/>
        <hr/>
        
        
        <ul>
        <%
                String sName = request.getParameter("sName");
                List<String> listOfName = (List<String>) request.getSession().getAttribute("Name");
                if (listOfName == null) {
                    listOfName = new ArrayList<String>();
                    request.getSession().setAttribute("Name", listOfName);
                }
                if (sName != null) {
                    listOfName.add(sName);
 		    request.getSession().setAttribute("Name", listOfName);
                }
                for (String name : listOfName) {
                    out.println("<li>"+name + "</li><br/>");
                }
            
        %>
   </ul>
   <hr/>
   <form action="index.jsp" method="post">
      Name <input type="text" name="sName" />
   <input type="submit" value="Add to Cart"/>
   </form>
  <hr/>
 </body>
</html>

