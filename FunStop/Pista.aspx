<%@ Page Title="Pista" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Pista.aspx.cs" Inherits="FunStop.Pista" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid">
        <h2 class="mt-3"><%: Title %>.</h2>
        <hr />
    </div>
    <div class="container-fluid mb-3">
        <div class="row">
            <div class=" col-6 col-sm-6 col-md-4 col-lg-4 col-xl-4">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <h2>Tickets Pendientes</h2>
                        <div class="table-responsive-sm">
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <asp:GridView ID="ticketspendGrid" runat="server"
                                        BorderColor="#CCCCCC"
                                        BorderWidth="0px"
                                        CellPadding="3" GridLines="Horizontal"
                                        CssClass="table table-sm table-hover" AutoGenerateColumns="False">
                                        <HeaderStyle CssClass="thead-dark"></HeaderStyle>
                                        <Columns>
                                            <asp:BoundField DataField="TicketID" HeaderText="TicketID" />
                                            <asp:BoundField DataField="Tiempo" HeaderText="Minutos" />
                                            <asp:BoundField DataField="Cliente" HeaderText="Cliente" />
                                            <asp:BoundField DataField="TipoCarro" HeaderText="Tipo Carro" />
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:LinkButton runat="server" CommandArgument='<%# Eval("TicketID") %>' ToolTip="Reimprimir" CommandName="Print" ID="reimprimirBtn" CausesValidation="false" CssClass="btn btn-sm btn-outline-success"><i class='fa fa-print'></i></asp:LinkButton>
                                                    <asp:LinkButton runat="server" CommandArgument='<%# Eval("TicketID") %>' ID="anularBtn" CausesValidation="false" ToolTip="Anular" CommandName="Cancel" CssClass="btn btn-sm btn-outline-danger"><i class='fa fa-close'></i></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <%--                    <asp:BoundField DataField="TicketID" HeaderText="TicketID" SortExpression="TicketID" />
                        <asp:BoundField DataField="Customer" HeaderText="Cliente" SortExpression="Customer" />
                        <asp:BoundField DataField="TrackTime" HeaderText="Tiempo" SortExpression="TrackTime" />--%>
                                        </Columns>
                                        <RowStyle BorderColor="#999999" Height="10px" />
                                    </asp:GridView>
                                </ContentTemplate>
                            </asp:UpdatePanel>

                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
            <div class="col-4 col-sm-4 col-md-4 col-lg-4 col-xl-4">
                <h2>Ultimos Tickets</h2>
                <div class="table-responsive-sm">
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <asp:GridView ID="carrosGrid" runat="server"
                                BorderColor="#CCCCCC"
                                BorderWidth="0px"
                                CellPadding="3" GridLines="Horizontal"
                                CssClass="table table-hover" AutoGenerateColumns="False">
                                <HeaderStyle CssClass="thead-dark"></HeaderStyle>
                                <Columns>
                                    <asp:BoundField DataField="TicketID" HeaderText="TicketID" />
                                    <asp:BoundField DataField="Tiempo" HeaderText="Minutos" />
                                    <asp:BoundField DataField="Cliente" HeaderText="Cliente" />
                                    <asp:BoundField DataField="TipoCarro" HeaderText="Tipo Carro" />
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:LinkButton runat="server" CommandArgument='<%# Eval("TicketID") %>' ToolTip="Reimprimir" CommandName="Print" ID="reimprimirBtn" CausesValidation="false" CssClass="btn btn-sm btn-outline-success"><i class='fa fa-print'></i></asp:LinkButton>
                                            <asp:LinkButton runat="server" CommandArgument='<%# Eval("TicketID") %>' ID="anularBtn" CausesValidation="false" ToolTip="Anular" CommandName="Cancel" CssClass="btn btn-sm btn-outline-danger"><i class='fa fa-close'></i></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <%--                    <asp:BoundField DataField="TicketID" HeaderText="TicketID" SortExpression="TicketID" />
                        <asp:BoundField DataField="Customer" HeaderText="Cliente" SortExpression="Customer" />
                        <asp:BoundField DataField="TrackTime" HeaderText="Tiempo" SortExpression="TrackTime" />--%>
                                </Columns>
                                <RowStyle BorderColor="#999999" />
                            </asp:GridView>
                        </ContentTemplate>
                    </asp:UpdatePanel>

                </div>

            </div>
        </div>
    <%--    <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
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
        </asp:UpdatePanel>--%>
        <%--<script type="text/javascript">
            function ClearTxts() {
                $("#<%= nombreTxt.ClientID %>").val('');
                $("#<%= telefonoTxt.ClientID %>").val('');
                $("#<%= totalTxt.ClientID %>").val('');
                $("#<%= multicket_chbox.ClientID %>").prop('checked', false);
            }

            function AcumulateTotal() {
                if ($("#<%= nombreTxt.ClientID %>").val() != '' && $("#<%= telefonoTxt.ClientID %>").val() != '') {
                    var check = $("#<%= multicket_chbox.ClientID %>").val();
                    var total = $("#<%= tarifaTxt.ClientID %>").val();
                    var totalf = $("#<%= totalTxt.ClientID %>").val();
                    var totalff = 0;
                    //alert(totalf);

                    if (check) {
                        if (totalf > 0) {
                            //alert('entre' + totalf + total);
                            totalff = parseFloat(totalf) + parseFloat(total);
                            //alert(totalff);
                            $("#<%= totalTxt.ClientID %>").val(totalff.toFixed(2));
                        }
                        else {
                            $("#<%= totalTxt.ClientID %>").val(total);
                        }
                    }
                    else {
                        $("#<%= totalTxt.ClientID %>").val(total);
                    }
                }

            }
        </script>--%>
    </div>

</asp:Content>
