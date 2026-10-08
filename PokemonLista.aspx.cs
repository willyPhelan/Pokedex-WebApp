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

        dgvPokemons.DataSource = negocio.listarconSP() ;

        dgvPokemons.DataBind() ;

        }
    }
}