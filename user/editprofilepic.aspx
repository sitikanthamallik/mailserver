<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/user/MasterPage.master" CodeFile="editprofilepic.aspx.cs" Inherits="user_editprofilepic" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript">
        function validation()
    {    var validFilesTypes = ["jpg", "png"];
        var file = document.getElementById("<%=FileUpload1.ClientID%>");
           
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
    <style type="text/css">
        .auto-style1 {
            height: 26px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     
        <table style="width:60%;">
            <tr>
                <td colspan="2" style="text-align: center; color: #0066FF;">&nbsp;PROFILE PICTURE</td>
            </tr>
            <tr>
                <td class="auto-style1">EDIT PROFILE PICTURE</td>
                <td class="auto-style1">
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" style="text-align: center; margin-left: 235px;" Text="submit" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="Label1" runat="server" ForeColor="Red" style="text-align: center"></asp:Label>
                </td>
            </tr>
        </table>
</asp:Content>


