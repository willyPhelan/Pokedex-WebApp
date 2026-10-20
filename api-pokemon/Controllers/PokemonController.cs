using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using DominioPokemon ; 
using NegocioPokemon ; 
using api_pokemon.Models ;

namespace api_pokemon {
    public class PokemonController : ApiController {

        // GET: api/Pokemon
        public IEnumerable<Pokemon> Get() {

            PokemonNegocio negocio = new PokemonNegocio() ;
            
            return negocio.listar() ; }

        // GET: api/Pokemon/5
        public Pokemon Get(int id) {

            PokemonNegocio negocio = new PokemonNegocio() ;

            List<Pokemon> lista = negocio.listar() ;

            return lista.Find(x => x.Id == id);
        }

        // POST: api/Pokemon
        public void Post([FromBody]PokemonDto poke) {

        PokemonNegocio negocio = new PokemonNegocio() ;
        
        Pokemon nuevo = new Pokemon() ; 

        nuevo.Nombre = poke.Nombre ; 

        nuevo.Descripcion = poke.Descripcion ; 

        nuevo.ImagenUrl = poke.ImagenUrl ;

        nuevo.Numero = poke.Numero ; 

        nuevo.Tipo = new Elemento { Id=poke.IdTipo } ;
        
        nuevo.Debilidad = new Elemento { Id = poke.IdDebilidad } ;
        
        negocio.agregar(nuevo) ;

            

        }

        // PUT: api/Pokemon/5
        public void Put(int id, [FromBody]PokemonDto poke){


        PokemonNegocio negocio = new PokemonNegocio() ;
        
        Pokemon nuevo = new Pokemon() ; 

        nuevo.Nombre = poke.Nombre ; 

        nuevo.Descripcion = poke.Descripcion ; 

        nuevo.ImagenUrl = poke.ImagenUrl ;

        nuevo.Numero = poke.Numero ; 

        nuevo.Tipo = new Elemento { Id=poke.IdTipo } ;
        
        nuevo.Debilidad = new Elemento { Id = poke.IdDebilidad } ;    
        
        nuevo.Id = id ;


        negocio.modificar(nuevo) ;
       

        }

        // DELETE: api/Pokemon/5
        public void Delete(int id){

        PokemonNegocio negocio = new PokemonNegocio() ; 

        negocio.eliminarLogico(id) ;


        }
    }
}
