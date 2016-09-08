<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/user/MasterPage.master" CodeFile="composemsg.aspx.cs" Inherits="user_composemsg" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <table style="width: 60%;">
            <tr>
                <td class="auto-style1" colspan="2">Compose Mail</td>
            </tr>
            <tr>
                <td class="auto-style2">To</td>
                <td>
                    <asp:TextBox ID="txtto" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Subject</td>
                <td>
                    <asp:TextBox ID="txtsub" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Attach File</td>
                <td>
                    <asp:FileUpload ID="attachfile" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Message</td>
                <td>
                    <asp:TextBox ID="txtmsg" runat="server" Height="108px" TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>
                    <asp:Label ID="lblmsg" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2" colspan="2">
                    <asp:Button ID="btn1" runat="server" OnClick="btn1_Click" style="margin-left: 116px" Text="Send" />
                    <asp:Button ID="btn2" runat="server" OnClick="btn2_Click" style="margin-left: 95px" Text="Save" />
                </td>
            </tr>
        </table>
</asp:Content>
