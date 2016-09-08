<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/user/MasterPage.master" CodeFile="draftdetails.aspx.cs" Inherits="user_draftdetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 68%;">
            <tr>
                <td class="auto-style1" colspan="2">NEW MESSAGE</td>
            </tr>
            <tr>
                <td class="auto-style3">To</td>
                <td>
                    <asp:TextBox ID="txtto" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Subject</td>
                <td>
                    <asp:TextBox ID="txtsub" runat="server" style="margin-left: 0px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">Attach File</td>
                <td class="auto-style4">
                    <asp:HyperLink ID="HyperLink1" runat="server" ImageUrl="~/icon/attachment_blue (2).ico" Visible="False"></asp:HyperLink>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:FileUpload ID="attachfile" runat="server" Visible="False" />
                &nbsp;&nbsp;&nbsp;
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Message</td>
                <td>
                    <asp:TextBox ID="txtmsg" runat="server" Height="108px" TextMode="MultiLine" style="margin-left: 0px" ></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td>
                    <asp:Label ID="lblmsg" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2" colspan="2">
                &nbsp;
                    </td>
            </tr>
            <tr>
                <td class="auto-style3" colspan="2">
                    &nbsp;<asp:Button ID="btn1" runat="server" OnClick="btn1_Click" style="margin-left: 0px" Text="Send" Height="26px" Width="58px" />
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;<asp:Button ID="Button2" runat="server" OnClick="Button2_Click" style="margin-left: 0px" Text="save to draft" />
&nbsp;&nbsp;&nbsp;&nbsp; <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="delete" Width="84px" />
                &nbsp;&nbsp;&nbsp;
                    <asp:LinkButton ID="LinkButton1" runat="server" Font-Underline="False" ForeColor="#0066FF" OnClick="LinkButton1_Click">Back to Drafts</asp:LinkButton>
                </td>
            </tr>
        </table>
</asp:Content>
