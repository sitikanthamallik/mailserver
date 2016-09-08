<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/admin/MasterPage.master" CodeFile="signuploadadmin.aspx.cs" Inherits="admin_signuploadadmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript">
        function validation() {

            var signname = document.getElementById('<%=txtsign.ClientID %>');

            if (signname.value == "") {
                alert("Please Enter Your sign Name");
                signname.focus();
                return false;
            }
            else {
                var nameExp = /^[a-z A-Z]+$/;
                if (!(signname.value.match(nameExp))) {

                    alert("Please Enter Only Letters in sign name");
                    signname.focus();
                    return false;
                }
            }
            var validFilesTypes = ["jpg", "png"];
            var file = document.getElementById("<%=filesignimage.ClientID%>");

            var path = file.value;
            var ext = path.substring(path.lastIndexOf(".") + 1, path.length).toLowerCase();
            var isValidFile = false;
            for (var i = 0; i < validFilesTypes.length; i++) {
                if (ext == validFilesTypes[i]) {
                    isValidFile = true;
                    break;
                }
            }
            if (!isValidFile) {
                alert("Invalid File. Please upload a File with" +
         " extension:\n\n" + validFilesTypes.join(", "));
            }
            return isValidFile;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
        <table style="width:100%;">
            <tr>
                <td class="auto-style1">Sign Name</td>
                <td>
                    <asp:TextBox ID="txtsign" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Image</td>
                <td>
                    <asp:FileUpload ID="filesignimage" runat="server" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="lblmsg" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btn1" runat="server" Text="submit" OnClick="btn1_Click" style="text-align: center; margin-left: 178px" />
                </td>
            </tr>
        </table>
    
</asp:Content>
