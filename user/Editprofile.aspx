<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/user/MasterPage.master" CodeFile="Editprofile.aspx.cs" Inherits="user_Editprofile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <table style="width: 100%;">
                <tr>
                    <td colspan="3" style="text-align: center; background-color: #FFFFFF;">USER PROFILE</td>
                </tr>
                <tr>
                    <td class="auto-style1">User name</td>
                    <td class="auto-style2" colspan="2">
                        <asp:TextBox ID="txtusr" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4" colspan="2">Email id</td>
                    <td class="auto-style4">
                        <asp:TextBox ID="txtemail" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4" colspan="2">Mobile no.</td>
                    <td class="auto-style4">
                        <asp:TextBox ID="txtmob" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="auto-style6">Gender</td>
                    <td class="auto-style6">
                        <asp:RadioButtonList ID="rblgen" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem>male</asp:ListItem>
                            <asp:ListItem>female</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="auto-style4">Date of Birth</td>
                    <td class="auto-style4">
                        <asp:TextBox ID="txtdob" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="auto-style4">Secret Question</td>
                    <td class="auto-style4">
                        <asp:DropDownList ID="ddlsq" runat="server">
                            <asp:ListItem>Select Secret Question</asp:ListItem>
                            <asp:ListItem>what is your school&#39;s name?</asp:ListItem>
                            <asp:ListItem>what is your pet name?</asp:ListItem>
                            <asp:ListItem>what is your mother maiden name?</asp:ListItem>
                            <asp:ListItem>what is your nickname?</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="auto-style4">Answer</td>
                    <td class="auto-style4">
                        <asp:TextBox ID="txtans" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="3" class="auto-style5">
                        <asp:Button ID="btn1" runat="server" Style="margin-left: 342px" Text="Update" Width="125px" OnClick="Button1_Click" />
                        &nbsp;&nbsp;&nbsp;
                    </td>
                </tr>
            </table>

</asp:Content>
