using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Doktorum
{
    public class Ayarlar
    {
        public Ayarlar()
        {

        }

        public static string Temizle(string Metin)
        {
            string deger = Metin;

            deger = deger.Replace("'", "");
            deger = deger.Replace("<", "");
            deger = deger.Replace(">", "");
            deger = deger.Replace("&", "");
            deger = deger.Replace("[", "");
            deger = deger.Replace("]", "");
            deger = deger.Replace("(", "");
            deger = deger.Replace(")", "");
            deger = deger.Replace("#", "");

            return deger;
        }
        public static string LinkDuzenle(string Metin)
        {
            string deger = Metin;
            deger = deger.Replace("'", "");
            deger = deger.Replace(" ", "_");
            deger = deger.Replace("<", "");
            deger = deger.Replace(">", "");
            deger = deger.Replace("&", "");
            deger = deger.Replace("[", "");
            deger = deger.Replace("]", "");
            deger = deger.Replace("ı", "i");
            deger = deger.Replace("ö", "o");
            deger = deger.Replace("ü", "u");
            deger = deger.Replace("ş", "s");
            deger = deger.Replace("ç", "c");
            deger = deger.Replace("ğ", "g");
            deger = deger.Replace("İ", "i");
            deger = deger.Replace("Ö", "o");
            deger = deger.Replace("Ü", "u");
            deger = deger.Replace("Ş", "s");
            deger = deger.Replace("Ç", "c");
            deger = deger.Replace("Ğ", "g");

            return deger;
        }

    }
}