using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NegocioPokemon  ;

namespace PokeDex_Web
{
    public partial class PokemonLista : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e) {

        PokemonNegocio negocio = new PokemonNegocio() ;

        if (!IsPostBack) {
        // Solo carga la primera vez que entra a la página

        dgvPokemons.DataSource = negocio.listarconSP() ;

        dgvPokemons.DataBind() ;  }  }

        protected void dgvPokemons_RowCommand(object sender, GridViewCommandEventArgs e) {

           if (e.CommandName == "PokemonModificar"){

                    string id = e.CommandArgument.ToString() ;
        
                    // Redirige al formulario de detalle pasando el ID por URL
            
                    Response.Redirect("DetallePokemon.aspx?id=" + id, false) ;
    }
}



protected void dgvPokemons_PageIndexChanging(object sender, GridViewPageEventArgs e){

    // Asigna la nueva página seleccionada por el usuario

    dgvPokemons.PageIndex = e.NewPageIndex;
    
    // Vuelve a cargar la lista para refrescar los datos de la página actual

    PokemonNegocio negocio = new PokemonNegocio();

            dgvPokemons.DataSource = negocio.listarconSP();

            dgvPokemons.DataBind();

}

protected void btnAgregar_Click(object sender, EventArgs e)
{
    Response.Redirect("DetallePokemon.aspx", false);
}




    }
}