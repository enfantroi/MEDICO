using System;
using System.Collections.Generic;
using System.Collections;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MEDICO
{
    public partial class LesCabinets : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack || Request.QueryString["nomcab"] == null)
            {
                Hashtable ville = Data.GetVilleForBind(typeof(City));
                villeCab.DataSource = ville;
                villeCab.DataTextField = "value";
                villeCab.DataValueField = "key";
                villeCab.DataBind();
                
                using (var ctx = new MedicoContext())
                {
                    specialityDoc.DataTextField = "nom";
                    specialityDoc.DataValueField = "idSpecialite";
                    specialityDoc.DataSource = ctx.Specialites.ToList();
                    specialityDoc.DataBind();

                    var cabInfo = from cab in ctx.Cabinets
                                  join doc in ctx.Personnes.OfType<Medecin>() on cab.idCabinet equals doc.Cabinet_idCabinet
                                  join spec in ctx.Specialites on doc.Specialite_idSpecialite equals spec.idSpecialite
                                  select new
                                  {
                                      idCab = cab.idCabinet,
                                      nomCab = cab.nom,
                                      specCab = doc.Specialite.nom,
                                      villeCab = cab.ville,
                                      adresseCab = cab.adresse,
                                      photoCab = cab.photo,
                                      geoX = cab.geoLocationX,
                                      geoY = cab.geoLocationY,
                                      nomDoc = doc.nom,
                                      prenomDoc = doc.prenom,
                                  };
                    LesCab.DataSource = cabInfo.ToList();
                    LesCab.DataBind();
                }
            }
            if (Request.QueryString["nomcab"] != null)
            {
                using (var ctx = new MedicoContext())
                {
                    string nomCabDecode = HttpUtility.HtmlDecode(Request.QueryString["nomcab"]);
                    var cabInfo = from cab in ctx.Cabinets
                                  join doc in ctx.Personnes.OfType<Medecin>() on cab.idCabinet equals doc.Cabinet_idCabinet
                                  join spec in ctx.Specialites on doc.Specialite_idSpecialite equals spec.idSpecialite
                                  where cab.nom.Contains(nomCabDecode)
                                  select new
                                  {
                                      idCab = cab.idCabinet,
                                      nomCab = cab.nom,
                                      specCab = doc.Specialite.nom,
                                      villeCab = cab.ville,
                                      adresseCab = cab.adresse,
                                      photoCab = cab.photo,
                                      geoX = cab.geoLocationX,
                                      geoY = cab.geoLocationY,
                                      nomDoc = doc.nom,
                                      prenomDoc = doc.prenom,
                                  };
                    LesCab.DataSource = cabInfo.ToList();
                    LesCab.DataBind();
                    FilterCabPanel.Visible = false;
                }
            }
        }

        protected void filtrerParVilleAndSpec_Click(object sender, EventArgs e)
        {
            using (var ctx = new MedicoContext())
            {
                var cabInfo = from cab in ctx.Cabinets
                              join doc in ctx.Personnes.OfType<Medecin>() on cab.idCabinet equals doc.Cabinet_idCabinet
                              join spec in ctx.Specialites on doc.Specialite_idSpecialite equals spec.idSpecialite
                              select new
                              {
                                  idCab = cab.idCabinet,
                                  nomCab = cab.nom,
                                  specCab = doc.Specialite.nom,
                                  idspecCab = doc.Specialite_idSpecialite,
                                  villeCab = cab.ville,
                                  adresseCab = cab.adresse,
                                  photoCab = cab.photo,
                                  geoX = cab.geoLocationX,
                                  geoY = cab.geoLocationY,
                                  nomDoc = doc.nom,
                                  prenomDoc = doc.prenom,
                              };
                if (villeCab.SelectedValue != "")
                {
                    City villeFilter = (City)(int.Parse(villeCab.SelectedValue));
                    cabInfo = cabInfo.Where(c => c.villeCab == villeFilter);
                }
                if (specialityDoc.SelectedValue != "")
                {
                    int specFilter = int.Parse(specialityDoc.SelectedValue);
                    cabInfo = cabInfo.Where(c => c.idspecCab == specFilter);
                }
                LesCab.DataSource = cabInfo.ToList();
                LesCab.DataBind();

            }
            
        }

        protected void AnullerFilter_Click(object sender, EventArgs e)
        {
            Response.Redirect("/LesCabinets.aspx");
        }
    }
}