<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/user/MasterPage.master" CodeFile="eventdetails.aspx.cs" Inherits="user_eventdetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript">
        function validation() {
            var chkdate = document.getElementById("eventdate").value
            if (document.getElementById("eventdate").value == "") {
                alert("Please enter the Date..!!")
                chkdate.focus();
                return false;
            }
            else if (!chkdate.match(/^(0[1-9]|[12][0-9]|3[01])[\- \/.](?:(0[1-9]|1[012])[\- \/.](19|20)[0-9]{2})$/)) {
                alert('The date format should be : dd/mm/yyyy');
                chkdate.focus();
                return false;
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <fieldset>
            <legend style="color: #000099; font-style: normal; font-weight: bold">Event Details</legend>
            <table style="width:100%;">
                <tr>
                    <td>Event ID</td>
                    <td>
                        <asp:TextBox ID="txteventid" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Event</td>
                    <td>
                        <asp:TextBox ID="txteventname" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Description</td>
                    <td>
                        <asp:TextBox ID="eventdesc" runat="server" Height="95px" TextMode="MultiLine"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Event Date</td>
                    <td>
                        <asp:TextBox ID="eventdate" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Button ID="btnadd" runat="server" style="text-align: center; margin-left: 234px" Text="Add Event" OnClick="btnadd_Click" />
                    </td>
                </tr>
            </table>
        </fieldset>
    
</asp:Content>
