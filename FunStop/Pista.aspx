﻿<%@ Page Title="Pista" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Pista.aspx.cs" Inherits="FunStop.Pista" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid">
        <h2 class="mt-3"><%: Title %></h2>
        <hr />
    </div>
    <div class="container-fluid mb-3">
        <div class="row">
            <div class=" col-12 col-sm-6 col-md-4 col-lg-4 col-xl-4">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <h4>Tickets Pendientes</h4>
                        <div class="table-responsive-sm">
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <asp:GridView ID="ticketspendGrid" runat="server"
                                        BorderColor="#CCCCCC"
                                        BorderWidth="0px"
                                        CellPadding="3" GridLines="Horizontal"
                                        CssClass="table table-sm table-hover" AutoGenerateColumns="False" AllowPaging="True" OnPageIndexChanging="ticketspendGrid_PageIndexChanging" PageSize="7">
                                        <HeaderStyle CssClass="thead-dark"></HeaderStyle>
                                        <Columns>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="ticketChkb" runat="server" onclick="CheckTicketPend(this);"
                                                        OnCheckedChanged="ticketchkb_CheckedChanged" AutoPostBack="true" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="TicketID" HeaderText="TicketID" />
                                            <asp:BoundField DataField="Tiempo" HeaderText="Minutos" />
                                            <asp:BoundField DataField="Cliente" HeaderText="Cliente" />
                                            <asp:BoundField DataField="TipoCarro" HeaderText="Tipo Carro" />
                                        </Columns>
                                        <PagerSettings Mode="NextPrevious" NextPageText="&amp;lt;Siguiente&amp;gt;" PreviousPageText="&amp;lt;Anterior&amp;gt;" />
                                        <RowStyle BorderColor="#999999" Height="10px" />
                                    </asp:GridView>
                                </ContentTemplate>
                            </asp:UpdatePanel>

                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
            <div class="col-12 col-sm-6 col-md-4 col-lg-4 col-xl-4">
                <h4>Carros Disponibles</h4>
                <div class="table-responsive-sm">
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <asp:GridView ID="carrosGrid" runat="server"
                                BorderColor="#CCCCCC"
                                BorderWidth="0px"
                                CellPadding="3" GridLines="Horizontal"
                                CssClass="table table-sm table-hover" AutoGenerateColumns="False">
                                <HeaderStyle CssClass="thead-dark"></HeaderStyle>
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="carChkb" runat="server" onclick="CheckAvailableCar(this);"
                                               OnCheckedChanged="carChkb_CheckedChanged"  AutoPostBack="true" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="CarID" HeaderText="CarID" />
                                    <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" />
                                    <asp:BoundField DataField="TipoCarro" HeaderText="Tipo Carro" />
                                    <asp:TemplateField>
                                        <ItemTemplate>
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
            <div class="col-12 col-sm-12 col-md-4 col-lg-4 col-xl-4">
                <h4>Carros en Pista</h4>
                <div class="table-responsive-sm">
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <asp:GridView ID="carrospistaGrid" runat="server"
                                BorderColor="#CCCCCC"
                                BorderWidth="0px"
                                CellPadding="3" GridLines="Horizontal"
                                CssClass="table table-sm table-hover" AutoGenerateColumns="False">
                                <HeaderStyle CssClass="thead-dark"></HeaderStyle>
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="carChkb" runat="server" onclick="CheckAvailableCar(this);"
                                                AutoPostBack="true" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="CarID" HeaderText="CarID" Visible="false" />
                                    <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" />
                                    <asp:BoundField DataField="TipoCarro" HeaderText="Tipo Carro" />
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <RowStyle BorderColor="#999999" />
                            </asp:GridView>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
        <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <div class="row">
                    <div class="col-12 col-md-6 col-sm-6 col-lg-6">
                        <div class="btn-group btn-group-lg">
                            <asp:Button Text="Registrar" ToolTip="Registrar" ID="RegistrarBtn" runat="server" CssClass="btn btn-outline-success btn-block" />
                        </div>
                        <div class="btn-group btn-group-lg">
                            <asp:Button Text="Limpiar" ID="LimpiarBtn" UseSubmitBehavior="False" CausesValidation="false" ToolTip="Limpiar" runat="server" CssClass="btn  btn-outline-danger btn-block" />
                        </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>

        <script type="text/javascript"> 

            function CheckTicketPend(source) {
                var isChecked = source.checked;
                $("#<%=ticketspendGrid.ClientID%> input[id*='ticketChkb']").each(function (index) {
                    $(this).attr('checked', false);
                });
                source.checked = isChecked;
            }

            function CheckAvailableCar(source) {
                var isChecked = source.checked;
                $("#<%=carrosGrid.ClientID%> input[id*='carChkb']").each(function (index) {
                    $(this).attr('checked', false);
                });
                source.checked = isChecked;
                //source.addClass('bg-danger');
            }
            /*Prueba de como acceder a controles asp.net con jquery*/
            //$(function () {
            //    $("[id*=RegistrarBtn]").click(function () {
            //        var totalRowCount = $("[id*=ticketspendGrid] tr").length;
            //        var rowCount = $("[id*=ticketspendGrid] td").closest("tr").length;
            //        var message = "Total Row Count: " + totalRowCount;
            //        message += "\nRow Count: " + rowCount;
            //        alert(message);
            //        return false;
            //    });
            //});
        </script>
    </div>

</asp:Content>
