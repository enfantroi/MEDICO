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
    
    public partial class Medecin : CabinetService
    {
        public Medecin()
        {
            this.RendezVouss = new HashSet<RendezVous>();
        }
    
        public System.TimeSpan timeStartJob { get; set; }
        public System.TimeSpan timeEndJob { get; set; }
        public int Specialite_idSpecialite { get; set; }
    
        public virtual ICollection<RendezVous> RendezVouss { get; set; }
        public virtual Specialite Specialite { get; set; }
    }
}
