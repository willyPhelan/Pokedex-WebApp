<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="PokeDex_Web.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

<!-- Acá podes agregar estilos o títulos específicos para esta página si necesitás -->

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container mt-4">

    <h2 class="text-white mb-3">Listado de Pokémon en Tarjetas</h2>

    <hr class="bg-light" />

    <!-- Grilla de Cards: 1 columna en mobile, 2 en tablets, 3 o 4 en desktop -->

    <div class="row row-cols-1 row-cols-md-3 row-cols-lg-4 g-4">
        
        <!-- Repetís este bloque por cada Pokémon (o lo enlazás con un Repeater/ListView de ASP.NET) -->



 <%-- %>       <% 
               foreach(DominioPokemon.Pokemon poke in ListaPokemons) {

               %>

            <div class="col">

            <div class="card h-100 bg-secondary text-white shadow">

                <!-- Imagen del Pokémon (podes usar una URL o un DataBind de ASP.NET) -->

                <img src="<%: poke.ImagenUrl %>" class="card-img-top p-3 bg-dark" alt="Pikachu" style="height: 200px; object-fit: contain;">
                
                <div class="card-body d-flex flex-column">

                    <h5 class="card-title"> <%: poke.Nombre %></h5>

                    <p class="card-text flex-grow-1"><%:  poke.Descripcion %> </p>

                    <a style="color: inherit ;" href="DetallePokemon.aspx?id=<%: poke.Id %>" > Detalle </a>


                    
                    <!-- Botón de acción con etiqueta ASP.NET o HTML -->

                    <a href="#" class="btn btn-dark mt-auto">Ver Detalle</a>

                </div>

            </div>

        </div>

               <% }  %> --%>


        <asp:Repeater ID="repRepetidor" runat="server">

            <ItemTemplate>

                    <div class="col">

                            <div class="card h-100 bg-secondary text-white shadow">

                                <!-- Imagen del Pokémon (podes usar una URL o un DataBind de ASP.NET) -->

                                <img src="<%#Eval("ImagenUrl") %>" class="card-img-top p-3 bg-dark" alt="Pikachu" style="height: 200px; object-fit: contain;">
        
                                <div class="card-body d-flex flex-column">

                                    <h5 class="card-title"> <%#Eval("Nombre") %></h5>

                                    <p class="card-text flex-grow-1"><%#Eval("Descripcion") %> </p>

                                    <a style="color: inherit ;" href="DetallePokemon.aspx?id=<%#Eval("Id") %>" > Detalle </a>
            
                                    <!-- Botón de acción con etiqueta ASP.NET o HTML -->

                                    <a href="#" class="btn btn-dark mt-auto">Ver Detalle</a>

        </div>

    </div>

</div>

            </ItemTemplate>


        </asp:Repeater>


              



   </div>

</div> 

</asp:Content>

