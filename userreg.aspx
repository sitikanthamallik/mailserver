<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master" CodeFile="userreg.aspx.cs" Inherits="userreg" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <style type="text/css">
        .auto-style1 {
            width: 345px;
        }

        .auto-style2 {
        }

        .auto-style4 {
            height: 26px;
        }
        .auto-style5 {
            height: 34px;
        }
        .auto-style6 {
            height: 18px;
        }
    </style>
    <script type="text/javascript">

        function validation() {
            var username = document.getElementById('<%=txtusr.ClientID %>');

            if (username.value == "") {
                alert("Please Enter Your user Name");
                username.focus();
                return false;
            }
            else {
                var nameExp = /^[a-z A-Z]+$/;
                if (!(username.value.match(nameExp))) {
                    alert("Please Enter Only Letters in First name");
                    username.focus();
                    return false;
                }
            }


            var uid = document.getElementById('<%=txtid.ClientID %>');

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
            var pass = document.getElementById('<%=txtpass.ClientID %>');
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

            var cpass = document.getElementById('<%=txtconfirmpass.ClientID %>');
            if (cpass.value == "") {
                alert("You have Not Entered Confirm Password");
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


            var email = document.getElementById('<%=txtemail.ClientID %>');
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

            var mobile = document.getElementById('<%=txtmob.ClientID %>');
            if (mobile.value == "") {
                alert("Please Enter Your Mobile Number");
                mobile.focus();
                return false;
            }


            else {
                var mobileExp = /^[0-9]{10}$/;
                if (!(mobile.value.match(mobileExp))) {

                    alert("Please Enter Only Number,  \n  Mobile Number Must Be 10 Digits.");
                    mobile.focus();
                    return false;
                }
            }


            var rb = document.getElementById('<%=rblgen.ClientID %>');
                var radio = rb.getElementsByTagName("input");
                var isChecked = false;
                for (var i = 0; i < radio.length; i++) {
                    if (radio[i].checked) {
                        isChecked = true;
                        break;
                    }
                }
                if (!isChecked) {
                    alert("Please select gender");
                    return false;
                }

                var chkdate = document.getElementById("txtdob").value
                if (document.getElementById("txtdob").value == "") {
                    alert("Please enter the Date..!!")
                    chkdate.focus();
                    return false;
                }
                else if (!chkdate.match(/^(0[1-9]|[12][0-9]|3[01])[\- \/.](?:(0[1-9]|1[012])[\- \/.](19|20)[0-9]{2})$/)) {
                    alert('The date format should be : dd/mm/yyyy');
                    chkdate.focus();
                    return false;
                }
                var ddl = document.getElementById('<%=ddlsq.ClientID %>');

                        if (ddl.value == "Select Secret Question") {
                            alert("Please Select Secret Question");
                            return false;
                        }

                        var secretq = document.getElementById('<%=txtans.ClientID %>');

            if (secretq.value == "") {
                alert("Please Enter Your secret answer");
                secretq.focus();
                return false;
            }
            else {
                var nameExp = /^[a-z A-Z]+$/;
                if (!(secretq.value.match(nameExp))) {

                    alert("Please Enter Only Letters in secret answer");
                    secretq.focus();
                    return false;
                }
            }

            var validFilesTypes = ["jpg", "png"];
            var file = document.getElementById("<%=FileUploadpic.ClientID%>");

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
    <table style="width: 100%;">
                <tr>
                    <td colspan="3" style="text-align: center; background-color: #CCFF66; font-weight: bolder; color: #996633;">USER REGISTRATION</td>
                </tr>
                <tr>
                    <td class="auto-style1" style="background-color: #33CCFF; font-weight: bold;">User name</td>
                    <td class="auto-style2" colspan="2" style="background-color: #33CCFF">
                        <asp:TextBox ID="txtusr" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="auto-style4" style="background-color: #33CCFF; font-weight: bold;">User Id</td>
                    <td style="background-color: #33CCFF">
                        <asp:TextBox ID="txtid" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="auto-style4" style="background-color: #33CCFF; font-weight: bold;">Password</td>
                    <td style="background-color: #33CCFF">
                        <asp:TextBox ID="txtpass" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="auto-style4" style="background-color: #33CCFF; font-weight: bold;">Confirm password</td>
                    <td class="auto-style4" style="background-color: #33CCFF">
                        <asp:TextBox ID="txtconfirmpass" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4" colspan="2" style="background-color: #33CCFF; font-weight: bold;">Email id</td>
                    <td class="auto-style4" style="background-color: #33CCFF">
                        <asp:TextBox ID="txtemail" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4" colspan="2" style="background-color: #33CCFF; font-weight: bold;">Mobile no.</td>
                    <td class="auto-style4" style="background-color: #33CCFF">
                        <asp:TextBox ID="txtmob" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="auto-style6" style="background-color: #33CCFF; font-weight: bold;">Gender</td>
                    <td class="auto-style6" style="background-color: #33CCFF">
                        <asp:RadioButtonList ID="rblgen" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem>male</asp:ListItem>
                            <asp:ListItem>female</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="auto-style4" style="background-color: #33CCFF; font-weight: bold;">Date of Birth</td>
                    <td class="auto-style4" style="background-color: #33CCFF">
                        <asp:TextBox ID="txtdob" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="auto-style4" style="background-color: #33CCFF; font-weight: bold;">Secret Question</td>
                    <td class="auto-style4" style="background-color: #33CCFF">
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
                    <td colspan="2" class="auto-style4" style="background-color: #33CCFF; font-weight: bold;">Answer</td>
                    <td class="auto-style4" style="background-color: #33CCFF">
                        <asp:TextBox ID="txtans" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="auto-style4" style="background-color: #33CCFF; font-weight: bold;">Upload profile picture</td>
                    <td class="auto-style4" style="background-color: #33CCFF">
                        <asp:FileUpload ID="FileUploadpic" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td colspan="3" class="auto-style5">
                        <asp:Button ID="btn1" runat="server" Style="margin-left: 342px" Text="Submit" Width="125px" OnClick="Button1_Click" />
                        &nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btn2" runat="server" Text="Reset" Width="104px" OnClick="btn2_Click" />
                    </td>
                </tr>
            </table>
</asp:Content>

