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
    
    public partial class Patient : Personne
    {
        public Patient()
        {
            this.nb_warning = 0;
            this.RendezVouss = new HashSet<RendezVous>();
        }
    
        public Nullable<System.DateTime> dateNaissance { get; set; }
        public int nb_warning { get; set; }
    
        public virtual ICollection<RendezVous> RendezVouss { get; set; }
    }
}
