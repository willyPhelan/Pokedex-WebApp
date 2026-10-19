using DominioPokemon;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Web;

namespace api_pokemon.Models {
    public class PokemonDto {

    public int Numero { get ; set ; }

    public string Nombre { get ; set ; } 

    public string Descripcion { get ; set ; }
  
    public string ImagenUrl { get ; set; }

    public int IdTipo { get ; set ; }

    public int IdDebilidad { get ; set ; }


 }
}