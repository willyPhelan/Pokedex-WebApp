<%@ Page Title="Lista de Pokémon" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="PokemonLista.aspx.cs" Inherits="PokeDex_Web.PokemonLista" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container mt-4">

        <h1 class="text-white mb-3">Lista de Pokemons</h1>
        <hr class="text-white" />
        
        <!-- Filtro Rápido Simple -->
        <div class="row mb-3">
            <div class="col-6">
                <div class="mb-3">
                    <asp:Label Text="Filtrar" runat="server" CssClass="text-white form-label" />
                    <asp:TextBox runat="server" ID="txtFiltro" CssClass="form-control" AutoPostBack="true" OnTextChanged="filtro_TextChaged"></asp:TextBox>
                </div>
            </div>
            
            <div class="col-6 d-flex align-items-end">
                <div class="mb-3">
                    <asp:CheckBox ID="chkAvanzado" runat="server" Text=" Filtro Avanzado" CssClass="text-white" AutoPostBack="true" OnCheckedChanged="chkFiltroAvanzado_CheckedChanged" />
                </div>
            </div>
        </div>

        <!-- Panel de Filtro Avanzado -->
        <% if(FiltroAvanzado) { %>
            <div class="card card-body bg-dark text-white border-secondary mb-4 shadow">
                <div class="row">
                    <div class="col-md-3">
                        <div class="mb-3">
                            <asp:Label Text="Campo" ID="lblCampo" runat="server" />
                            <asp:DropDownList ID="ddlCampo" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlCampo_SelectedIndexChanged">
                                <asp:ListItem Text="Nombre" />
                                <asp:ListItem Text="Tipo" />
                                <asp:ListItem Text="Número" />
                            </asp:DropDownList>
                        </div>
                    </div>

                    <div class="col-md-3">
                        <div class="mb-3">
                            <asp:Label Text="Criterio" ID="lblCriterio" runat="server" />
                            <asp:DropDownList ID="ddlCriterio" runat="server" CssClass="form-control" AutoPostBack="true"></asp:DropDownList>
                        </div>
                    </div>

                    <div class="col-md-3">
                        <div class="mb-3">
                            <asp:Label Text="Filtro" ID="lblFiltro" runat="server" />
                            <asp:TextBox ID="txtFiltroAvanzado" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>

                    <div class="col-md-3">
                        <div class="mb-3">
                            <asp:Label Text="Estado" ID="lblEstado" runat="server" />
                            <asp:DropDownList ID="ddlEstado" runat="server" CssClass="form-control" AutoPostBack="true">
                                <asp:ListItem Text="Todos" Value="Todos" />
                                <asp:ListItem Text="Activo" Value="Activos" />
                                <asp:ListItem Text="Inactivo" Value="Inactivos" />
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-3">
                        <asp:Button ID="btnBuscar" runat="server" Text="Buscar" CssClass="btn btn-primary px-4" OnClick="btnBuscar_Click" />
                    </div>
                </div>
            </div>
        <% } %>

        <!-- GridView con estilos de Bootstrap Dark -->
        <asp:GridView ID="dgvPokemons" runat="server" CssClass="table table-dark table-striped align-middle shadow" AutoGenerateColumns="false" 
            AllowPaging="true" PageSize="5" OnPageIndexChanging="dgvPokemons_PageIndexChanging" OnRowCommand="dgvPokemons_RowCommand">

            <Columns>
                <asp:BoundField HeaderText="Número" DataField="Numero" />
                <asp:BoundField HeaderText="Nombre" DataField="Nombre"/>
                <asp:BoundField HeaderText="Tipo" DataField="Tipo.Descripcion" />
                
                <asp:TemplateField HeaderText="Acción">
                    <ItemTemplate>
                        <asp:Button ID="btnAccion" runat="server" Text="Ver/Modificar" CssClass="btn btn-primary btn-sm px-3" CommandName="PokemonModificar" CommandArgument='<%# Eval("Id") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>

        <!-- Botón Agregar con estilo verde para destacar -->
        <div class="mt-3">
            <asp:Button ID="btnAgregar" runat="server" Text="Agregar" CssClass="btn btn-success px-4" OnClick="btnAgregar_Click" />
        </div>
        
    </div>

</asp:Content>