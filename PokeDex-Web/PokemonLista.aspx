<%@ Page Title="Lista de Pokémon" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="PokemonLista.aspx.cs" Inherits="PokeDex_Web.PokemonLista" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container mt-4">

        <h1 class="mb-3">Lista de Pokemons</h1>
        
        <!-- GridView con estilos de Bootstrap -->

       <asp:GridView ID="dgvPokemons" runat="server" CssClass="table table-striped table-hover align-middle" AutoGenerateColumns="false" 
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

        <!-- Botón Agregar -->

       <!-- Botón Agregar -->
<asp:Button ID="btnAgregar" runat="server" Text="Agregar" CssClass="btn btn-primary mt-3" OnClick="btnAgregar_Click" />
    </div>

</asp:Content>