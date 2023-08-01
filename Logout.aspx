<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Logout.aspx.cs" Inherits="ecochase.WebForm6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
            div.logout{
                margin-left:20%;
                margin-right:20%;
                margin-top:20px;
                margin-bottom:20px;
                text-align:center;
                }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<asp:Panel ID="panelLogout" Visible="false" runat="server">
    <div class="logout">
        Are you sure you want to leave ? 
        <asp:Button ID="Button1" class="btn btn-danger btn-sm" runat="server" Text="Logout" OnClick="Button1_Click" />
    </div>
</asp:Panel>
</asp:Content>
