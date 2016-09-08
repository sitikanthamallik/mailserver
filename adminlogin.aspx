<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master" CodeFile="adminlogin.aspx.cs" Inherits="admin_adminlogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

            <table style="width: 44%; height: 140px;">
                <tr>
                    <td colspan="2" style="text-align: center; color: #FF5050;">ADMIN LOGIN</td>
                </tr>
                <tr>
                    <td class="auto-style1">
        <asp:Label ID="Label1" runat="server" Text="Admin Id"></asp:Label>
                    </td>
                    <td>
        <asp:TextBox ID="txtadmin" runat="server" style="margin-left: 5px" Width="126px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">
            <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label>
                    </td>
                    <td>
            <asp:TextBox ID="txtpass" runat="server" style="margin-left: 7px" Width="124px" Height="18px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
            <asp:Label ID="Lbl" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
            <asp:Button ID="Button1" runat="server" style="margin-left: 131px" Text="Login" OnClick="Button1_Click" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:LinkButton ID="LinkButton1" runat="server" ForeColor="#669900" OnClick="LinkButton1_Click">Forgot Your Password?</asp:LinkButton>
                    </td>
                </tr>
            </table>
</asp:Content>
