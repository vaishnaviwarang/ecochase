<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="ecochase.SignUp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <script src="jquery/jquery.3.7.0.js"></script>
    <style>
        .card{
            margin-top:50px;
            margin-left:auto;
            margin-right:auto;
        }
        .SignUpHdr{
            margin-left:150px;
            margin-right:auto;
            margin-top:10px;
        }
        .marginForSignup{
            margin-bottom:20px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="card shadow bg-light" style="width:600px;">
                <div class="card-body" >  
                    <div class="marginForSignup">
                        <h4 class="card-card-title text-dark" style="text-align:center; margin-top:20px;">Sign Up</h4>
                    </div>
                    <div style="margin-left:145px;" class="SignUpHdr">
                        First Name
                        <asp:TextBox ID="txtFirstname" runat="server"></asp:TextBox><br />
                        <span style="margin-left:90px; display:flex;">  
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1"  ControlToValidate="txtFirstname"
                        runat="server" Display="Dynamic" ErrorMessage="First Name is required." ForeColor="Red"></asp:RequiredFieldValidator></span>
                        
                    </div>
                    <div style="margin-left:147px;" class="SignUpHdr">
                        Last Name
                        <asp:TextBox ID="txtLastname" runat="server"></asp:TextBox><br />
                        <span style="margin-left:90px; display:flex;">  
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtFirstname"
                        runat="server" Display="Dynamic" ErrorMessage="Last Name is required." ForeColor="Red"></asp:RequiredFieldValidator></span>
                    </div>
                    <div  class="SignUpHdr">
                        Username
                        <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox><br />
                        <span style="margin-left:88px; display:flex;">  
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtUsername"
                        ErrorMessage="Username is required." Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator></span>
                    </div>
                    <div style="margin-left:184px;" class="SignUpHdr">
                        Email
                        <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox><br />
                        <span style="margin-left:56px; display:flex;">  
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtEmail"
                        ErrorMessage="email is required." Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator></span>
                    </div>
                    <div style="margin-left:165px;" class="SignUpHdr">
                        Address
                        <asp:DropDownList ID="DropDownListState" runat="server">
                        </asp:DropDownList><br />
                        <span style="margin-left:90px; display:flex;">  
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="DropDownListState"
                        ErrorMessage="PLease select a state" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator></span>
                    </div>
                    <div style="margin-left:81px;" class="SignUpHdr">
                        Enter new Password
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox><br /> 
                        <span style="margin-left:156px; display:flex;">  
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="txtPassword"
                        runat="server" Display="Dynamic" ErrorMessage="enter a password." ForeColor="Red"></asp:RequiredFieldValidator>
                        </span>
                    </div>
                        <span style="justify-content:center; display:flex;">
                            <asp:Label ID="lblValidation" Display="Dynamic" runat="server" ></asp:Label>
                        </span><br />
                        <span style="justify-content:center; display:flex;">                        
                            <asp:Button ID="lblSubmit" Width="100px" style="margin-bottom:20px;" class="btn btn-primary btn-sm" runat="server" Text="SignUp" OnClick="lblSubmit_Click" />
                        </span>
                </div>
            </div>
       </div>      
    </form>
</body>
</html>
