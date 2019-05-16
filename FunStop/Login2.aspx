<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login2.aspx.cs" Inherits="FunStop.Login2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="Content/bootstrap-grid.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.3.1.js"></script>
    <script src="Scripts/popper.js"></script>
    <script src="Scripts/bootstrap.js"></script>
    <title></title>
</head>
<body>
    <div class="container">
        <h2>Stacked form</h2>
        <form id="form1" runat="server">
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="form-group">

                        <asp:Label ID="Label1" runat="server" Text="Usuario"></asp:Label>
                        <asp:TextBox ID="userTxt" CssClass="form-control" autofocus="autofocus" runat="server" required="Required" TextMode="SingleLine"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="Label3" runat="server" Text="Contraseña"></asp:Label>
                        <asp:TextBox ID="passwordTxt" CssClass="form-control" runat="server" TextMode="Password" required="Required"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <asp:Label ID="LoginError" runat="server" Text=""></asp:Label>
                    </div>
                    <div class="d-flex justify-content-center align-items-center">
                        <asp:Button ID="LoginBtn" runat="server"
                            Text="Login" CssClass="btn btn-outline-danger btn-block"
                            OnClick="LoginBtn_Click" />
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </form>
    </div>
</body>
</html>
