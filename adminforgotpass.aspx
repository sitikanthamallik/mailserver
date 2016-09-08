<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master" CodeFile="adminforgotpass.aspx.cs" Inherits="adminforgotpass" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript">
        function validation() {
            var uid = document.getElementById('<%=txtadmin.ClientID %>');

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
            var email = document.getElementById('<%=txtadminmail.ClientID %>');
            if (email.value == "") {
                alert("Please Enter Your Email ID");
                email.focus();
                return false;
            }
            else {
                var emailExp = /^[\w_.+]+\@[a-z0-9._]+\.[a-z0-9]{2,4}$/;
                if (!(email.value.match(emailExp))) {
                    alert("Email ID Is Not In Correct Format.");
                    email.focus();
                    return false;
                }
            }

        }
    </script>
    <style type="text/css">
        .auto-style1 {
        }
    .auto-style2 {
        height: 23px;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <table style="width:100%;">
                <tr>
                  <td class="auto-style2" style="background-color: #66FFFF; color: #0000CC; font-weight: bold;">Admin Id</td>
                    <td class="auto-style2" style="background-color: #66FFFF">
            <asp:TextBox ID="txtadmin" runat="server" style="margin-left: 3px" Width="196px" OnTextChanged="txt1_TextChanged"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                  <td class="auto-style1" style="background-color: #66FFFF; color: #0000CC; font-weight: bold;">Admin email id</td>
                    <td style="background-color: #66FFFF">
                        <asp:TextBox ID="txtadminmail" runat="server" style="margin-left: 5px" Width="189px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                  <td class="auto-style1" colspan="2" style="background-color: #66FFFF">
                      <asp:Label ID="Label1" runat="server" ForeColor="Lime"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
            <asp:Button ID="btn1" runat="server" style="margin-left: 232px" Text="Send" OnClick="btn1_Click" />
                    </td>
                </tr>
            </table>
       
</asp:Content>
