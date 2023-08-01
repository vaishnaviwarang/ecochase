<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="ecochase.Error" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Error Page</title>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <script src="jquery/jquery.3.7.0.js"></script>
    <style>
        h2{
            color:darkred;
        }
        .center{
                position: absolute;
                background-color:antiquewhite;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="center container-fluid" >
            <span style="font-size:xx-large; color:#8b0000">&nbsp;Access denied&nbsp;</span>
            <svg style="vertical-align:text-bottom" xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="#8b0000" class="bi bi-slash-circle" viewBox="0 0 16 16">
                <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                <path d="M11.354 4.646a.5.5 0 0 0-.708 0l-6 6a.5.5 0 0 0 .708.708l6-6a.5.5 0 0 0 0-.708z"/>
            </svg>
        </div>
    </form>
</body>
</html>
