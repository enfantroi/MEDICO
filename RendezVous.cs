//------------------------------------------------------------------------------
// <auto-generated>
//    Ce code a été généré à partir d'un modèle.
//
//    Des modifications manuelles apportées à ce fichier peuvent conduire à un comportement inattendu de votre application.
//    Les modifications manuelles apportées à ce fichier sont remplacées si le code est régénéré.
// </auto-generated>
//------------------------------------------------------------------------------

namespace MEDICO
{
    using System;
    using System.Collections.Generic;
    
    public partial class RendezVous
    {
        public RendezVous()
        {
            this.accepte = false;
        }
    
        public int idRendezVous { get; set; }
        public string sujet { get; set; }
        public System.DateTime dateDajout { get; set; }
        public System.DateTime startTime { get; set; }
        public System.DateTime endTime { get; set; }
        public string motif { get; set; }
        public bool accepte { get; set; }
        public int Patient_idPersonne { get; set; }
        public int Medecin_idPersonne { get; set; }
    
        public virtual Patient Patient { get; set; }
        public virtual Medecin Medecin { get; set; }
    }
}
