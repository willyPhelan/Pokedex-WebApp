<%@ Page Title="Lista de Pokémon" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="PokemonLista.aspx.cs" Inherits="PokeDex_Web.PokemonLista" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container mt-4">

        <h1 class="text-white mb-3">Lista de Pokemons</h1>
        <hr class="text-white" />
        
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