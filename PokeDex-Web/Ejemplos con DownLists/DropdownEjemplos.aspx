<%@ Page Title="Ejemplos de DropDownLists" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="DropdownEjemplos.aspx.cs" Inherits="PokeDex_Web.DropdownEjemplos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <!-- ScriptManager obligatorio para que funcione el UpdatePanel -->
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <div class="container mt-4">
        <h2 class="mb-3">Ejemplos de DropDownLists</h2>
        
        <!-- Sección 1: DropDownList Estático -->

        <div class="card bg-secondary text-white shadow col-md-6 p-4 mb-4">

            <h4 class="mb-3">1. DropDownList Estático (Colores)</h4>
            
            <div class="mb-3">

                <label for="ddlColores" class="form-label">Seleccioná un color:</label>

                <asp:DropDownList ID="ddlColores" runat="server" CssClass="form-select">

                    <asp:ListItem Text="Seleccione un color..." Value="" />

                    <asp:ListItem Text="Rojo" Value="Rojo" />

                    <asp:ListItem Text="Amarillo" Value="Amarillo" />

                    <asp:ListItem Text="Azul" Value="Azul" />

                </asp:DropDownList>
            </div>

            <asp:Button ID="btnEnviar" runat="server" Text="Mostrar Color" CssClass="btn btn-primary" OnClick="btnEnviar_Click" />

            <div class="mt-3">

                <asp:Label ID="lblResultado" runat="server" CssClass="fw-bold" Text="" />

            </div>
        </div>

        <!-- Sección 2: DropDownList desde la Base de Datos -->

        <div class="card bg-secondary text-white shadow col-md-6 p-4 mb-4">
            <h4 class="mb-3">2. DropDownList desde la Base de Datos (Tipos)</h4>

            <div class="mb-3">
                <label for="ddlTiposBD" class="form-label">Seleccioná un Tipo de Pokémon:</label>
                <asp:DropDownList ID="ddlTiposBD" runat="server" CssClass="form-select">
                </asp:DropDownList>
            </div>

            <asp:Button ID="btnAceptarBD" runat="server" Text="Mostrar Tipo de BD" CssClass="btn btn-primary" OnClick="btnAceptarBD_Click" />

            <div class="mt-3">
                <asp:Label ID="lblResultadoBD" runat="server" CssClass="fw-bold" Text="" />
            </div>
        </div>

        <!-- Sección 3: DropDownLists Enlazados (Cascada) con UpdatePanel -->
        <div class="card bg-secondary text-white shadow col-md-6 p-4 mt-4">
            <h4 class="mb-3">3. DropDownLists Enlazados (Tipo -> Pokémon)</h4>

            <asp:UpdatePanel ID="UpdatePanelCascada" runat="server">
                <ContentTemplate>
                    <!-- Primer DropDownList: Elementos/Tipos -->
                    <div class="mb-3">
                        <label for="ddlElementosCascada" class="form-label">Seleccioná un Elemento:</label>
                        <asp:DropDownList ID="ddlElementosCascada" runat="server" CssClass="form-select" AutoPostBack="true" OnSelectedIndexChanged="ddlElementosCascada_SelectedIndexChanged">
                        </asp:DropDownList>
                    </div>

                    <!-- Segundo DropDownList: Pokémon filtrados -->
                    <div class="mb-3">
                        <label for="ddlPokemonsCascada" class="form-label">2. Pokémon disponibles:</label>
                        <asp:DropDownList ID="ddlPokemonsCascada" runat="server" CssClass="form-select">
                        </asp:DropDownList>
                    </div>

                    <div class="mt-3">
                        <asp:Label ID="lblResultadoCascada" runat="server" CssClass="fw-bold" Text="" />
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>

        <!-- Sección 4: Carga de Imagen por URL con UpdatePanel -->
        <div class="card bg-secondary text-white shadow col-md-6 p-4 mt-4">
            <h4 class="mb-3">4. Carga de Imagen por URL (Automática y por Botón)</h4>

            <asp:UpdatePanel ID="UpdatePanelImagen" runat="server">
                <ContentTemplate>
                    <!-- Input de Texto con AutoPostBack -->
                    <div class="mb-3">
                        <label for="txtImagenUrl" class="form-label">Ingresá la URL de la imagen:</label>
                        <asp:TextBox ID="txtImagenUrl" runat="server" CssClass="form-control" 
                            AutoPostBack="true" OnTextChanged="txtImagenUrl_TextChanged" 
                            placeholder="https://ejemplo.com/imagen.jpg">
                        </asp:TextBox>
                    </div>

                    <!-- Botón opcional para presionar -->
                    <div class="mb-3">
                        <asp:Button ID="btnCargarImagen" runat="server" Text="Cargar Imagen" 
                            CssClass="btn btn-primary" OnClick="btnCargarImagen_Click" />
                    </div>

                    <!-- Vista previa de la imagen -->
                    <div class="mt-3 text-center">
                        <asp:Image ID="imgPokemonPreview" runat="server" 
                            CssClass="img-fluid rounded border border-light" 
                            Style="max-height: 250px; object-fit: contain;" 
                            ImageUrl="https://via.placeholder.com/200?text=Sin+Imagen" />
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>

    </div>



</asp:Content>