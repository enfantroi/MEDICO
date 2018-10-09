using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MEDICO
{
    public partial class UnCabinet : System.Web.UI.Page
    {
        public string photoDoc;
        public string nomDoc;
        public string prenomDoc;
        public string specDoc;
        public string villeDoc;
        public string telDoc;
        public string emailDoc;
        public string adresseDoc;
        public string debutTrav;
        public string finTrav;
        public string photoCab;
        public string nomCab;
        public string adresseCab;
        public string villeCab;
        public string cpCab;
        public string descCab;
        public string geox;
        public string geoy;
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (Request.QueryString["id"] != null)
            {
                int idCabPass = int.Parse(Request.QueryString["id"]);
                using(var ctx = new MedicoContext())
                {
                    var docInfo = from cab in ctx.Cabinets
                                  join doc in ctx.Personnes.OfType<Medecin>() on cab.idCabinet equals doc.Cabinet_idCabinet
                                  join spec in ctx.Specialites on doc.Specialite_idSpecialite equals spec.idSpecialite
                                  where cab.idCabinet == idCabPass
                                  select new
                                  {
                                      photoDoc = doc.photo,
                                      nomDoc = doc.nom,
                                      prenomDoc = doc.prenom,
                                      specDoc = spec.nom,
                                      villeDoc = doc.ville,
                                      telDoc = doc.telephone,
                                      emailDoc = doc.email,
                                      adresseDoc = doc.adresse,
                                      debutTrav = doc.timeStartJob,
                                      finTrav = doc.timeEndJob,
                                      photoCab = cab.photo,
                                      nomCab = cab.nom,
                                      adresseCab = cab.adresse,
                                      villeCab = cab.ville,
                                      cpCab = cab.code_postale,
                                      descCab = cab.description,
                                      geox = cab.geoLocationX,
                                      geoy = cab.geoLocationY,
                                  };
                    var DataInfo = docInfo.First();

                    this.photoDoc = DataInfo.photoDoc;
                    this.nomDoc = DataInfo.nomDoc;
                    this.prenomDoc = DataInfo.prenomDoc;
                    this.specDoc = DataInfo.specDoc;
                    this.villeDoc = ((City)DataInfo.villeDoc).ToString();
                    this.telDoc = DataInfo.telDoc;
                    this.emailDoc = DataInfo.emailDoc;
                    this.adresseDoc = DataInfo.adresseDoc;
                    this.debutTrav = DataInfo.debutTrav.ToString().Substring(0,5);
                    this.finTrav = DataInfo.finTrav.ToString().Substring(0,5);
                    this.photoCab = DataInfo.photoCab;
                    this.nomCab = DataInfo.nomCab;
                    this.adresseCab = DataInfo.adresseCab;
                    this.villeCab = ((City)DataInfo.villeCab).ToString();
                    this.cpCab = DataInfo.cpCab.ToString();
                    this.descCab = DataInfo.descCab;
                    this.geox = DataInfo.geox.ToString();
                    this.geoy = DataInfo.geoy.ToString();
                }
            }
            this.Title = "Cabinet : " + nomCab;
        }
    }
}