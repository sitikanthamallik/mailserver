<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/user/MasterPage.master" CodeFile="sentmsgdetails.aspx.cs" Inherits="user_sentmsgdetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="background-color: #66CCFF; text-align: center; color: #000000; font-weight: bold;">
    
        MESSAGE DETAILS</div>
    <div>
    
        <table style="width:100%;">
            <tr>
                <td class="auto-style4" style="background-color: #CCFFFF; color: #0066FF;">Send To</td>
                <td style="background-color: #CCFFFF">
                    <asp:Image ID="profilepic" runat="server" Height="94px" Width="113px" />
&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;
                    <asp:Label ID="lblusername" runat="server" Text="(lblname)"></asp:Label>
                &nbsp;&nbsp;&nbsp;
                    <asp:Label ID="lbluserid" runat="server" Text="(lbluserid)"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style5" style="background-color: #CCFFFF; color: #0066FF;">Subject</td>
                <td class="auto-style2" style="background-color: #CCFFFF">
                    <asp:Label ID="lblsubject" runat="server"></asp:Label>
                    <asp:Label ID="Label12" runat="server" Text="(no subject)" Visible="False"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style5" style="color: #0066FF; background-color: #CCFFFF">Attach File</td>
                <td class="auto-style2" style="background-color: #CCFFFF">
                    <asp:HyperLink ID="HyperLink1" runat="server" ImageUrl="~/icon/attachment_blue (2).ico"></asp:HyperLink>
&nbsp;
                    <asp:Label ID="Label9" runat="server" Text="(no files)" Visible="False"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style5" style="color: #0066FF; background-color: #CCFFFF">Body</td>
                <td class="auto-style2" style="background-color: #CCFFFF">
                    <asp:Label ID="lblbody" runat="server"></asp:Label>
&nbsp;<asp:Label ID="Label11" runat="server" Text="(no message)" Visible="False"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style7" colspan="2" style="background-color: #CCFFFF">
                    <asp:Button ID="btnforward" runat="server" Text="Forward" OnClick="btnforward_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnreply" runat="server" Text="Reply" Width="58px" OnClick="btnreply_Click" />
                    &nbsp;&nbsp;
                    <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Back to Sent messages</asp:LinkButton>
                </td>
            </tr>
            <tr>
                <td class="auto-style4" style="color: #0066FF; background-color: #CCFFFF">
                    <asp:Label ID="lblsend" runat="server" Text="Send To" Visible="False"></asp:Label>
                </td>
                <td style="background-color: #CCFFFF">
                    <asp:Label ID="lblsendto" runat="server" Visible="False"></asp:Label>
                    <asp:TextBox ID="txtsendto" runat="server" Visible="False"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style6" style="color: #0066FF; background-color: #CCFFFF">
                    <asp:Label ID="lblsub" runat="server" Text="Subject" Visible="False"></asp:Label>
                </td>
                <td class="auto-style3" style="background-color: #CCFFFF">
                    <asp:TextBox ID="txtsub" runat="server" Visible="False"></asp:TextBox>
                    &nbsp;<asp:Label ID="Label15" runat="server" Text="(no subject)" Visible="False"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style4" style="color: #0066FF; background-color: #CCFFFF">
                    <asp:Label ID="lblattachfile" runat="server" Text="Attach File" Visible="False"></asp:Label>
                </td>
                <td style="background-color: #CCFFFF">
                    <asp:FileUpload ID="attachfile" runat="server" Visible="False" />
&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:HyperLink ID="HyperLink2" runat="server" ImageUrl="~/icon/attachment_blue (2).ico" Visible="False">HyperLink</asp:HyperLink>
                    &nbsp;
                    <asp:Label ID="Label14" runat="server" Text="(no file)" Visible="False"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style4" style="color: #0066FF; background-color: #CCFFFF">
                    <asp:Label ID="Label13" runat="server" Text="Body" Visible="False"></asp:Label>
                </td>
                <td style="background-color: #CCFFFF">
                    <asp:TextBox ID="txtbody" runat="server" Height="132px" TextMode="MultiLine" Visible="False"></asp:TextBox>
&nbsp;<asp:Label ID="lblforwardbody" runat="server" Visible="False"></asp:Label>
&nbsp;<asp:Label ID="Label10" runat="server" Text="(no message)" Visible="False"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style1" colspan="2" style="background-color: #CCFFFF">
                    <asp:Button ID="btnsend" runat="server" Text="Send" Visible="False" OnClick="btnsend_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click" Visible="False">Back to Sent messages</asp:LinkButton>
                </td>
            </tr>
        </table>
    
    </div>
</asp:Content>

