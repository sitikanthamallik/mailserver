<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/admin/MasterPage.master" CodeFile="country.aspx.cs" Inherits="admin_country" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <table style="width:100%;">
            <tr>
                <td colspan="2" style="text-align: center">COUNTRY INFORMATION</td>
            </tr>
            <tr>
                <td class="auto-style1">Country Name</td>
                <td>
                    <asp:TextBox ID="txtcountry" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label1" runat="server" ForeColor="#0066FF"></asp:Label>
                    &nbsp;</td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" style="margin-left: 327px" Text="Submit" Width="58px" />
                </td>
            </tr>
        </table>
</asp:Content>
