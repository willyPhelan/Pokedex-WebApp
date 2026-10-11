<%@ Page Title="Pokémon Inactivos" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Inactivos.aspx.cs" Inherits="PokeDex_Web.PokemonInactivos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="container mt-4">
        <h2>Pokémon Inactivos (Baja Lógica)</h2>
        <hr />

        <asp:GridView ID="dgvInactivos" runat="server" CssClass="table table-dark table-striped align-middle" 
            AutoGenerateColumns="false" DataKeyNames="Id" OnRowCommand="dgvInactivos_RowCommand">
            <Columns>
                <asp:BoundField HeaderText="Número" DataField="Numero" />
                <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
                <asp:BoundField HeaderText="Tipo" DataField="Tipo.Descripcion" />
                <asp:BoundField HeaderText="Debilidad" DataField="Debilidad.Descripcion" />
                
                <asp:TemplateField HeaderText="Acción">
                    <ItemTemplate>
                        <asp:Button ID="btnReactivar" runat="server" Text="Reactivar" 
                            CommandName="Reactivar" CommandArgument='<%# Eval("Id") %>' 
                            CssClass="btn btn-success btn-sm px-3" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>

        <asp:Button ID="btnVolver" runat="server" Text="Volver a la Lista" CssClass="btn btn-secondary mt-3" OnClick="btnVolver_Click" />
    </div>

</asp:Content>