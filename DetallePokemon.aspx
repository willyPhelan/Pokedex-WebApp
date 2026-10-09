<%@ Page Title="Detalle Pokémon" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="DetallePokemon.aspx.cs" Inherits="PokeDex_Web.DetallePokemon" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-4">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card bg-secondary text-white shadow">
                    <div class="card-header bg-dark">
                        <h3>Formulario de Pokémon</h3>
                    </div>
                    <div class="card-body">
                        
                        <!-- Campo oculto para guardar el ID cuando se modifica -->
                        <asp:TextBox ID="txtId" runat="server" Visible="false" />

                        <!-- Campo Número -->
                        <div class="mb-3">
                            <label for="txtNumero" class="form-label">Número</label>
                            <asp:TextBox ID="txtNumero" runat="server" CssClass="form-control" />
                        </div>

                        <!-- Campo Nombre -->
                        <div class="mb-3">
                            <label for="txtNombre" class="form-label">Nombre</label>
                            <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" />
                        </div>

                        <!-- Campo Descripción -->
                        <div class="mb-3">
                            <label for="txtDescripcion" class="form-label">Descripción</label>
                            <asp:TextBox ID="txtDescripcion" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3" />
                        </div>

                        <!-- Campo ImagenUrl -->
                        <div class="mb-3">
                            <label for="txtImagenUrl" class="form-label">URL de Imagen</label>
                            <asp:TextBox ID="txtImagenUrl" runat="server" CssClass="form-control" />
                        </div>

                        <!-- Campo Tipo -->
                        <div class="mb-3">
                            <label for="ddlTipo" class="form-label">Tipo</label>
                            <asp:DropDownList ID="ddlTipo" runat="server" CssClass="form-select"></asp:DropDownList>
                        </div>

                        <!-- Campo Debilidad -->
                        <div class="mb-3">
                            <label for="ddlDebilidad" class="form-label">Debilidad</label>
                            <asp:DropDownList ID="ddlDebilidad" runat="server" CssClass="form-select"></asp:DropDownList>
                        </div>

                        <!-- Botones de Acción -->
                        <div class="d-flex justify-content-between">
                            <asp:Button ID="btnAceptar" runat="server" Text="Aceptar" CssClass="btn btn-primary px-4" OnClick="btnAceptar_Click" />
                            <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" CssClass="btn btn-danger px-4" OnClick="btnCancelar_Click" CausesValidation="false" />
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>