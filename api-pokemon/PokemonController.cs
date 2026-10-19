using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using DominioPokemon ; 
using NegocioPokemon ; 

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
        public void Post([FromBody]string value)
        {
        }

        // PUT: api/Pokemon/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE: api/Pokemon/5
        public void Delete(int id)
        {
        }
    }
}
