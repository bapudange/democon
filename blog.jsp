
<html>
    <head>
        <title></title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    </head>
    <body>


        <form  method="post">

            <table align="center"> 
                <tr>
                    <td>
                        <h3>WELCOME TO MY BLOG</h3>
                    </td>

                </tr>
            </table>
            <table align="center"> 

                <tr>  SELECT CHOICE </td>
                    <td><a href="insert.html">POST</a>
                    </td>
                </tr>
                <tr>  </td>
                    <td><a href="image.html">IMAGE</a>
                    </td>
                </tr>
                <tr>   </td>
                    <td><a href="video.html">VIDEO</a>
                    </td>
                </tr>

                <tr> 
                    <th scope="row">&nbsp;</th>
                    <td>

                </tr>   
            </table>
        </form>

    </body>
</html>

<%@page import="com.mongodb.gridfs.GridFSInputFile"%>
<%@page import="com.mongodb.gridfs.GridFS"%>
<%@page import="com.mongodb.*" %>
<%@page import="java.util.*,java.text.SimpleDateFormat" %>
<%

    try {
        int cin;
// MongoClient mongoClient = new MongoClient();
        Mongo mongo = new Mongo("localhost", 27017);
        // Creating database instance
        DB db = mongo.getDB("mydb");

        DBCollection collection = db.getCollection("postblog");

        DBCursor doc = collection.find();

        GridFS gfsPhoto = new GridFS(db, "postblog");
        GridFSInputFile gfsFile = null;

        gfsPhoto = new GridFS(db, "postblog");
        DBCursor cursor = gfsPhoto.getFileList();

        while (doc.hasNext()) {
            DBObject object = doc.next();

%>


<table border="0" align="center" cellspacing="2" cellpadding="1"  width="125">
    <h3>IT IS TEXT</h3>
    <tr>
        <td>TITLE<input type="text" name="name1" size="55" style="font-weight:bold"  value="<%=object.get("TITLE")%>"></td></tr>


    <tr><td>POST BY<input type="text" name="subject1" size="55" style="font-weight:bold"  value="<%=object.get("NAME")%>"></td></tr>


    <tr>    <td>MESSAGE<input type="text" name="course1" size="55" style="font-weight:bold" readonly ="readonly" value="<%=object.get("MESSAGE")%>">
        </td></tr>


    <tr><td>DATE<input type="text" name="div1" style="font-weight:bold" readonly ="readonly" value="<%=object.get("DATE")%>"></td></tr>




</table>




<table border="0" align="center" cellspacing="2" cellpadding="1"  width="125">   
    <tr>
        <td>*************************************</td></tr>

</table>
<% } %>
<%
    while (cursor.hasNext()) {
        DBObject object1 = cursor.next();

%>
<table border="0" align="center" cellspacing="2" cellpadding="1"  width="125">
    <h3>IT IS IMAGE INFORMATION</h3>
    <tr>
        <td>FILE NAME<input type="text" name="name1" size="55" style="font-weight:bold"  value="<%=object1.get("filename")%>"></td></tr>


    <tr><td>UPLOAD DATE<input type="text" name="subject1" size="55" style="font-weight:bold"  value="<%=object1.get("uploadDate")%>"></td></tr>


    <tr>    <td>SIZE<input type="text" name="course1" size="55" style="font-weight:bold" readonly ="readonly" value="<%=object1.get("length")%>">
        </td></tr>

<tr>    <td>chunk Size<input type="text" name="course1" size="55" style="font-weight:bold" readonly ="readonly" value="<%=object1.get("chunkSize")%>">
        </td></tr>
<tr>    <td>MD 5<input type="text" name="course1" size="55" style="font-weight:bold" readonly ="readonly" value="<%=object1.get("md5")%>">
        </td></tr>



</table>


<%
        }

    } catch (Exception e) {
    }


%>
