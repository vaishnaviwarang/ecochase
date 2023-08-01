<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditProfile.aspx.cs" Inherits="ecochase.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .card{
            margin-top:50px;
            margin-left:auto;
            margin-right:auto;
            margin-bottom:50px;
        }
        .bottomMargin{
            margin-bottom:10px;
        }
        .bottomMargin2{
            margin-bottom:20px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<asp:Panel ID="EditProfile" runat="server" Visible="false" >
<div class="card bg-light" style="width:600px;">
    <div class="card-body" >
        <div class="bottomMargin2" >
        <h4 class="card-card-title text-dark" style="text-align:center; ">Edit Profile </h4>
        </div>
        <div style="text-align:center" class="bottomMargin"><b style="color:#1c5e55 ">
            &nbsp;Username :</b>
            &nbsp;&nbsp;<asp:TextBox ID="txtUsername"  runat="server" Enabled="false"></asp:TextBox>
        </div>
        <div style="text-align:center"><b style="color:#1c5e55">
            First Name :</b>
            &nbsp;&nbsp;<asp:TextBox ID="txtFirstName" class="bottomMargin"  runat="server"></asp:TextBox>
        </div>
        <div style="text-align:center">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"  ControlToValidate="txtFirstName"
            ForeColor="Red" Display="Dynamic"  ErrorMessage="First Name cannot be empty."></asp:RequiredFieldValidator>
        </div>
        <div style="text-align:center"><b style="color:#1c5e55">
            &nbsp;Last Name :</b>&nbsp;
            &nbsp;<asp:TextBox ID="txtLastName"  class="bottomMargin"  runat="server"></asp:TextBox>
        </div>
        <div style="text-align:center">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtLastName"
            ForeColor="Red" Display="Dynamic"  ErrorMessage="Last Name cannot be empty."></asp:RequiredFieldValidator>
        </div>
        
        <div style="text-align:center" class="bottomMargin2"><b style="color:#1c5e55">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Email :&nbsp;&nbsp;</b>
            <asp:TextBox ID="txtEmail" class="bottomMargin"  runat="server"></asp:TextBox>
        </div>
        <div style="text-align:center" >
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtEmail"
             ForeColor="Red"  Display="Dynamic"  ErrorMessage="Email address cannot be empty."></asp:RequiredFieldValidator>
        </div>
        <span style="justify-content:center; display:flex;">
            <asp:Button ID="btnUpdate" Width="100px" class="btn btn-primary btn-sm" runat="server" Text="Update" OnClick="btnUpdate_Click" />
        </span>
        <span style="justify-content:center; display:flex;">
            <asp:Label ID="lblValidate" Display="Dynamic" runat="server" ></asp:Label>
        </span>
   </div>
</div>
</asp:Panel>

</asp:Content>
