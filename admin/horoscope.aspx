<%@ Page Language="C#" AutoEventWireup="true" CodeFile="horoscope.aspx.cs" MasterPageFile="~/admin/MasterPage.master" Inherits="admin_horoscope" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 59%;">
            <tr>
                <td class="auto-style1">Sign</td>
                <td>
                    <asp:DropDownList ID="ddlsign" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlsign_SelectedIndexChanged">
                    </asp:DropDownList>
                </td>
                <td rowspan="4">
                    <asp:Image ID="signimage" runat="server" Height="112px" Visible="False" Width="148px" />
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Description</td>
                <td>
                    <asp:TextBox ID="txtdesc" runat="server" TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Date</td>
                <td>
                    <asp:TextBox ID="txtdate" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style1" colspan="2">
                    <asp:Label ID="Label1" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button ID="btn" runat="server" style="margin-left: 193px" Text="Add" Width="60px" OnClick="btn_Click" />
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
</asp:Content>
