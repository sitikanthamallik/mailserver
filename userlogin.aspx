<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="userlogin.aspx.cs" Inherits="user_userlogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width:69%;">
            <tr>
                <td colspan="2" style="color: #FF0000">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;USER LOGIN INFORMATION</td>
            </tr>
            <tr>
                <td class="auto-style2" style="color: #0066FF">UserId</td>
                <td>
                    <asp:TextBox ID="txtuid" runat="server" style="margin-left: 3px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2" style="color: #3366FF">Password</td>
                <td>
                    <asp:TextBox ID="txtpass" runat="server" style="margin-left: 3px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2" style="color: #3366FF" colspan="2">
                    <asp:Button ID="Button2" runat="server" Text="Login" OnClick="Button2_Click" Width="81px" />
                </td>
            </tr>
            <tr>
                <td class="auto-style2" style="color: #3366FF" colspan="2">
                    <asp:LinkButton ID="LinkButton1" runat="server" ForeColor="#009900" OnClick="LinkButton1_Click">Forgot your Password?</asp:LinkButton>
                </td>
            </tr>
            <tr>
                <td class="auto-style2" style="color: #3366FF" colspan="2">
                    <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            </table>
</asp:Content>
