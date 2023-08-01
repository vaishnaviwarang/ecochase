<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Scoreboard.aspx.cs" Inherits="ecochase.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .grid-container{
            display:grid;
            grid-template-columns: auto auto auto;
        }
        .grid-item{
            padding-left:50px;
            padding-right:50px;
        }
        .hdr{
            margin:0 auto;
            margin-bottom:20px;
            margin-top:5px;
        }
        .divisionA{
            margin-bottom:5px;
            
        }
        .divisionAB{
            margin-top:5px;
            margin-bottom:10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<asp:Panel Visible="false" ID="panelScoreboard" runat="server">
        <div class="hdr">
        <h4  style=" color:#1c5e55; text-align:center">SCOREBOARD </h4>
        </div>
    <div class="grid-container">
        <div class="grid-item">
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:Timer ID="Timer1" runat="server" Interval="2000" OnTick="Timer1_Tick"></asp:Timer>
                <asp:Image ID="BannerPlaceholderImg" runat="server" Height="350px" Width="250px" /><br /><br />
            </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <div class="grid-item">
            <div class="divisionA">
            <asp:TextBox ID="txtSearch" runat="server" style="vertical-align:top" Height="30px"></asp:TextBox>
            <asp:Button ID="btnSearch" runat="server" Width="70" class="btn btn-primary btn-sm" Text="Search" style="vertical-align:top" OnClick="btnSearch_Click" />&nbsp;&nbsp;
                <asp:Button ID="btnGenerateReport" class="btn btn-primary btn-sm" runat="server" Width="150px" Text="Generate My Report" OnClick="btnGenerateReport_Click" /><br />
                <asp:Label ID="lblReportValidation" runat="server" Display="Dynamic"></asp:Label>
                <div Id="hide12" runat="server" class="divisionAB">
                <span style="font-weight:600;" >Start Date :</span>
                <asp:TextBox ID="txtStartDate" style="background-color:lightyellow;" Width="120px" TextMode="Date" runat="server"></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;
                <span style="font-weight:500;">End Date :</span>
                <asp:TextBox ID="txtEndDate" style="background-color:lightyellow;" Width="120px" TextMode="Date" runat="server"></asp:TextBox>
                </div>
            </div>
            <asp:GridView ID="GridViewUsers" AllowPaging="true" PageSize="6" runat="server" Width="425px" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" OnPageIndexChanging="GridViewUsers_PageIndexChanging">
            <AlternatingRowStyle BackColor="White" />
            <FooterStyle BackColor="#CCCC99" />
            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#CCCCFF" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F7DE" />
            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FBFBF2" />
            <SortedAscendingHeaderStyle BackColor="#848384" />
            <SortedDescendingCellStyle BackColor="#EAEAD3" />
            <SortedDescendingHeaderStyle BackColor="#575357" />
            </asp:GridView>
            <asp:GridView ID="GridViewReport" runat="server" Visible="false" Width="425px" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" AllowPaging="True" PageSize="6" OnPageIndexChanging="GridViewReport_PageIndexChanging">
                <AlternatingRowStyle BackColor="White" />
                <FooterStyle BackColor="#CCCC99" />
                <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#CCCCFF" ForeColor="Black" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F7DE" />
                <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#FBFBF2" />
                <SortedAscendingHeaderStyle BackColor="#848384" />
                <SortedDescendingCellStyle BackColor="#EAEAD3" />
                <SortedDescendingHeaderStyle BackColor="#575357" />
            </asp:GridView>
        </div>
        <div class="grid-item">
            <div style="margin-left:65px;" class="divisionA">
            <span style="font-size:large; font-weight:500" class="text-danger">Congratulations! To our TOP 5&nbsp;</span>
            <svg xmlns="http://www.w3.org/2000/svg" style="vertical-align:baseline" width="16" height="16" fill="#fe9e01" class="bi bi-trophy-fill" viewBox="0 0 16 16">
            <path d="M2.5.5A.5.5 0 0 1 3 0h10a.5.5 0 0 1 .5.5c0 .538-.012 1.05-.034 1.536a3 3 0 1 1-1.133 5.89c-.79 1.865-1.878 2.777-2.833 3.011v2.173l1.425.356c.194.048.377.135.537.255L13.3 15.1a.5.5 0 0 1-.3.9H3a.5.5 0 0 1-.3-.9l1.838-1.379c.16-.12.343-.207.537-.255L6.5 13.11v-2.173c-.955-.234-2.043-1.146-2.833-3.012a3 3 0 1 1-1.132-5.89A33.076 33.076 0 0 1 2.5.5zm.099 2.54a2 2 0 0 0 .72 3.935c-.333-1.05-.588-2.346-.72-3.935zm10.083 3.935a2 2 0 0 0 .72-3.935c-.133 1.59-.388 2.885-.72 3.935z"/>
            </svg>
            </div>
            <asp:GridView ID="GridViewTop5" Width="400px" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView> <br />
        </div>
    </div>
</asp:Panel>
</asp:Content>
