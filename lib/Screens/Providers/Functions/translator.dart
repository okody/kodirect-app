



class Translator
{
  final String currentLanguage;


  final Map arabic = {
    "DircetPage": [
      {
        "Text1": "قم بارسال رسالة لجهة الاتصال بالواتساب"
      }
    ],

  };

  Translator({this.currentLanguage = "ar"});




  getCurrentLanguage()
  {
    return this.currentLanguage;
  }



}