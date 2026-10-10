<%@ Page Title="Detalle Pokémon" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="DetallePokemon.aspx.cs" Inherits="PokeDex_Web.DetallePokemon" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <!-- ScriptManager obligatorio para que funcione el UpdatePanel -->
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

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

                        <!-- Campo de la URL de la imagen con AutoPostBack -->

                        <div class="mb-3">
                            <label for="txtImagenUrl" class="form-label">URL de la Imagen:</label>
                            <asp:TextBox ID="txtImagenUrl" runat="server" CssClass="form-control" 
                                AutoPostBack="true" OnTextChanged="txtImagenUrl_TextChanged" 
                                placeholder="https://ejemplo.com/imagen.jpg">
                            </asp:TextBox>
                        </div>

                        <!-- UpdatePanel para la previsualización en tiempo real sin recargar toda la página -->

                        <asp:UpdatePanel ID="UpdatePanelImagen" runat="server">
                            <ContentTemplate>
                                <div class="mb-3 text-center">
                                    <asp:Image ID="imgPokemon" runat="server" 
                                        CssClass="img-fluid rounded border border-light mt-2" 
                                        Style="max-height: 250px; object-fit: contain;" 
                                        ImageUrl="https://via.placeholder.com/200?text=Sin+Imagen" />
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>

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

                        <!-- Botones de Acción Alineados -->

                        <div class="d-flex justify-content-between gap-2 mt-4 align-items-start">
                            
                            <asp:Button ID="btnAceptar" runat="server" Text="Aceptar" CssClass="btn btn-primary px-4" OnClick="btnAceptar_Click" />

                            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                <ContentTemplate>
                                    <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" CssClass="btn btn-danger px-4" CausesValidation="false" OnClick="btnEliminar_Click" />

                                    <% if (ConfirmaEliminacion) { %>  

                                        <div class="mt-3">

                                            <asp:CheckBox ID="chkConfirmaEliminacion" runat="server" Text="Confirmar Eliminación" CssClass="text-white d-block mb-2" />

                                            <asp:Button ID="btnConfirmarEliminacion" runat="server" Text="Confirmar" CssClass="btn btn-warning px-4" CausesValidation="false" OnClick="btnConfirmarEliminacion_Click" />
                                        
                                        </div>

                                    <% } %>  

                                </ContentTemplate>

                            </asp:UpdatePanel>
                       
                            <asp:Button Text="Desactivar" ID="btnInactivar" runat="server" CssClass="btn btn-warning px-4" CausesValidation="false" />

                            <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" CssClass="btn btn-secondary px-4" OnClick="btnCancelar_Click" CausesValidation="false" />

                        </div>

                        <!-- Contenedor para alertas de error -->

                        <asp:Panel ID="pnlError" runat="server" Visible="false" CssClass="alert alert-danger mt-3" role="alert">
                            
                            <asp:Label ID="lblError" runat="server" Text="" />
                        
                        </asp:Panel>

                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>