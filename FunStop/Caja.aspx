<%@ Page Title="Facturación de Tickets - FunStop" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Caja.aspx.cs" Inherits="FunStop.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid">
        <h2 class="mt-3"><%: Title %>.</h2>
        <hr />
    </div>
    <div class="container-fluid mb-3">
        <div class="row">
            <div class=" col-8 col-sm-8 col-md-8 col-lg-8 col-xl-8">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <h2>Datos Cliente</h2>
                        <div class="form-group">
                            <asp:Label ID="Label1" runat="server" Text="Nombre"></asp:Label>
                            <asp:TextBox ID="nombreTxt" CssClass="form-control" autofocus="autofocus" runat="server" required="Required" AutoCompleteType="Disabled" TextMode="SingleLine"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="Label3" runat="server" Text="Teléfono"></asp:Label>
                            <asp:TextBox ID="telefonoTxt" CssClass="form-control" runat="server" TextMode="Phone" AutoCompleteType="Disabled" required="Required"></asp:TextBox>
                        </div>
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <div class="form-group">
                                    <asp:Label ID="Label4" runat="server" Text="Tipo Carro"></asp:Label>
                                    <asp:DropDownList runat="server" EnableViewState="true" CssClass="form-control" ID="CarType_Dropd" OnSelectedIndexChanged="CarType_Dropd_SelectedIndexChanged" AutoPostBack="true">
                                    </asp:DropDownList>
                                </div>
                                <div class="form-group radio">
                                    <asp:Label ID="Label2" runat="server" Text="Tiempo"></asp:Label>
                                    <asp:RadioButtonList RepeatDirection="Horizontal" runat="server" ID="tarifaRb" OnSelectedIndexChanged="tarifaRb_SelectedIndexChanged" AutoPostBack="true">
                                        <%--<asp:ListItem Text="15 mins" Value="15" />
                                <asp:ListItem Text="25 mins" Value="25" />
                                <asp:ListItem Text="30 mins" Value="30" />
                                <asp:ListItem Text="45 mins" Value="45" />--%>
                                    </asp:RadioButtonList>
                                </div>

                                <div class="form-group">
                                    <asp:Label ID="Label5" runat="server" Text="Tarifa"></asp:Label>
                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">RD$</span>
                                        </div>
                                        <asp:TextBox ID="tarifaTxt" CssClass="form-control text-danger font-weight-bolder h1" runat="server" TextMode="Number" ReadOnly="true"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <asp:CheckBox Text="Multiples Tickets" ID="multicket_chbox" CssClass="checkbox checkbox-success" runat="server" />
                                </div>

                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="CarType_Dropd" EventName="SelectedIndexChanged" />
                            </Triggers>
                        </asp:UpdatePanel>

                        <%--<div class="form-group">
                            <asp:Label ID="LoginError" runat="server" Text=""></asp:Label>
                        </div>--%>
                        <%-- <div class="d-flex justify-content-center align-items-center">
                                <asp:Button ID="LoginBtn" runat="server"
                                    Text="Login" CssClass="btn btn-outline-danger btn-block"
                                    OnClick="LoginBtn_Click" />
                            </div>--%>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <div class="form-group">
                    <asp:Label ID="Label6" runat="server" Text="Total"></asp:Label>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text">RD$</span>
                        </div>
                        <asp:TextBox ID="totalTxt" CssClass="form-control text-danger font-weight-bolder h1" runat="server" TextMode="Number" ReadOnly="true"></asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="col-4 col-sm-4 col-md-4 col-lg-4 col-xl-4">
                <asp:GridView ID="ticketsGrid" runat="server"
                    BorderColor="black"
                    BorderWidth="1"
                    CellPadding="3"
                    AutoGenerateColumns="true">
                    <HeaderStyle BackColor="#00aaaa"></HeaderStyle>
                </asp:GridView>
            </div>
        </div>
        <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <div class="row">
                    <div class="col-12 col-md-6 col-sm-6 col-lg-6">
                        <div class="btn-group btn-group-lg">
                            <asp:Button Text="Registrar" ToolTip="Registrar" ID="RegistrarBtn" runat="server" CssClass="btn btn-outline-success btn-block" OnClientClick="AcumulateTotal()" OnClick="RegistrarBtn_Click" />
                        </div>
                        <div class="btn-group btn-group-lg">
                            <asp:Button Text="Limpiar" ID="LimpiarBtn" UseSubmitBehavior="False" CausesValidation="false" ToolTip="Limpiar" runat="server" CssClass="btn  btn-outline-danger btn-block" OnClick="LimpiarBtn_Click" OnClientClick="ClearTxts()" />
                        </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        <script type="text/javascript">
            function ClearTxts() {
                $("#<%= nombreTxt.ClientID %>").val('');
                $("#<%= telefonoTxt.ClientID %>").val('');
                $("#<%= totalTxt.ClientID %>").val('');
                $("#<%= multicket_chbox.ClientID %>").prop('checked', false);
            }

            function AcumulateTotal() {
                var check = $("#<%= multicket_chbox.ClientID %>").val();
                var total = $("#<%= tarifaTxt.ClientID %>").val();;
                if (check) {
                    $("#<%= totalTxt.ClientID %>").val(total);
                }
                else {
                    $("#<%= totalTxt.ClientID %>").val(total);
                }
            }
        </script>
    </div>
</asp:Content>
