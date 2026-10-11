using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NegocioPokemon;
using DominioPokemon;

namespace PokeDex_Web
{
    public partial class PokemonLista : System.Web.UI.Page
    {
        public bool FiltroAvanzado { get; set; } = false;

        protected void Page_Load(object sender, EventArgs e) {

            FiltroAvanzado = chkAvanzado.Checked ;

            if (!IsPostBack) 
            {
                PokemonNegocio negocio = new PokemonNegocio();
                Session.Add("listaPokemons", negocio.listarconSP()); 
                
                dgvPokemons.DataSource = Session["listaPokemons"];
                dgvPokemons.DataBind(); 
            }
        }

        protected void dgvPokemons_RowCommand(object sender, GridViewCommandEventArgs e) 
        {
            if (e.CommandName == "PokemonModificar")
            {
                string id = e.CommandArgument.ToString();
                Response.Redirect("DetallePokemon.aspx?id=" + id, false);
            }
        }

        protected void dgvPokemons_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dgvPokemons.PageIndex = e.NewPageIndex;
            
            if (Session["listaPokemons"] != null)
            {
                dgvPokemons.DataSource = Session["listaPokemons"];
                dgvPokemons.DataBind();
            }
        }

        protected void btnAgregar_Click(object sender, EventArgs e) 
        {
            Response.Redirect("DetallePokemon.aspx", false);
        }

        protected void filtro_TextChaged(object sender, EventArgs e)
        {
            List<Pokemon> lista = (List<Pokemon>)Session["listaPokemons"];
            List<Pokemon> listafiltrada = lista.FindAll(x => x.Nombre.ToUpper().Contains(txtFiltro.Text.ToUpper())); 

            dgvPokemons.DataSource = listafiltrada;
            dgvPokemons.DataBind();
        }

        protected void chkFiltroAvanzado_CheckedChanged(object sender, EventArgs e) 
        {
            FiltroAvanzado = chkAvanzado.Checked;
            txtFiltro.Enabled = !FiltroAvanzado;

            if (FiltroAvanzado)
            {
                CargarCriterios();
            }
            else
            {
                // Al desmarcar, recargamos la lista completa
                PokemonNegocio negocio = new PokemonNegocio();
                Session["listaPokemons"] = negocio.listarconSP();
                dgvPokemons.DataSource = Session["listaPokemons"];
                dgvPokemons.DataBind();
            }
        }

        protected void ddlCampo_SelectedIndexChanged(object sender, EventArgs e)
        {

        ddlCriterio.Items.Clear() ;

        if(ddlCampo.SelectedItem.ToString() == "Numero") {

        ddlCriterio.Items.Add("Igual a") ; 
        ddlCriterio.Items.Add("Mayor a") ; 
        ddlCriterio.Items.Add("Menor a") ; } else 

        { 
        
          ddlCriterio.Items.Add("Contiene") ;  
          ddlCriterio.Items.Add("Comienza con") ;   
          ddlCriterio.Items.Add("Termina") ; 
        
        
        }
            
        
        
        CargarCriterios();
        }

        private void CargarCriterios()
        {
            ddlCriterio.Items.Clear();

            if (ddlCampo.SelectedItem != null && ddlCampo.SelectedItem.ToString() == "Número")
            {
                ddlCriterio.Items.Add("Igual a");
                ddlCriterio.Items.Add("Mayor a");
                ddlCriterio.Items.Add("Menor a");
            }
            else
            {
                ddlCriterio.Items.Add("Contiene");
                ddlCriterio.Items.Add("Comienza con");
                ddlCriterio.Items.Add("Termina con");
            }
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            try
            {
                PokemonNegocio negocio = new PokemonNegocio();
                
                string campo = ddlCampo.SelectedItem.ToString();
                string criterio = ddlCriterio.SelectedItem.ToString();
                string filtro = txtFiltroAvanzado.Text; // Asegurate que el ID en el ASPX coincida con este TextBox
                string estado = ddlEstado.SelectedItem.ToString();

                List<Pokemon> listaFiltrada = negocio.filtroAvz(campo, criterio, filtro, estado);
                Session["listaPokemons"] = listaFiltrada;
                
                dgvPokemons.DataSource = listaFiltrada;
                dgvPokemons.DataBind();
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.Message);
                Response.Redirect("Error.aspx", false);
            }
        }
    }
}