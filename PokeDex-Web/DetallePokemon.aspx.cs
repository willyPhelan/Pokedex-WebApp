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
        public bool ConfirmaEliminacion { get; set ; }



        protected void Page_Load(object sender, EventArgs e)  
        {
            // Solo lo inicializamos en falso si no es un PostBack
            if (!IsPostBack)
            {
                ConfirmaEliminacion = false;
            }

            try 
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
                    string id = Request.QueryString["id"];

                    if (!string.IsNullOrEmpty(id)) 
                    {
                        PokemonNegocio negocio = new PokemonNegocio();
                        Pokemon seleccionado = negocio.listar(id)[0];


                        Session.Add("pokeSeleccionado", seleccionado) ;


                        // Precarga de campos a modificar 
                        txtId.Text = id;
                        txtNombre.Text = seleccionado.Nombre; 
                        txtDescripcion.Text = seleccionado.Descripcion; 
                        txtImagenUrl.Text = seleccionado.ImagenUrl; 
                        txtNumero.Text = seleccionado.Numero.ToString(); 
                        ddlTipo.SelectedValue = seleccionado.Tipo.Id.ToString();
                        ddlDebilidad.SelectedValue = seleccionado.Debilidad.Id.ToString(); 

                        txtImagenUrl_TextChanged(sender, e); 

                        // configurar acciones 
                        if(!seleccionado.Activo){

                        btnInactivar.Text = "Reactivar " ; }
                    } 
                }
            } 
            catch (Exception ex) 
            { 
                Session.Add("error", ex.Message); 
                throw ex; 
            } 
        }

        // Evento que se dispara automáticamente al cambiar el texto de la URL (gracias al AutoPostBack)
        protected void txtImagenUrl_TextChanged(object sender, EventArgs e) 
        {
            string url = txtImagenUrl.Text.Trim();

            if (!string.IsNullOrEmpty(url)) 
            {
                imgPokemon.ImageUrl = url;
            }
            else
            {
                imgPokemon.ImageUrl = "https://via.placeholder.com/200?text=Sin+Imagen";
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

                if (Request.QueryString["id"] != null) 
                {
                    // Si tiene ID, es una modificación
                    nuevo.Id = int.Parse(txtId.Text);
                    negocio.modificarConSp(nuevo);
                } 
                else 
                {
                    // Si no tiene ID, es un alta nueva
                    negocio.agregarconSP(nuevo);
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

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            ConfirmaEliminacion = true; 
        }

        protected void btnConfirmarEliminacion_Click(object sender, EventArgs e){
            try {
                if (chkConfirmaEliminacion.Checked)
                {
                    PokemonNegocio negocio = new PokemonNegocio();

                    negocio.eliminarLogico(int.Parse(txtId.Text)); // paso el id

                    Response.Redirect("PokemonLista.aspx", false); // redirigo
                }
            }
            catch (Exception ex) {

                Session.Add("error", ex.Message);

                throw ex;
            }
        }


        protected void btnInactivar_Click(object sender, EventArgs e){

        try {

            PokemonNegocio negocio = new PokemonNegocio() ;

         //   Pokemon seleccionado  = (Pokemon)Session["pokeSeleccionado"] ;

            negocio.eliminarLogico(int.Parse(txtId.Text)) ; 

            Response.Redirect("PokemonLista.aspx") ; 
           
            } catch(Exception ex){
            
                Session.Add("error", ex) ; 
                
            }

        


        }
    }
}