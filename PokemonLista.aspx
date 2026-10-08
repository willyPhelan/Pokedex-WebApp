git push -u origin main<%@ Page Title="Lista de Pokémon" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="PokemonLista.aspx.cs" Inherits="PokeDex_Web.PokemonLista" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h1> Lista de Pokemons </h1>

    <asp:GridView ID="dgvPokemons" runat="server" CssClass="table" AutoGenerateColumns="false">

        <Columns>
            <asp:BoundField HeaderText="Nombre" DataField="Nombre"/>

            <asp:BoundField HeaderText="Tipo" DataField="Tipo.Descripcion" />

        </Columns>



    </asp:GridView>

</asp:Content>


