<%@page import="com.mongodb.gridfs.GridFSDBFile"%>
<%@page import="java.io.IOException"%>
<%@page import="com.mongodb.gridfs.GridFSInputFile"%>
<%@page import="com.mongodb.gridfs.GridFS"%>
<%@page import="com.mongodb.*" %>
<%@page import=" java.io.File" %>

<%@page import="java.util.*,java.text.SimpleDateFormat" %>
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style type="text/css">
            <!--
            body {

            }
            -->
        </style>

    </head>
    <body>
        <%
            String DATE_FORMAT_NOW = "dd-MM-yyyy";
            Calendar cal = Calendar.getInstance();
            SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT_NOW);
            String datt = sdf.format(cal.getTime());

            String titl = request.getParameter("tit");
            String na = request.getParameter("n");
            String mes = request.getParameter("m");
            String ur = request.getParameter("i");
            Mongo mongo = new Mongo("localhost", 27017);
            // Creating database instance
            DB db = mongo.getDB("mydb");

            DBCollection collection = db.getCollection("postblog");

            BasicDBObject document = new BasicDBObject();  //Basic DataBase Object(document) will be created

            document.put("TITLE", titl);  

            document.put("NAME", na);
            document.put("MESSAGE", mes); 

            document.put("DATE", datt);

            collection.insert(document);  

            out.println("Done");

        %>
        <a href="blog.jsp">click HOME</a>

    </body>
</html>
