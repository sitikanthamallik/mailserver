<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master" CodeFile="viewhoroscope.aspx.cs" Inherits="viewhoroscope" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            height: 39px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <table style="width: 100%;">
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="582px">
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <table style="width:100%;">
                                        <tr>
                                            <td class="style2" rowspan="3">
                                                <asp:Image ID="Image1" ImageUrl='<%#Eval("imagesign","~/admin/sign/{0}") %>' runat="server" Height="116px" Width="113px" />
                                            </td>
                                            <td class="auto-style1">
                                                <asp:Label ID="lbldate" Text='<%# Eval("date") %>' runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style1">
                                                <asp:Label ID="lblsignname"  Text='<%# Eval("signname") %>' runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style1">
                                                <asp:Label ID="lbldetails" Text='<%# Eval("description") %>' runat="server"></asp:Label>
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

