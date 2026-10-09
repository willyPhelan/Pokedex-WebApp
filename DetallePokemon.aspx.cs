using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DominioPokemon;
using NegocioPokemon;

namespace PokeDex_Web
{
    public partial class DetallePokemon : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Cargar los desplegables de Tipos y Debilidades
                ElementoNegocio elementoNegocio = new ElementoNegocio();
                ddlTipo.DataSource = elementoNegocio.listar();
                ddlTipo.DataValueField = "Id";
                ddlTipo.DataTextField = "Descripcion";
                ddlTipo.DataBind();

                ddlDebilidad.DataSource = elementoNegocio.listar();
                ddlDebilidad.DataValueField = "Id";
                ddlDebilidad.DataTextField = "Descripcion";
                ddlDebilidad.DataBind();

                // Configurar si viene un ID por parámetro (Modificación)
                if (Request.QueryString["id"] != null)
                {
                    int id = int.Parse(Request.QueryString["id"].ToString());
                    PokemonNegocio negocio = new PokemonNegocio();
                    List<Pokemon> lista = negocio.listar();
                    Pokemon seleccionado = lista.FirstOrDefault(x => x.Id == id);

                    if (seleccionado != null)
                    {
                        txtId.Text = seleccionado.Id.ToString();
                        txtNumero.Text = seleccionado.Numero.ToString();
                        txtNombre.Text = seleccionado.Nombre;
                        txtDescripcion.Text = seleccionado.Descripcion;
                        txtImagenUrl.Text = seleccionado.ImagenUrl;
                        
                        if (seleccionado.Tipo != null)
                            ddlTipo.SelectedValue = seleccionado.Tipo.Id.ToString();
                        
                        if (seleccionado.Debilidad != null)
                            ddlDebilidad.SelectedValue = seleccionado.Debilidad.Id.ToString();
                    }
                }
            }
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            try
            {
                Pokemon nuevo = new Pokemon();
                PokemonNegocio negocio = new PokemonNegocio();

                nuevo.Numero = int.Parse(txtNumero.Text);
                nuevo.Nombre = txtNombre.Text;
                nuevo.Descripcion = txtDescripcion.Text;
                nuevo.ImagenUrl = txtImagenUrl.Text;

                nuevo.Tipo = new Elemento();
                nuevo.Tipo.Id = int.Parse(ddlTipo.SelectedValue);

                nuevo.Debilidad = new Elemento();
                nuevo.Debilidad.Id = int.Parse(ddlDebilidad.SelectedValue);

                if (txtId.Text != "")
                {
                    // Si tiene ID, es una modificación
                    nuevo.Id = int.Parse(txtId.Text);
                    negocio.modificar(nuevo);
                }
                else
                {
                    // Si no tiene ID, es un alta nueva
                    negocio.agregar(nuevo);
                }

                Response.Redirect("PokemonLista.aspx", false);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("PokemonLista.aspx", false);
        }
    }
}