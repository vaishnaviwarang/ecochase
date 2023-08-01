<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"  CodeBehind="ContactUs.aspx.cs" Inherits="ecochase.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .fieldset{
            border-color:red;
            border-style: solid;
            border:2px;
            margin-left:auto;
            margin-right:auto;
            margin-top:20px;
        }
        .tablealign{
            margin-left:70px;
        }
        td{
            padding-bottom:5px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <fieldset class="fieldset border rounded-3 p-3 text-center"  style="width:500px" >
          <legend class="float-none w-auto px-3" style="color:#1c5e55;">Contact Us</legend>
            <table class="tablealign">
                <tr >
                    <td class="text-success" >
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Name:</b>
                    </td>
                    <td >
                        <asp:TextBox ID="txtName" Width="200px" runat="server"></asp:TextBox>
                    </td>
                    <td >
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ErrorMessage="Name is required."
                             ControlToValidate="txtName" 
                            Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="text-success" >
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Email:</b>
                    </td>
                    <td >
                        <asp:TextBox ID="txtEmail" Width="200px" runat="server"></asp:TextBox>
                    </td>
                    <td >
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                            ErrorMessage="Email is required."
                             ControlToValidate="txtEmail"  Display="Dynamic"
                            Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                            ErrorMessage="Please enter a valid email." Display="Dynamic"
                            ControlToValidate="txtEmail" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="text-success" >
                        &nbsp;&nbsp;<b>Subject:</b>
                    </td>
                    <td >
                        <asp:TextBox ID="txtSubject" Width="200px" runat="server"></asp:TextBox>
                    </td>
                    <td >
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                            ErrorMessage="Subject is required."
                             ControlToValidate="txtSubject" 
                            Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="text-success" style="vertical-align:top" >
                        <b>Comments:</b>&nbsp;&nbsp;&nbsp;
                    </td>
                    <td style="vertical-align:top">
                        <asp:TextBox ID="txtComments" Width="200px" runat="server" Rows="5" TextMode="MultiLine"></asp:TextBox>
                    </td>
                    <td style="vertical-align:top">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                            ErrorMessage="Comments are required."
                             ControlToValidate="txtComments" 
                            Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <asp:ValidationSummary ID="ValidationSummary1" HeaderText="Please fix the errors before sending." ForeColor="Red" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <asp:Label ID="lblStatus" runat="server" Font-Bold="true"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="3" class="text-center">
                        <asp:Button ID="btnSubmit" Width="100px" class="btn btn-success btn-sm" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                    </td>
                </tr>
            </table>
        </fieldset><br />
        <h6 class="text-success" style="text-align:center">Send us your suggestions. Your valueable feedback is much appreciated!</h6>
        <br />
        <br />
    </div>

</asp:Content>
