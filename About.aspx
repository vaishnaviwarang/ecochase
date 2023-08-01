<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="ecochase.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        div.about{
            margin-left:50px;
            margin-right:50px;
            margin-top:20px;
            margin-bottom:40px;
            text-align:center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="panelAboutUs" Visible="false" runat="server">
        <div class="about">
        <h4  style="margin-left:375px; color:#1c5e55; margin-right:400px; margin-bottom:5px; ">Our Mission</h4>
        To build non-profit, ecological, recycling community of people to achieve common goal through our application.<br />
        <h4  style="margin-left:375px; color:#1c5e55; margin-right:410px; margin-top:5px; margin-bottom:5px; ">ABOUT</h4>
        The need to practise environmental protection is rapidly increasing with individual, organizational, goverment
        level for the benifit of natural environment by humans.<br /> Due to the pressure of population and our technology
        the biophysical environment is being degraded, sometimes permanently. This has been recognized by governments<br /> 
        began placing restraints on activities that caused environmental degradation. Academic institutions now offer 
        courses such as environmental studies,environmental<br /> management and environmental engineering that studies the 
        history and methods of environmental protection. In addition, we want to offer a frindly tool to track your <br />
        activities that will surely prove to contribute to a greener planet.
        Afterall, "The color of your skin or the thickness of your wallet should'nt determine your ability to breathe
        clean air".
        </div>
    </asp:Panel>
</asp:Content>
