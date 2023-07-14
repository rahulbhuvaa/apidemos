import 'package:get/get.dart';

import 'locale_keys.dart';

class CS {
  static const hello = "hello";
}

class Message extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          LocaleKeys.settings: "Settings",
          LocaleKeys.about_us: "About Us",
          LocaleKeys.languages: "Languages",
          LocaleKeys.contactUs: "Contact Us",
          LocaleKeys.deleteAccount: "Delete Account",
          LocaleKeys.reportUser: "Report User",
          LocaleKeys.logout: "Logout",
          LocaleKeys.logoutTitle: "Come back Soon!",
          LocaleKeys.deleteTitle: "Confirm account Deletion",
          LocaleKeys.privacyPolicy: "Privacy Policy",
        },
        "hi_IN": {
          LocaleKeys.settings: "सेटिंग्स",
          LocaleKeys.about_us: "हमारे बारे में",
          LocaleKeys.languages: "भाषाएँ",
          LocaleKeys.contactUs: "संपर्क करें",
          LocaleKeys.deleteAccount: "खाता हटा दो",
          LocaleKeys.reportUser: "उपयोगकर्ता को रिपोर्ट करें",
          LocaleKeys.logout: "लॉग आउट",
          LocaleKeys.logoutTitle: "जल्द ही वापस आना!",
          LocaleKeys.deleteTitle: "खाता हटाने की पुष्टि करें",
          LocaleKeys.selectedAddress: "चयनित पता",
          LocaleKeys.photo: "फोटो",
          LocaleKeys.text: "पाठ",
        },
        "gu_IN": {
          LocaleKeys.photo: "ફોટો",
          LocaleKeys.text: "ટેક્સ્ટ",
          LocaleKeys.privacyPolicy: "ગોપનીયતા નીતિ",
          LocaleKeys.selectedAddress: "પસંદ કરેલ સરનામું",
          LocaleKeys.settings: "સેટિંગ્સ",
          LocaleKeys.about_us: "અમારા વિશે",
          LocaleKeys.languages: "ભાષાઓ",
          LocaleKeys.contactUs: "અમારો સંપર્ક કરો",
          LocaleKeys.deleteAccount: "એકાઉન્ટ કાઢી નાખો",
          LocaleKeys.reportUser: "વપરાશકર્તાની જાણ કરો",
          LocaleKeys.logout: "લૉગ આઉટ",
          LocaleKeys.logoutTitle: "જલ્દી પાછા આવજો!",
          LocaleKeys.deleteTitle: "એકાઉન્ટ કાઢી નાખવાની પુષ્ટિ કરો",
          LocaleKeys.areyousureyouwanttoLogout: "શું તમે ખરેખર લોગઆઉટ કરવા માંગો છો?",
          LocaleKeys.areyousureyouwanttoDeleteAccount: "શું તમે ખરેખર આ એકાઉન્ટને કાયમ માટે કાઢી નાખવા માંગો છો?",
          LocaleKeys.cancel: "રદ કરો",
          LocaleKeys.next: "આગળ",
          LocaleKeys.save: "સેવ કરો",
        }
      };
}
