using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;
using DominioPokemon;
using NegocioPokemon;

namespace PokeDex_Web
{
    public partial class PokemonInactivos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarInactivos();
            }
        }

        private void CargarInactivos()
        {
            try
            {
                PokemonNegocio negocio = new PokemonNegocio();
                dgvInactivos.DataSource = negocio.listarInactivos();
                dgvInactivos.DataBind();
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.Message);
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void dgvInactivos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Reactivar")
            {
                try
                {
                    int id = int.Parse(e.CommandArgument.ToString());
                    PokemonNegocio negocio = new PokemonNegocio();
                    
                    // Llama al método que cambia Activo a 1
                    negocio.reactivar(id); 

                    // Recarga la grilla para que desaparezca el reactivado
                    CargarInactivos();
                }
                catch (Exception ex)
                {
                    Session.Add("error", ex.Message);
                    Response.Redirect("Error.aspx", false);
                }
            }
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("PokemonLista.aspx", false);
        }
    }
}