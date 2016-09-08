<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master" CodeFile="forgotpass.aspx.cs" Inherits="forgotpass" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript">
        function validation() {
            var uid = document.getElementById('<%=txtusr.ClientID %>');

            if (uid.value == "") {
                alert(" Please Enter Your User ID");
                uid.focus();
                return false;
            }
            else {

                var uidExp = /^[0-9a-zA-Z@#$%&]+$/;
                if (!(uid.value.match(uidExp))) {

                    alert("User Id Contain Any Number,Lower or Upper Case Letter And  Special Character (@,#,$,%,&) ");
                    uid.focus();
                    return false;
                }
            }


        }
    </script>
<style type="text/css">
    .auto-style1 {
        height: 22px;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width:42%;">
                <tr>
                  <td class="auto-style1" style="color: #00CC00">User Id</td>
                    <td class="auto-style1">
            <asp:TextBox ID="txtusr" runat="server" style="margin-left: 3px" Width="196px" OnTextChanged="txt1_TextChanged" AutoPostBack="True"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                  <td class="auto-style1" style="color: #33CC33">Secret Question</td>
                    <td>
                        <asp:Label ID="Label1" runat="server" ForeColor="Blue"></asp:Label>
                    </td>
                </tr>
                <tr>
                  <td class="auto-style1" style="color: #33CC33">Secret Answer</td>
                    <td>
                        <asp:TextBox ID="txtans" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center">
            <asp:Button ID="btn1" runat="server" Text="Send" OnClick="btn1_Click" Width="60px" />
                    </td>
                </tr>
            </table>
</asp:Content>

