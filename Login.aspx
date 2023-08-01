<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ecochase.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <script src="jquery/jquery.3.7.0.js"></script>
    <style>
        .horizontal-space{
            margin:3px;
        }
        .spaceBetweenLogin{
            margin:3px;
        }
        .space2{
            margin-bottom:4px;
        }
        .LoginHdr{
            margin:30px;
        }
        .card{
            margin-top:50px;
            margin-left:auto;
            margin-right:auto;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="card shadow bg-light" style="width:600px;">
            <div class="card-body" >
                <div class="LoginHdr">
                    <h4 class="card-card-title text-dark" style="text-align:center">ecochase&#8482; Login</h4>
                </div>
                <div class="horizontal-space">
                    <span style="justify-content:center; display:flex;">Username &nbsp;&nbsp;
                    <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox></span>
                    <div class="spaceBetweenLogin">
                        <span style="justify-content:center; display:flex;">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1"  ControlToValidate="txtUsername"
                        runat="server" ErrorMessage="Enter a valid username." ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        </span>
                    </div>
                </div>
                <div class="space2">
                    <span style="justify-content:center; display:flex;">Password &nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox></span>
                    <div class="spaceBetweenLogin">
                        <span style="justify-content:center; display:flex;">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtPassword"
                            runat="server" ErrorMessage="Enter correct password." ForeColor="Red"></asp:RequiredFieldValidator>
                        </span>
                    </div>
                </div>
                    <span style="justify-content:center; display:flex;"><asp:Button ID="btnLogin" Width="100px" class="btn btn-primary btn-sm" runat="server" Text="Login" OnClick="btnLogin_Click" /></span><br />
                    <span style="justify-content:center; display:flex;"><asp:Label ID="txtValidation" runat="server"></asp:Label></span><br />
                    <span style="justify-content:center; display:flex;"><a href="SignUp.aspx">Click here to register.</a>
                    If you do not have access to username or password.</span>
            </div>
        </div>
    </form>
</body>
</html>
