<%@ Page Language="C#" MasterPageFile="~/user/MasterPage.master" AutoEventWireup="true" CodeFile="trashdetails.aspx.cs" Inherits="user_trashdetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width:100%;">
            <tr>
                <td class="auto-style4" style="background-color: #0033CC; color: #FFFF99; font-weight: bolder; text-align: center;" colspan="2">trash</td>
            </tr>
            <tr>
                <td class="auto-style4" style="background-color: #CCCCCC; ">Send From</td>
                <td style="background-color: #CCCCCC">
                    <asp:Image ID="profilepic" runat="server" Height="94px" Width="113px" />
&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;
                    <asp:Label ID="lblusername" runat="server" Text="(lblname)"></asp:Label>
                &nbsp;&nbsp;&nbsp;
                    <asp:Label ID="lbluserid" runat="server" Text="(lbluserid)"></asp:Label>
                    <asp:Label ID="lblsendto" runat="server" Visible="False"></asp:Label>
&nbsp;<asp:Label ID="lbldate" runat="server" Visible="False"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style6" style="background-color: #CCCCCC; ">Subject</td>
                <td class="auto-style2" style="background-color: #CCCCCC">
                    <asp:Label ID="lblsubject" runat="server"></asp:Label>
                    <asp:Label ID="Label12" runat="server" Text="(no subject)" Visible="False"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style6" style="background-color: #CCCCCC">Attach File</td>
                <td class="auto-style2" style="background-color: #CCCCCC">
                    <asp:HyperLink ID="HyperLink1" runat="server" ImageUrl="~/icon/attachment_blue (2).ico"></asp:HyperLink>
&nbsp;
                    <asp:Label ID="Label9" runat="server" Text="(no files)" Visible="False"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style6" style="background-color: #CCCCCC">Body</td>
                <td class="auto-style5" style="background-color: #CCCCCC">
                    <asp:Label ID="lblbody" runat="server"></asp:Label>
&nbsp;<asp:Label ID="Label11" runat="server" Text="(no message)" Visible="False"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style5" style="background-color: #CCCCCC" colspan="2">
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" style="height: 26px; margin-left: 79px" Text="Delete" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="move message to inbox" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Back to Trash</asp:LinkButton>
&nbsp;&nbsp; </td>
            </tr>
        </table>
</asp:Content>

