using System;
using System.Collections.Generic;
using System.Collections;
using System.Linq;
using System.Web;

namespace MEDICO
{
    public class Data
    {
        public static MedicoContext ctxData = new MedicoContext();

        public static int GetIdCabByIdRdv(int idRdv)
        {
            var idCabByIdRdv = ((Medecin)ctxData.Personnes.Find(ctxData.RendezVouss.Find(idRdv).Medecin_idPersonne)).Cabinet_idCabinet;
            return idCabByIdRdv;
        }

        public static bool isMedecin(string idUser)
        {
            var pers = ctxData.Personnes.Find(int.Parse(idUser));
            return (pers is Medecin);
        }
        public static bool isPatient(string idUser)
        {
            var pers = ctxData.Personnes.Find(int.Parse(idUser));
            return (pers is Patient);
        }
        public static bool isSecretaire(string idUser)
        {
            var pers = ctxData.Personnes.Find(int.Parse(idUser));
            return (pers is Secretaire);
        }
        public static Hashtable GetVilleForBind(Type enumeration)
        {
            string[] names = Enum.GetNames(enumeration);
            Array values = Enum.GetValues(enumeration);
            Hashtable ht = new Hashtable();
            for (int i = 0; i < names.Length; i++)
            {
                ht.Add(Convert.ToInt32(values.GetValue(i)).ToString(), names[i]);
            }
            return ht;
        }
    
   
    }
}