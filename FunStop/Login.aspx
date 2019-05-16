﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="FunStop.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="Content/bootstrap-grid.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.3.1.js"></script>
    <script src="Scripts/popper.js"></script>
    <script src="Scripts/bootstrap.js"></script>
    <title></title>
</head>
<body>
    <div class=" jumbotron text-center">
        <h1 id="titulo">FunStop - Login</h1>
    </div>
    <%-- <div class=" d-flex justify-content-center justi align-items-center container">--%>

    <div class=" container-fluid h-100">
        <div class="row justify-content-center align-items-center h-100">
            <div class=" col-12 col-sm-6 col-md-6 col-lg-4 col-xl-3">
                <form id="form1" runat="server" defaultfocus="userTxt">
                    <asp:ScriptManager ID="ScriptManager1" runat="server">
                    </asp:ScriptManager>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <div class="form-group">
                                <asp:Label ID="Label1" runat="server" Text="Usuario"></asp:Label>
                                <asp:TextBox ID="userTxt" CssClass="form-control" runat="server" required="Required" TextMode="SingleLine" ClientIDMode="Inherit"></asp:TextBox>
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
        </div>
    </div>

    <%--  </div>--%>
    <div class="card-footer fixed-bottom">
        <p class="text-center">&copy; <%: DateTime.Now.Year %>- FunStop</p>
    </div>

</body>
<script>
    $(document).ready(function () {
        $("#titulo").hover(
            function () {
                $("#titulo").css("cursor", "pointer");
                $("#titulo").fadeOut(1000);
                $("#titulo").addClass("text-danger")
            },
            function () {
                $("#titulo").removeClass("text-danger");
                $("#titulo").fadeIn(1000);
            }
        );
    });
</script>

</html>