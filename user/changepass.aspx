<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/user/MasterPage.master" CodeFile="changepass.aspx.cs" Inherits="admin_changepass" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript">
        function validation() {

            var pass = document.getElementById('<%=txtnewpass.ClientID %>');
            if (pass.value == "") {
                alert("Please Enter Password");
                pass.focus();
                return false;
            }
            else {
                var passExp = /^(?=.*\d+)(?=.*[a-zA-Z])(?=.*[!@#$%&._*])[0-9a-zA-Z.!@#$%_*]{8,16}$/;
                if (!(pass.value.match(passExp))) {

                    alert("Password Must Contain Atleast One Number,One Lower or Upper Case Letter And One Special Character(!,.,_,@,#,$,%,&,*). \n Password Must Be 8 To 16 Digits.");
                    pass.focus();
                    return false;
                }
            }


            var cpass = document.getElementById('<%=txtconpass.ClientID %>');
            if (cpass.value == "") {
                alert("You have not entered Confirm Password");
                pass.value = "";
                return false;
            }
            else {
                if (pass.value != cpass.value) {
                    alert("Password And Confirm Password Do Not Match.");
                    pass.value = "";
                    cpass.value = "";
                    return false;
                }

            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width:100%;">
            <tr>
                <td>Current Password</td>
                <td>
                    <asp:TextBox ID="txtcur" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">New Password</td>
                <td class="auto-style1">
                    <asp:TextBox ID="txtnewpass" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>Confirm Password</td>
                <td>
                    <asp:TextBox ID="txtconpass" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2">
        <asp:Button ID="btn1" runat="server" Text="Submit" Height="27px" style="margin-left: 330px" Width="68px" OnClick="btn1_Click" />
                </td>
            </tr>
        </table>
</asp:Content>
