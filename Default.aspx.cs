using NegocioPokemon;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DominioPokemon ; 

namespace PokeDex_Web
{
    public partial class Default : System.Web.UI.Page {

    public List<Pokemon> ListaPokemons { get ; set ; }
        protected void Page_Load(object sender, EventArgs e) {

         PokemonNegocio negocio = new PokemonNegocio() ;
         
         ListaPokemons = negocio.listarconSP() ; 

         repRepetidor.DataSource = ListaPokemons ;

         repRepetidor.DataBind() ;



        }
    }
}