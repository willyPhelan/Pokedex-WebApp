using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NegocioPokemon;

namespace PokeDex_Web
{
    public partial class DropdownEjemplos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    // 1. Cargamos el DropDownList dinámico desde la Base de Datos (Sección 2)

                    ElementoNegocio negocio = new ElementoNegocio();
                    ddlTiposBD.DataSource = negocio.listar();
                    ddlTiposBD.DataValueField = "Id";
                    ddlTiposBD.DataTextField = "Descripcion";
                    ddlTiposBD.DataBind();

                    // 2. Cargamos el primer DropDownList de la cascada (Sección 3)

                    ddlElementosCascada.DataSource = negocio.listar();
                    ddlElementosCascada.DataValueField = "Id";
                    ddlElementosCascada.DataTextField = "Descripcion";
                    ddlElementosCascada.DataBind();

                    // Cargamos los Pokémon correspondientes al primer elemento por defecto

                    ActualizarPokemonsCascada();
                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }
        }

        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            string colorSeleccionado = ddlColores.SelectedValue;

            if (colorSeleccionado != "")
            {
                lblResultado.Text = "Elegiste el color: " + colorSeleccionado;
            }
            else
            {
                lblResultado.Text = "Por favor, seleccioná un color válido.";
            }
        }

        protected void btnAceptarBD_Click(object sender, EventArgs e)
        {
            string idSeleccionado = ddlTiposBD.SelectedValue;
            string textoSeleccionado = ddlTiposBD.SelectedItem.Text;

            lblResultadoBD.Text = "Seleccionaste el tipo: " + textoSeleccionado + " (ID: " + idSeleccionado + ")";
        }

        // Evento que se dispara al cambiar la selección del primer combo en cascada
        protected void ddlElementosCascada_SelectedIndexChanged(object sender, EventArgs e)
        {
            ActualizarPokemonsCascada();
        }

        // Método auxiliar para filtrar y poblar el segundo DropDownList
        private void ActualizarPokemonsCascada()
        {
            try
            {
                int idElementoSeleccionado = int.Parse(ddlElementosCascada.SelectedValue);

                PokemonNegocio pokemonNegocio = new PokemonNegocio();

                var listaPokemons = pokemonNegocio.listar();
                
                // Filtramos la lista de Pokémon usando LINQ según el tipo seleccionado

                var pokemonsFiltrados = listaPokemons.Where(x => x.Tipo.Id == idElementoSeleccionado).ToList();

                ddlPokemonsCascada.DataSource = pokemonsFiltrados;

                ddlPokemonsCascada.DataValueField = "Id";

                ddlPokemonsCascada.DataTextField = "Nombre";

                ddlPokemonsCascada.DataBind();

                if (pokemonsFiltrados.Count == 0)
                {
                    lblResultadoCascada.Text = "No hay Pokémon registrados para este elemento.";
                }
                else
                {
                    lblResultadoCascada.Text = "";
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


        // Evento que se dispara automáticamente al cambiar el texto de la URL (gracias al AutoPostBack)
        protected void txtImagenUrl_TextChanged(object sender, EventArgs e)
        {
            CargarImagenDinamica();
        }

        // Evento que se dispara al presionar el botón de carga manual
        protected void btnCargarImagen_Click(object sender, EventArgs e)
        {
            CargarImagenDinamica();
        }

        // Método auxiliar compartido para actualizar la propiedad ImageUrl
        private void CargarImagenDinamica()
        {
            string url = txtImagenUrl.Text.Trim();

            if (!string.IsNullOrEmpty(url))
            {
                // Asignamos la URL ingresada a la propiedad ImageUrl del control asp:Image
                imgPokemonPreview.ImageUrl = url;
            }
            else
            {
                // Si está vacío, mostramos una imagen por defecto
                imgPokemonPreview.ImageUrl = "https://via.placeholder.com/200?text=URL+Vacía";
            }
        }



    }
}