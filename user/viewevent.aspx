<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/user/MasterPage.master" CodeFile="viewevent.aspx.cs" Inherits="user_viewevent" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width:100%;">
            <tr>
                <td class="auto-style1" style="border-style: groove; text-align: center; color: #0066FF; font-weight: bolder;">EVENTS</td>
            </tr>
            <tr>
                <td class="auto-style1" style="text-align: center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label2" runat="server"></asp:Label>
                    <asp:Label ID="Label3" runat="server" Text="of"></asp:Label>
                    <asp:Label ID="Label4" runat="server"></asp:Label>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" OnPageIndexChanging="GridView1_PageIndexChanging" Width="739px" PageSize="2">
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <table style="width:99%;">
                                        <tr>
                                            <td style="border-style: groove; background-color: #FFFF66;">
                                                <asp:Label ID="lblevent" runat="server" Text='<%# Eval("event") %>'></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="border-style: groove">
                                                <asp:Label ID="lbleventdate" runat="server" Text='<%# Eval("eventdate") %>'></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="border-style: groove">
                                                <asp:Label ID="lbldesc" runat="server" Text='<%# Eval("description") %>'></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
        </table>
</asp:Content>
