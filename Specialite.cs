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
    
    public partial class Specialite
    {
        public Specialite()
        {
            this.Medecin = new HashSet<Medecin>();
        }
    
        public int idSpecialite { get; set; }
        public string nom { get; set; }
        public string description { get; set; }
    
        public virtual ICollection<Medecin> Medecin { get; set; }
    }
}
