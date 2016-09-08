<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/admin/MasterPage.master" CodeFile="newsitem.aspx.cs" Inherits="admin_newsitem" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript">
     function validation()
        {
        var validFilesTypes = ["jpg", "png"];
        var file = document.getElementById("<%=newsimage.ClientID%>");
           
        var path = file.value;
        var ext = path.substring(path.lastIndexOf(".") + 1, path.length).toLowerCase();
        var isValidFile = false;
        for (var i = 0; i < validFilesTypes.length; i++)
        {
            if (ext == validFilesTypes[i]) 
            {
                isValidFile = true;
                break;
            }
        }
        if (!isValidFile) 
        {
            alert("Invalid File. Please upload a File with" +
     " extension:\n\n" + validFilesTypes.join(", "));
        }
        return isValidFile;
     }
        </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 100%;">
            <tr>
                <td colspan="2" style="text-align: center; color: #FF0000;">NEWS</td>
            </tr>
            <tr>
                <td>Headlines</td>
                <td>
                    <asp:TextBox ID="txtheadline" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>Details</td>
                <td>
                    <asp:TextBox ID="txtdetails" runat="server" TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Image</td>
                <td class="auto-style1">
                    <asp:FileUpload ID="newsimage" runat="server" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button ID="btn1" runat="server" OnClick="btn1_Click" style="margin-left: 240px" Text="Submit" />
                </td>
            </tr>
        </table>
</asp:Content>

