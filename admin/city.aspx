<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/admin/MasterPage.master" CodeFile="city.aspx.cs" Inherits="admin_city" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width:100%;">
            <tr>
                <td class="auto-style2" colspan="2">CITY INFORMATION</td>
            </tr>
            <tr>
                <td class="auto-style1">Select Country</td>
                <td>
                    <asp:DropDownList ID="ddlcountry" runat="server" OnSelectedIndexChanged="ddlcountry_SelectedIndexChanged">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Select State</td>
                <td>
                    <asp:DropDownList ID="ddlstate" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">City Name</td>
                <td class="auto-style4">
                    <asp:TextBox ID="txtcity" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="Label1" runat="server" style="text-align: center"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button ID="btn1" runat="server" style="margin-left: 316px" Text="Submit" OnClick="btn1_Click" />
                </td>
            </tr>
        </table>
</asp:Content>

