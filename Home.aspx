<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="ecochase.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .panel1{
            margin-top:5px;
            margin-left:300px;
            margin-right:auto;

        }
        .panel2{
            margin-left:300px;
            margin-right:auto;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" >
<div class="panel1">
    <asp:Panel ID="PanelUsers" runat="server" visible="false">
            <h4  style="margin-left:375px; color:#1c5e55; ">DASHBOARD</h4>
            Status : <asp:Label ID="lblStatus" runat="server"></asp:Label><br />
            Total Score : <asp:Label ID="lblTotalScore" runat="server" Font-Bold="true" ForeColor="#0066FF"></asp:Label><br />
            <asp:FileUpload ID="FileUpload1" runat="server" /> 
            <asp:Button ID="submitBtn" Width="100px" class="btn btn-danger btn-sm text-light" runat="server" Text="Submit" OnClick="submitBtn_Click" /><br />
            
            <asp:Label ID="lblUploadStatus" runat="server" ForeColor="Red" ></asp:Label><br />
            <asp:GridView ID="GridViewHome" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None"  OnRowCommand="GridViewHome_RowCommand">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
            <asp:BoundField DataField="activityDesc" HeaderText="activityDesc" SortExpression="activityDesc" />
            <asp:BoundField DataField="activityPoints" HeaderText="activityPoints" SortExpression="activityPoints" />
            <asp:ButtonField ButtonType="Button" CommandName="addTask" Text="Complete Task +">
            <ControlStyle BackColor="#36716D" BorderWidth="0px" ForeColor="#F7FAFE" />
            </asp:ButtonField>
            </Columns>
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DBCS %>" SelectCommand="SELECT [activityDesc], [activityPoints] FROM [activityData]"></asp:SqlDataSource><br /> 
    </asp:Panel>
</div>
<div class="panel2">
    <asp:Panel ID="PanelAdmin" runat="server" visible="false">
             <%--ADMIN's Home Page--%>
            <h2 style="margin-left:360px; margin-top:10px; margin-bottom:10px; color:#006699; font-size:x-large; font-weight:400">Administrator Panel</h2>
            <asp:GridView ID="GridViewAdmin" Width="900px" runat="server" CellPadding="3" AutoGenerateColumns="False" BackColor="White" BorderColor="#1E78A7" BorderStyle="Solid" BorderWidth="2px" DataKeyNames="SrNumber" DataSourceID="SqlDataSource2" OnRowCommand="GridViewAdmin_RowCommand" AllowPaging="True" PageSize="5">
                <Columns>
            <asp:BoundField DataField="SrNumber" HeaderText="Request No." InsertVisible="False" ReadOnly="True" SortExpression="SrNumber" >
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
            <asp:BoundField DataField="userName" HeaderText="Usernames" SortExpression="userName" >
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
            <asp:BoundField DataField="activityId" HeaderText="Activity Id" SortExpression="activityId" >
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
            <asp:BoundField DataField="score" HeaderText="Points" SortExpression="score" >
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
            <asp:BoundField DataField="activityDate" HeaderText="Date" SortExpression="activityDate" DataFormatString="{0:d}" >
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
            <asp:ImageField DataImageUrlField="imageUrl" HeaderText="Uploads">
                <ControlStyle BorderWidth="0px" Height="150px" Width="200px" />
                <HeaderStyle HorizontalAlign="Center" />
                <ItemStyle HorizontalAlign="Center" />
            </asp:ImageField>
            <asp:ButtonField ButtonType="Button" CommandName="cmdAccept" Text="Accept">
            <ControlStyle BackColor="#339933" BorderWidth="0px" ForeColor="White" />
                    <ItemStyle HorizontalAlign="Center" />
            </asp:ButtonField>
            <asp:ButtonField ButtonType="Button" CommandName="cmdDecline" Text="Decline">
            <ControlStyle BackColor="#CC0000" BorderWidth="0px" ForeColor="White" />
                    <ItemStyle HorizontalAlign="Center" />
            </asp:ButtonField>
                </Columns>
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#CCCCFF" ForeColor="#333399" HorizontalAlign="Center" />
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
            </asp:GridView>
        <asp:Label ID="temp" runat="server" ></asp:Label>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DBCS %>" SelectCommand="SELECT * FROM [adminModule]"></asp:SqlDataSource>
    </asp:Panel><br />
</div>
</asp:Content>
