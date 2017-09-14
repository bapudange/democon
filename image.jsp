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
String datt=sdf.format(cal.getTime());
         
      String uuid = UUID.randomUUID().toString();
       String titl=request.getParameter("tit");
          String na=request.getParameter("n");
          String mes=request.getParameter("m");
          
          String ur=request.getParameter("i");
          Mongo mongo = new Mongo("localhost", 27017);
                     // Creating database instance
                     DB db = mongo.getDB("mydb");

    DBCollection collection = db.getCollection("postblog");
          
         
         BasicDBObject document = new BasicDBObject();  //Basic DataBase Object(document) will be created
           document.put("Image Path",ur);
                     String imageid=uuid+".png";
                     String imagepath="/home/sai/NetBeansProjects/lastclass/web/pictures/"+ uuid +".png";
                      document.put("TITLE", titl);  //id is the fieldname

                     document.put("NAME", na); 
                     document.put("MESSAGE", mes);  //id is the fieldname

                     document.put("DATE", datt);
                   
                     document.put("savepath",imageid);
                     

		File imageFile = new File(ur);
		GridFS gfsPhoto = new GridFS(db, "postblog");
		GridFSInputFile gfsFile = null;
		try {
			gfsFile = gfsPhoto.createFile(imageFile);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		gfsFile.setFilename(ur);
		gfsFile.save();

                
		GridFSDBFile imageForOutput = gfsPhoto.findOne(ur);
		try {
			imageForOutput.writeTo(imagepath);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	


                     collection.insert(document);  //insert the document
                     

                     out.println("Done");  
                     
         
         %>
         <a href="blog.jsp">click HOME</a>
        
    </body>
</html>
