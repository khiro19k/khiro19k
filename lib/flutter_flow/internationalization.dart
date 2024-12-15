import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['fr', 'ar'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? frText = '',
    String? arText = '',
  }) =>
      [frText, arText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HOMEPAGE
  {
    'esrc5o1e': {
      'fr': 'حسابي',
      'ar': '',
    },
    'ok9exi4s': {
      'fr': 'كلمة السر ',
      'ar': '',
    },
    'q66uu2js': {
      'fr': 'سياسة الخصوصية ',
      'ar': '',
    },
    'gvfiacxi': {
      'fr': 'الأحكام والشروط',
      'ar': '',
    },
    'b87qwkuo': {
      'fr': 'تسجيل الخروج ',
      'ar': '',
    },
    'c6elnzux': {
      'fr': 'ADMIN SETTINGS',
      'ar': '',
    },
    '9riqsljw': {
      'fr': 'تواصلو معنا ',
      'ar': '',
    },
    '2deswt63': {
      'fr': 'الخدمات',
      'ar': '',
    },
    '4u48diw0': {
      'fr': 'مناقصات واستشارات',
      'ar': '',
    },
    '513r989k': {
      'fr': 'مزادات علنية',
      'ar': '',
    },
    'fq5d5m65': {
      'fr': 'مقاولات \nو مناولات',
      'ar': '',
    },
    'vplpgwmp': {
      'fr': 'موردين',
      'ar': '',
    },
    'mooz3s5e': {
      'fr': 'المنح الؤقت',
      'ar': '',
    },
    '7168kjf9': {
      'fr': 'أرشيف ',
      'ar': '',
    },
    't6ia8nu9': {
      'fr': 'تواصل معنا ',
      'ar': '',
    },
    'pxcsbk1o': {
      'fr': 'تسجيل الخروج ',
      'ar': '',
    },
    'qhls2ob6': {
      'fr': 'مناقصات و استشارات ',
      'ar': '',
    },
    'aedcydpr': {
      'fr': 'مزادات علنية',
      'ar': '',
    },
    'tssv4m7k': {
      'fr': 'موردين',
      'ar': '',
    },
    'cqcfnmvt': {
      'fr': 'المنح المؤقت',
      'ar': '',
    },
    '3ou3xpkn': {
      'fr': 'مقاولات و مناولات',
      'ar': '',
    },
    'n9puhmra': {
      'fr': 'تواصل معنا ',
      'ar': '',
    },
    '1j8kqr59': {
      'fr': 'Home',
      'ar': '',
    },
  },
  // soumission
  {
    'lrw0fmkd': {
      'fr': 'المناقصات',
      'ar': '',
    },
    'ewzklvqh': {
      'fr': 'اختر ولاية ',
      'ar': '',
    },
    'ies3gfw0': {
      'fr': ' الولاية',
      'ar': 'الولاية',
    },
    'jmlf0ksb': {
      'fr': 'Search for an item...',
      'ar': '',
    },
    'aiey3c8a': {
      'fr': 'اختر قطاع',
      'ar': '',
    },
    'l99szwop': {
      'fr': '  اختر القطاع',
      'ar': '',
    },
    't9l143zr': {
      'fr': 'ابحث عن القطاع ..',
      'ar': '',
    },
    'i6rsvxqv': {
      'fr': 'التفاصيل',
      'ar': '',
    },
    'zhb4x778': {
      'fr': 'Home',
      'ar': '',
    },
  },
  // detail
  {
    'rfwli6it': {
      'fr': 'التفاصيل ',
      'ar': '',
    },
    'p4l3hvx9': {
      'fr': ': عنوان المناقصة أو الاستشارة ',
      'ar': '',
    },
    'nr4ejvdo': {
      'fr': '\n : الوصف ',
      'ar': '',
    },
    'tjm7qubf': {
      'fr': '\n :المعلن',
      'ar': '',
    },
    '08gnusmx': {
      'fr': '\n:العنوان',
      'ar': '',
    },
    'pvdw0ad5': {
      'fr': '\n:الهاتف',
      'ar': '',
    },
    'ft2u0q0s': {
      'fr': ':\nالمفات',
      'ar': '',
    },
    'vs0nj3v7': {
      'fr': '\n:تاريخ الاعلان',
      'ar': '',
    },
    'c3k4uijo': {
      'fr': 'PDF',
      'ar': '',
    },
    '544kw1p2': {
      'fr': ':سعر دفتر الشروط',
      'ar': '',
    },
    'f8vou7zc': {
      'fr': '\nمجاني\n',
      'ar': '',
    },
    'nqew1b8m': {
      'fr': 'Home',
      'ar': '',
    },
  },
  // Login
  {
    'srte5yjr': {
      'fr': 'تسجيل الدخول ',
      'ar': '',
    },
    'vfv3hh7w': {
      'fr': 'استخدم حسابك لتسجيل الدخول ',
      'ar': '',
    },
    'q0swn5hr': {
      'fr': 'البريد الالكتروني',
      'ar': '',
    },
    'ga92nhw7': {
      'fr': 'كلمة السر ',
      'ar': '',
    },
    'xetimnm9': {
      'fr': 'دخول',
      'ar': '',
    },
    'rkau4po5': {
      'fr': 'هل نسيت كلمت السر ؟',
      'ar': '',
    },
    '2wlfv8lb': {
      'fr': 'ليس لديك حساب ؟ أنشئ حسابك الان  ',
      'ar': '',
    },
    'pf63j81z': {
      'fr': 'انشاء حساب جديد',
      'ar': '',
    },
    'bnephiso': {
      'fr': 'Home',
      'ar': '',
    },
  },
  // signup
  {
    '8kcuruuw': {
      'fr': 'انشاء حساب ',
      'ar': '',
    },
    '2gaa8o6u': {
      'fr': 'الاسم',
      'ar': '',
    },
    'v06kfryq': {
      'fr': 'البريد الالكتروني',
      'ar': '',
    },
    '2n4epjj0': {
      'fr': 'كلمة السر ',
      'ar': '',
    },
    '4v55je6c': {
      'fr': 'تأكيد كلمة السر ',
      'ar': '',
    },
    'lbuwjlgj': {
      'fr': 'بمجرد التسجيل معنا فأنت توافق الاحكام والشروط الخاصة بنا',
      'ar': '',
    },
    '7g6h6lgv': {
      'fr': 'بمجرد التسجيل معنا فأنت توافق الاحكام والشروط الخاصة بنا',
      'ar': '',
    },
    'ecw0e9x2': {
      'fr': 'انشاء حساب ',
      'ar': '',
    },
    'wyo29nfp': {
      'fr': 'هل أنت مسجل مسبقا ؟',
      'ar': '',
    },
    'buloqh4x': {
      'fr': ' تسجيل الدخول',
      'ar': '',
    },
    'vm1ilh6d': {
      'fr': 'Home',
      'ar': '',
    },
  },
  // enchaires
  {
    'n5b03lac': {
      'fr': 'مزادات علنية ',
      'ar': '',
    },
    'crzfidk8': {
      'fr': ' جميع الولايات    ',
      'ar': '',
    },
    'vg32wbk8': {
      'fr': 'العاصمة',
      'ar': '',
    },
    'ro6ajjyq': {
      'fr': 'ميلة',
      'ar': '',
    },
    '39k2xkfi': {
      'fr': 'قسنطينة',
      'ar': '',
    },
    'kckzuyga': {
      'fr': '         الولاية',
      'ar': '',
    },
    'zx18r18b': {
      'fr': 'Search for an item...',
      'ar': '',
    },
    'hxj9odne': {
      'fr': 'الكل',
      'ar': '',
    },
    'nfhqubow': {
      'fr': 'صيانة',
      'ar': '',
    },
    'hn0rfagc': {
      'fr': 'مقاولات عامة ',
      'ar': '',
    },
    '40sgbadk': {
      'fr': 'انشاءات',
      'ar': '',
    },
    'vys3xys9': {
      'fr': '  اختر القطاع',
      'ar': '',
    },
    '9qg2gifa': {
      'fr': 'Search for an item...',
      'ar': '',
    },
    'hy5le6kf': {
      'fr': 'اعلان عن بيع بالمزاد العلني لمحجوزات ',
      'ar': '',
    },
    'dzxlebdj': {
      'fr': 'ولاية قسنطينة  ',
      'ar': '',
    },
    '8grfjqhu': {
      'fr': 'بيع بالمزاد العلني  في شكل حصة وحيدة تنفيذا لأمر الحجز التنفيذي ',
      'ar': '',
    },
    'fih9bmzr': {
      'fr': 'التفاصيل',
      'ar': '',
    },
    'i0duqqz0': {
      'fr': '                  تاريخ الاعلان : 2024.05.27',
      'ar': '',
    },
    'fsz356w2': {
      'fr': 'اعلان عن بيع بالمزاد العلني لعتاد  ',
      'ar': '',
    },
    'xf1imqrr': {
      'fr': 'ولاية ميلة ',
      'ar': '',
    },
    'n8ub5utb': {
      'fr': 'بيع بالمزاد العلني لعتاد خاص بالحضيرة الخاصة بالولاية ',
      'ar': '',
    },
    'svgnqxvy': {
      'fr': 'التفاصيل',
      'ar': '',
    },
    'lbu6z8xd': {
      'fr': '                  تاريخ الاعلان : 2024.04.23',
      'ar': '',
    },
    'd3ndmx93': {
      'fr': 'Home',
      'ar': '',
    },
  },
  // enchaires_details
  {
    'refeh94v': {
      'fr': 'التفاصيل ',
      'ar': '',
    },
    'ewec65ld': {
      'fr': 'بيع بالمزاد العلني لمحجوزات',
      'ar': '',
    },
    'soxdnd3j': {
      'fr': ': عنوان المزاد ',
      'ar': '',
    },
    'vkkotnw5': {
      'fr':
          'اعلان عن بيع بالمزاد العلني لمحجوزات بالاظرفة \nالمختومة فقط بتاريخ 2024/05/27',
      'ar': '',
    },
    'vi54i4z3': {
      'fr': '\n : الوصف ',
      'ar': '',
    },
    'p7244h8s': {
      'fr':
          '\nتبعا للامر بالحجز التنفيذي على منقول الصادر عن رئيس المحكمة التجارية المتخصصة قسنطينة اعلان عن بيع عن طريق المزاد العلني للمحجوزات التالية \nشاحنة من نوع فولفو سنة 2003  ذات عربة مثلجة و ذلك حسب شروط البيع المعتادة\n-البيع بدون ضمان- \nتكملة مبلغ رسوم  المزاد في أجل أقصاه 8 أيام\n\n',
      'ar': '',
    },
    'uiaz0mmb': {
      'fr': '\n :المعلن',
      'ar': '',
    },
    'axw16fmx': {
      'fr': '\nالشركة المدنية المهنية للمحضرين القضائيين \n',
      'ar': '',
    },
    'jtdtdlag': {
      'fr': '\n:العنوان',
      'ar': '',
    },
    'ev960qvv': {
      'fr': 'Bâtiment E8 num 264 constantine',
      'ar': '',
    },
    'k27qg9sy': {
      'fr': '\n:الهاتف',
      'ar': '',
    },
    '7rzle9f5': {
      'fr': '030-33642-44',
      'ar': '',
    },
    '7psz9nb0': {
      'fr': '\n:الملفات',
      'ar': '',
    },
    'hysq86bp': {
      'fr': '\n:تاريخ الاعلان',
      'ar': '',
    },
    'ekanj15x': {
      'fr': 'PDF',
      'ar': '',
    },
    'ihsmiu8f': {
      'fr': '\n2024-05-27\n',
      'ar': '',
    },
    '6vsde266': {
      'fr': ':العربون',
      'ar': '',
    },
    'fokb7c55': {
      'fr': '\n1.000.000\n',
      'ar': '',
    },
    'dh49v3kt': {
      'fr': 'Home',
      'ar': '',
    },
  },
  // notification
  {
    'x4spl3u1': {
      'fr': 'التنبيهات',
      'ar': '',
    },
    'xeetppfb': {
      'fr': 'لا توجد اشعارات لعرضها ',
      'ar': '',
    },
    'alupkekv': {
      'fr': 'Home',
      'ar': '',
    },
  },
  // FOURNISSEUR
  {
    '3b2c31vm': {
      'fr': 'موردين ',
      'ar': '',
    },
    'r6i59l11': {
      'fr': ' جميع الولايات    ',
      'ar': '',
    },
    '5th94ff1': {
      'fr': 'العاصمة',
      'ar': '',
    },
    'pg72h2lp': {
      'fr': 'ميلة',
      'ar': '',
    },
    't8dvtjl8': {
      'fr': 'قسنطينة',
      'ar': '',
    },
    'bj571x9a': {
      'fr': '         الولاية',
      'ar': '',
    },
    'ipl5joc4': {
      'fr': 'Search for an item...',
      'ar': '',
    },
    'm7b7ftqg': {
      'fr': 'الكل',
      'ar': '',
    },
    '4nmd9pk7': {
      'fr': 'صيانة',
      'ar': '',
    },
    'oud9jyg8': {
      'fr': 'مقاولات عامة ',
      'ar': '',
    },
    'znw64jkj': {
      'fr': 'انشاءات',
      'ar': '',
    },
    'fvxrf5df': {
      'fr': '  اختر القطاع',
      'ar': '',
    },
    'g6cq6wk1': {
      'fr': 'Search for an item...',
      'ar': '',
    },
    'qw3hj28b': {
      'fr': 'تاجنانت ولاية ميلة',
      'ar': '',
    },
    'mlj4ydax': {
      'fr': 'بيع لوازم صناعة الأبواب و النوافذ البلاستيكية',
      'ar': '',
    },
    'mhlul732': {
      'fr': 'التفاصيل',
      'ar': '',
    },
    '35146i6v': {
      'fr': 'Home',
      'ar': '',
    },
  },
  // fournisseurdetails
  {
    'dhcfu3hn': {
      'fr': 'التفاصيل ',
      'ar': '',
    },
    'bkpl7swe': {
      'fr': ': اسم المورد ',
      'ar': '',
    },
    'ibe7ng42': {
      'fr': '\n :التفاصيل  ',
      'ar': '',
    },
    '1nlmbl3g': {
      'fr': '\n:العنوان',
      'ar': '',
    },
    'emowad7a': {
      'fr': 'تاجنانت حي 246 مسكن',
      'ar': '',
    },
    'xbs7e0j9': {
      'fr': '\n:صور المنتجات',
      'ar': '',
    },
    'clngiy1i': {
      'fr': 'Home',
      'ar': '',
    },
  },
  // passwordrest
  {
    'twqmquce': {
      'fr': ':استرجاع كلمة المرور',
      'ar': '',
    },
    'hevo0eks': {
      'fr': 'Back',
      'ar': '',
    },
    'memwlsd5': {
      'fr':
          'سنرسل لك بريدا إلكترونيا يحتوي على رابط لإعادة تعيين كلمة المرور الخاصة بك ، يرجى إدخال البريد الإلكتروني المرتبط بحسابك أدناه.',
      'ar': '',
    },
    '20d5vqds': {
      'fr': 'البريد الالكتروني ',
      'ar': '',
    },
    '88mrd0yh': {
      'fr': 'ارسال الرابط ',
      'ar': '',
    },
    'wsjonow4': {
      'fr': 'رجوع',
      'ar': '',
    },
    '60vvkqbb': {
      'fr': 'Home',
      'ar': '',
    },
  },
  // FOURNISSEURCopy
  {
    'boz36duo': {
      'fr': 'موردين ',
      'ar': '',
    },
    '8vhd1g3u': {
      'fr': ' جميع الولايات    ',
      'ar': '',
    },
    'ke66njpt': {
      'fr': 'العاصمة',
      'ar': '',
    },
    '49p14zoh': {
      'fr': 'ميلة',
      'ar': '',
    },
    'gw4iy7u7': {
      'fr': 'قسنطينة',
      'ar': '',
    },
    'juclyn0u': {
      'fr': '         الولاية',
      'ar': '',
    },
    'j9sqgbhu': {
      'fr': 'Search for an item...',
      'ar': '',
    },
    'nb43oeyp': {
      'fr': 'الكل',
      'ar': '',
    },
    '8fs9zr5g': {
      'fr': 'صيانة',
      'ar': '',
    },
    'uftqhpzw': {
      'fr': 'مقاولات عامة ',
      'ar': '',
    },
    'vpq0ms8r': {
      'fr': 'انشاءات',
      'ar': '',
    },
    'fq8yyx12': {
      'fr': '  اختر القطاع',
      'ar': '',
    },
    'irojln8s': {
      'fr': 'Search for an item...',
      'ar': '',
    },
    'bk5dedpa': {
      'fr': 'The WOLF PVC Tadjenanet',
      'ar': '',
    },
    'eyfmlvq3': {
      'fr': 'تاجنانت ولاية ميلة',
      'ar': '',
    },
    'czr2krn5': {
      'fr': 'بيع لوازم صناعة الأبواب و النوافذ البلاستيكية',
      'ar': '',
    },
    'nn7ygnmd': {
      'fr': 'التفاصيل',
      'ar': '',
    },
    'i7nylllu': {
      'fr': '                  تاريخ الاعلان : 2024.06.12',
      'ar': '',
    },
    '2opoi4sc': {
      'fr': 'Home',
      'ar': '',
    },
  },
  // entres
  {
    'fbn5czim': {
      'fr': 'مرحبا',
      'ar': '',
    },
    'elqvz1bj': {
      'fr':
          'منصتك المثالية للوصول إلى المناقصات واستشارات السوق العمومي في جميع القطاعات بالجزائر',
      'ar': '',
    },
    'wji1qy1c': {
      'fr': 'ابدأ الآن واستفد من خدماتنا المبتكرة لتطوير أعمالك وتحقيق أهدافك!',
      'ar': '',
    },
    '4fdoxg8a': {
      'fr': '        ابدا الان        ',
      'ar': '',
    },
    'f02jx4g2': {
      'fr':
          'استكشف عالمًا من الفرص المتميزة، وتواصل مع أفضل الموردين والشركات المقاولاتية لإنجاز مشاريعك بكفاءة واحترافية.',
      'ar': '',
    },
    'qz1ffaur': {
      'fr': 'Home',
      'ar': '',
    },
  },
  // confi
  {
    '5rcexo2m': {
      'fr': 'سياسة الخصوصية ',
      'ar': '',
    },
    'wjg6npyp': {
      'fr':
          'في تطبيقنا نلتزم بحماية خصوصيتك وبياناتك الشخصية . نحن ندرك أهمية حماية معلوماتك ونتخذ الاجراءات اللازمة لضمان سرية بياناتك ',
      'ar': '',
    },
    '2izbr10y': {
      'fr': 'جمع البيانات',
      'ar': '',
    },
    'zwnf0wce': {
      'fr':
          'نحن نجمع البيانات عند استخدامك لمنصتنا للوصول الى المعلومات أو الخدمات يمكن أن تتضمن البيانات التي نجمعها معلومات شخصية مثل اسمك وعنان بريدك الالكتروني ورقم هاتفك . كما نجمع المعلومات عن استخدامك لمنصتنا مثل الصفحات التي تروها و الخدمات التي تستخدمها ',
      'ar': '',
    },
    '8y9wtvni': {
      'fr': 'استخدام البيانات ',
      'ar': '',
    },
    '23r2fyx0': {
      'fr':
          'نستخدم البيانات التي نجمعها لتحسين منصتنا وخدماتنا ، وتزويدك بمعلومات وعروض مخصصة ، والاتصال بك إذا لزم الأمر ، والرد على طلباتك. قد نستخدم البيانات أيضًا لأسباب قانونية أو تنظيمية أو أمنية.',
      'ar': '',
    },
    'axlpuwhn': {
      'fr': 'مشاركة البيانات ',
      'ar': '',
    },
    'cb5r4gg4': {
      'fr':
          'نحن لا نشارك بياناتك الشخصية مع أطراف ثالثة بدون موافقتك ، إلا إذا كان ذلك ضروريًا لتزويدك بالخدمات\nالتي طلبتها أو للامتثال لالتزامات قانوني.\n',
      'ar': '',
    },
    'zndertxs': {
      'fr': 'أمان البيانات',
      'ar': '',
    },
    '97m8rmbn': {
      'fr':
          'نتخذ إجراءات أمنية معقولة لحماية بياناتك الشخصية من الفقدان والاستخدام غير المشروع والوصول غير المصرح به. لقد وضعنا إجراءات لضمان أمان بياناتك ، بما في ذلك التدابير الفيزيائية والإلكترونية والإدارية',
      'ar': '',
    },
    '4ys82kr0': {
      'fr': 'تعديلات سياسة الخصوصية ',
      'ar': '',
    },
    'leegipzo': {
      'fr':
          'قد نقوم بتعديل سياسة الخصوصية الخاصة بنا من\nوقت لآخر. إذا قمنا بإجراء تعديلات كبيرة على هذه\nالسياسة ، فسوف نقوم بإعلامك بذلك عبر البريد\nالإلكتروني أو من خلال منصتنا.',
      'ar': '',
    },
    'cavqxxsn': {
      'fr': 'Home',
      'ar': '',
    },
  },
  // terms
  {
    '2hbau73c': {
      'fr': 'الأحكام والشروط ',
      'ar': '',
    },
    'hx60w7sq': {
      'fr':
          'باستخدام منصتنا ، فإنك توافق على شروط وأحكام الاستخدام هذه \"الشروط\"). تحكم هذه الشروط استخدامك لـ تطبيقنا، بما في ذلك الوصول إلى الخدمات التي نقدمها ',
      'ar': '',
    },
    '782np7y6': {
      'fr': ' وصف الخدمة',
      'ar': '',
    },
    '1pgw1kfo': {
      'fr':
          'صفقتي  او ماي ديلي هي منصة على الانترنات تقوم بنشر المناقصات والاستشارات الخاصة بالسوق العمومي والخاص في الجزائر بالاضافة الى ذلك توفر المنصة المزادات العلنية  و الوصول الى الموردين ',
      'ar': '',
    },
    'hzl61hqt': {
      'fr': 'استخدام المنصة',
      'ar': '',
    },
    '5i1it7n3': {
      'fr':
          'أنت توافق على استخدام ماي ديلي  للأغراض المشروعة فقط ووفقًا لهذه الشروط. أنت توافق أيضًا على عدم استخدام المنصة لأنشطة احتيالية أو غير قانونية',
      'ar': '',
    },
    'klaqkm83': {
      'fr': '  مسؤولية المستخدم',
      'ar': '',
    },
    'kn4xr9by': {
      'fr':
          'أنت مسؤول عن دقة واكتمال المعلومات التي تقدمها على . أنت مسؤول أيضًا عن استخدامك لـ صفقتي وتوافق على تعويضنا عن اي انتهاك لهذه الشروط',
      'ar': '',
    },
    'z85cchux': {
      'fr': 'حقوق الملكية الفكرية',
      'ar': '',
    },
    'su521ffz': {
      'fr':
          'تطبيق صفقتي وجميع محتوياته محمية بموجب قوانين الملكية الفكرية. أنت توافق على عدم استخدام أو إعادة إنتاج أو توزيع محتوى التطبيق دون إذن كتابي مسبق منا',
      'ar': '',
    },
    'olris1ab': {
      'fr': ' التعديل والإنهاء',
      'ar': '',
    },
    'w7adi6qa': {
      'fr':
          'نحتفظ بالحق في تعديل أو إنهاء صفقتي في أي وقت دون إشعار. نحتفظ أيضًا بالحق في إنهاء وصولك إلى التطبيق في حالة انتهاك هذه الشروط',
      'ar': '',
    },
    'eqzpmikx': {
      'fr': 'الاشتراك ',
      'ar': '',
    },
    'ebnqnajs': {
      'fr':
          ' يسمح التطبيق من الاستفادة من فترة تجريبية لمدة 3 أيام يمكنه فيها الوصول الى جميع مزايا التطبيق  ',
      'ar': '',
    },
    '5v1u1da7': {
      'fr':
          'يتم تقديم الاشتراك بسعر يتوافق مع مستوى الخدمة اللذي يختاره العميل \nيتم اصدار فاتورة مرسلة قابلة للطباغة عند استلام تأكيد الدفع ',
      'ar': '',
    },
    'jn5rkth0': {
      'fr': 'تعديل الشروط',
      'ar': '',
    },
    '0yyd539j': {
      'fr':
          'نحتفظ بالحق في تعديل هذه الشروط في أي وقت.  سيتم نشر التعديلات حين صدورها وستدخل حيز التنفيذ بمجرد نشرها.\nباستخدام هذا التطبيق ، فإنك تقبل هذه الشروط وتتعهد باحترامها. إذا كانت لديك أي أسئلة حول هذه الشروط ، فيرجى الاتصال بنا ',
      'ar': '',
    },
    'y5mg36k8': {
      'fr': 'Home',
      'ar': '',
    },
  },
  // ADMIN
  {
    '28f9451s': {
      'fr': 'USERS',
      'ar': '',
    },
    'm919hwrx': {
      'fr': 'soumissions',
      'ar': '',
    },
    '1ayk4776': {
      'fr': 'Abonnements',
      'ar': '',
    },
    '6ngxdq4a': {
      'fr': 'Dashboard',
      'ar': '',
    },
    'ln7e5m0r': {
      'fr': 'Your users information is here',
      'ar': '',
    },
    'oagbad3t': {
      'fr': 'users Summary',
      'ar': '',
    },
    '8zyqf2tl': {
      'fr': 'An overview of your users',
      'ar': '',
    },
    '6x6wpqsy': {
      'fr': '23%',
      'ar': '',
    },
    'sk1x2chr': {
      'fr': 'نسبة المشتركين في المزادات العلنية ',
      'ar': '',
    },
    '7khlb8o9': {
      'fr': '93%',
      'ar': '',
    },
    'atmp346r': {
      'fr': 'نسبة المشتركين في الباقة المميزة ',
      'ar': '',
    },
    '9r9uj221': {
      'fr': 'Active Users',
      'ar': '',
    },
    'a6w42u9c': {
      'fr': 'A small summary of your users base',
      'ar': '',
    },
    'u1x3k3ig': {
      'fr': 'Total User Count',
      'ar': '',
    },
    'fexm0rdd': {
      'fr': 'An overview of all your users on your platform.',
      'ar': '',
    },
    'nyz8ahlt': {
      'fr': 'Total User Count',
      'ar': '',
    },
    'v9g3xsk0': {
      'fr': 'An overview of all your users on your platform.',
      'ar': '',
    },
    'xgqr8y35': {
      'fr': 'My Users',
      'ar': '',
    },
    'hgbhyp2n': {
      'fr': 'Member Name',
      'ar': '',
    },
    'xgmz5aql': {
      'fr': 'Email',
      'ar': '',
    },
    'rdas2zf9': {
      'fr': 'Numero',
      'ar': '',
    },
    'iv2rdjb1': {
      'fr': 'Date Created',
      'ar': '',
    },
    'tmnek9fd': {
      'fr': 'Status',
      'ar': '',
    },
    'vby0oozp': {
      'fr': 'Active',
      'ar': '',
    },
    '2ci53u6o': {
      'fr': '•',
      'ar': '',
    },
  },
  // adminsoumission
  {
    'q2l3an0u': {
      'fr': 'USERS',
      'ar': '',
    },
    'kxk5est0': {
      'fr': 'soumissions',
      'ar': '',
    },
    'z7yf6rvn': {
      'fr': 'Abonnements',
      'ar': '',
    },
    'nk007zs3': {
      'fr': 'Dashboard',
      'ar': '',
    },
    'mch3f6gv': {
      'fr': 'users Summary',
      'ar': '',
    },
    'qadf201c': {
      'fr': 'An overview of your users',
      'ar': '',
    },
    '65diknr4': {
      'fr': 'A small summary of your users base',
      'ar': '',
    },
    'rjnl0w1c': {
      'fr': 'اضافة مناقصة',
      'ar': '',
    },
    'fh8mq6b7': {
      'fr': 'عدد المنقصات المطروحة',
      'ar': '',
    },
    'nk25tzwj': {
      'fr': 'Total User Count',
      'ar': '',
    },
    '6oiwv6l6': {
      'fr': 'An overview of all your users on your platform.',
      'ar': '',
    },
    'hmjd4dhu': {
      'fr': '56.4k',
      'ar': '',
    },
    'f6nualrr': {
      'fr': 'Tout les  Soumission',
      'ar': '',
    },
    'rlxl3rkw': {
      'fr': 'عنوان المناقصة',
      'ar': '',
    },
    '8kgypm7w': {
      'fr': 'المعلن',
      'ar': '',
    },
    'r71nb9td': {
      'fr': 'الولاية',
      'ar': '',
    },
    'u2hnrp4h': {
      'fr': 'القطاع',
      'ar': '',
    },
    'eqpw5791': {
      'fr': 'تاريخ الاعلان',
      'ar': '',
    },
    'dfrm9487': {
      'fr': 'user@domainname.com',
      'ar': '',
    },
    'jghtdvvk': {
      'fr': '•',
      'ar': '',
    },
  },
  // Checkout3
  {
    '9peadsr5': {
      'fr':
          'للاطلاع على كل أنواع الاعلانات المطروحة الخاصة بالسوق العمومي من استشارات . مناقصات ومزادات علنية \nحيث نوفر لك باقة مميزة وتحديث يومي مستمر\n ',
      'ar': '',
    },
    'f1ey78zx': {
      'fr': 'الباقة  الخاصة بالمناقصات',
      'ar': '',
    },
    '0rl4d4yu': {
      'fr': '   ا   اختيار جميع القطاعات دون استثناء-  ',
      'ar': '',
    },
    '1qsob4vo': {
      'fr': 'كل الخيارات و المميزات الموجودة في التطبيق -',
      'ar': '',
    },
    '37rtingh': {
      'fr': 'دينار جزائري ',
      'ar': '',
    },
    '35r6wgen': {
      'fr': '10000.00',
      'ar': '',
    },
    '0psxm4m4': {
      'fr': 'الاشتراك لمدة سنة واحدة بسعر',
      'ar': '',
    },
    'nzfitafz': {
      'fr': 'الاشتراك مفعل ',
      'ar': '',
    },
    'xxklhy1z': {
      'fr': 'اشترك الان ',
      'ar': '',
    },
    'o9enemh3': {
      'fr': 'الباقة  الخاصة بالمزادات العلنية',
      'ar': '',
    },
    'dt25s2bt': {
      'fr': '   الاطلاع على كل اعلانات البيع بالمزاد العلني -  ',
      'ar': '',
    },
    '35r1n1fs': {
      'fr': 'كل القطاعات وكل الولايات لمدة سنة واحدة ',
      'ar': '',
    },
    'fvyhx73l': {
      'fr': 'دينار جزائري ',
      'ar': '',
    },
    'v6sxthmz': {
      'fr': ' 10000.00  ',
      'ar': '',
    },
    'kj9we59o': {
      'fr': 'الاشتراك لمدة سنة واحدة بسعر',
      'ar': '',
    },
    '7ehzos4m': {
      'fr': 'الاشتراك ',
      'ar': '',
    },
    'h1ra0dk3': {
      'fr': 'Home',
      'ar': '',
    },
  },
  // checkmembership
  {
    'qo6184g3': {
      'fr':
          'لاتمام عملية الاشتراك في تطبيقنا يرجى تسديد قيمة الاشتراك عن طريق الايداع في البنك او عبر الحوالة  في الحساب البريدي ',
      'ar': '',
    },
    'w2suhrep': {
      'fr': 'المعلومات الخاصة بالدفع ',
      'ar': '',
    },
    '6w8eeqs0': {
      'fr': 'الحساب البنكي الخاص بالتطبيق ',
      'ar': '',
    },
    '1m3sqvd1': {
      'fr': 'Aence BADR CONSTANTINE - SPAS -\nAHMED YAHIA KHIREADDINE',
      'ar': '',
    },
    'vq8h8ytg': {
      'fr': 'أو عن طريق الايداع عبر الحوالة في الحساب البريدي \nاو بريدي موب ',
      'ar': '',
    },
    'ygj0wk0v': {
      'fr':
          'CCP l AHMED YAHIA KHIRE ADDINE \n0028136447 CLE 71\nRIP 00799999002813644771',
      'ar': '',
    },
    '2shnciqo': {
      'fr': 'دينار جزائري ',
      'ar': '',
    },
    'zfwfwmk2': {
      'fr': ' 10000.00  ',
      'ar': '',
    },
    'r0vctfnt': {
      'fr': 'الاشتراك لمدة سنة واحدة بسعر',
      'ar': '',
    },
    'fuoj7mn9': {
      'fr': 'يرجى ملء الاستمارة التالية ',
      'ar': '',
    },
    '3s60jnsf': {
      'fr': 'الاسم واللقب هنا ',
      'ar': '',
    },
    '62f12z4x': {
      'fr': 'الاسم واللقب الكامل ',
      'ar': '',
    },
    'okx9zses': {
      'fr': 'المنصب هنا',
      'ar': '',
    },
    'v0v9o24s': {
      'fr': 'المنصب ',
      'ar': '',
    },
    's5e7xld2': {
      'fr': 'أدخل رقم الهاتف الخاص بالشركة ',
      'ar': '',
    },
    'i74dxemt': {
      'fr': 'الهاتف',
      'ar': '',
    },
    '1j4s4aaf': {
      'fr': 'الاسم الخاص بالشركة ',
      'ar': '',
    },
    'a2rwa5ja': {
      'fr': 'اسم الشركة ',
      'ar': '',
    },
    'nuhqh2tl': {
      'fr': 'الولاية',
      'ar': '',
    },
    '7gw178kb': {
      'fr': 'ولاية النشاط',
      'ar': '',
    },
    'jov91aok': {
      'fr': 'اختيار صورة',
      'ar': '',
    },
    'jgtenyf6': {
      'fr': 'دليل الدفع هنا ',
      'ar': '',
    },
    'thvnqjj4': {
      'fr': 'اوافق على ان جميع المعلومات المرفقة صحيحة ',
      'ar': '',
    },
    'co0oz5v8': {
      'fr': 'ارسال',
      'ar': '',
    },
    'ykn3wv4c': {
      'fr': 'يرجى ملء هذه الخانة ',
      'ar': '',
    },
    'bryr0p8z': {
      'fr': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'oo80io31': {
      'fr': 'يرجى ملء هذه الخانة ',
      'ar': '',
    },
    '23s57ck3': {
      'fr': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '8t337dwd': {
      'fr': 'يرجى ملء هذه الخانة ',
      'ar': '',
    },
    'e2bnjztm': {
      'fr': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '6qjm5en8': {
      'fr': 'يرجى ملء هذه الخانة ',
      'ar': '',
    },
    'mbn81elf': {
      'fr': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'wo3ufs33': {
      'fr': 'ادخل الولاية من فضلك',
      'ar': '',
    },
    'wiy2rlgq': {
      'fr': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '0viksdk6': {
      'fr': 'الاشتراك في الباقة الخاصة بالمناقصات',
      'ar': '',
    },
    'v8he6a7b': {
      'fr': 'Home',
      'ar': '',
    },
  },
  // abonnementdash
  {
    'wa1vjvup': {
      'fr': 'USERS',
      'ar': '',
    },
    '1epvtmt8': {
      'fr': 'soumissions',
      'ar': '',
    },
    '9cr9ra3y': {
      'fr': 'Abonnements',
      'ar': '',
    },
    'jqwf538b': {
      'fr': 'Dashboard',
      'ar': '',
    },
    '8i3vxhov': {
      'fr': 'users Summary',
      'ar': '',
    },
    'c6l45hc6': {
      'fr': 'An overview of your users',
      'ar': '',
    },
    'rbu3t2zi': {
      'fr': 'A small summary of your users base',
      'ar': '',
    },
    'wzvmx2k8': {
      'fr': 'اضافة مناقصة',
      'ar': '',
    },
    'fvvj72qi': {
      'fr': 'عدد طلبات الاشتراك ',
      'ar': '',
    },
    'h5b3haab': {
      'fr': 'Total User Count',
      'ar': '',
    },
    'rwul8hm5': {
      'fr': 'An overview of all your users on your platform.',
      'ar': '',
    },
    '7ytjktdk': {
      'fr': '56.4k',
      'ar': '',
    },
    'dydwil22': {
      'fr': 'Demandes d’abonnement',
      'ar': '',
    },
    'c0c80u2q': {
      'fr': 'الاسم واللقب ',
      'ar': '',
    },
    'vmhl4vij': {
      'fr': 'الايمايل ورقم الهاتف ',
      'ar': '',
    },
    'nebezr77': {
      'fr': 'دليل الدفع',
      'ar': '',
    },
    'rbobjy6n': {
      'fr': 'تاريخ  الطلب',
      'ar': '',
    },
    'xq3jacye': {
      'fr': 'قرار الطلب',
      'ar': '',
    },
    'eh0nbt1n': {
      'fr': 'user@domainname.com',
      'ar': '',
    },
    '1aw3ix21': {
      'fr': 'قبول ',
      'ar': '',
    },
    'wpdzimwn': {
      'fr': 'رفض',
      'ar': '',
    },
    'rq6wn5i0': {
      'fr': 'Abonnement accepte',
      'ar': '',
    },
    'tncq9rxk': {
      'fr': 'الاسم واللقب ',
      'ar': '',
    },
    '38whdg65': {
      'fr': 'الايمايل ورقم الهاتف ',
      'ar': '',
    },
    '6fdxqdl4': {
      'fr': 'دليل الدفع',
      'ar': '',
    },
    'yvfr2xbw': {
      'fr': 'تاريخ  االاشتراك',
      'ar': '',
    },
    'klux2hh5': {
      'fr': 'قرار الطلب',
      'ar': '',
    },
    '6uh7c3df': {
      'fr': 'user@domainname.com',
      'ar': '',
    },
    'f38bb8h5': {
      'fr': 'الغاء الاشتراك',
      'ar': '',
    },
    'h7993lpz': {
      'fr': '•',
      'ar': '',
    },
  },
  // oute
  {
    'dqp10v97': {
      'fr': 'تسجيل الخروج',
      'ar': '',
    },
    '9mqulc1u': {
      'fr': ' عزيزي المستخدم هل أنت متاكد من تسجيل الخروج ؟',
      'ar': '',
    },
    'mp5k9qpj': {
      'fr': 'نعم',
      'ar': '',
    },
    '995w3467': {
      'fr': 'بقاء',
      'ar': '',
    },
  },
  // outeCopy
  {
    'cpmg62gl': {
      'fr': '\n...عذرا سيتم اضافة هذه الميزة قريبا',
      'ar': '',
    },
    'b47a5vti': {
      'fr': 'رجوع',
      'ar': '',
    },
  },
  // email_verification
  {
    'rhovbb4v': {
      'fr': 'التحقق من البريد الإلكتروني',
      'ar': '',
    },
    'u3136gsl': {
      'fr': 'لقد تم تسجيلك بنجاح   ',
      'ar': '',
    },
    'b8kz8jum': {
      'fr': 'عزيزي  ',
      'ar': '',
    },
    'bcxgwmp1': {
      'fr':
          'لقد قمنا للتو بارسال رابط تأكيد تسجيلك في التطبيق يرجى مراجعة بريدك الالكتروني لتأكيد تسجيلك ',
      'ar': '',
    },
    '94zm86o7': {
      'fr': 'حسنا ',
      'ar': '',
    },
    '71q4h4hu': {
      'fr': 'ارسال الرابط من جديد',
      'ar': '',
    },
  },
  // rest_pass_info
  {
    '78p80658': {
      'fr': 'تفقد بريدك الالكتروني ',
      'ar': '',
    },
    'znfuxj91': {
      'fr':
          'لقد تم ارسال الرابط بنجاح يرجى تفقد البريد الالكتروني الخاص بك  وقم بعملية تسجيل الدخول ',
      'ar': '',
    },
    'cd1yz3eb': {
      'fr': 'حسنا ',
      'ar': '',
    },
  },
  // new_post
  {
    'oqfxe6o1': {
      'fr': 'العنوان الرئيسي',
      'ar': '',
    },
    't4bb8wug': {
      'fr': 'TextField',
      'ar': '',
    },
    'hgdtd6or': {
      'fr': 'عنوان المناقصة ',
      'ar': '',
    },
    't4xvzajl': {
      'fr': 'TextField',
      'ar': '',
    },
    'yibq97q5': {
      'fr': 'الوصف',
      'ar': '',
    },
    '0q3wbtb0': {
      'fr': 'TextField',
      'ar': '',
    },
    'plntylfe': {
      'fr': 'المعلن',
      'ar': '',
    },
    'np5ilgws': {
      'fr': 'TextField',
      'ar': '',
    },
    'sce2pnly': {
      'fr': 'العنوان',
      'ar': '',
    },
    '7o2yqx0q': {
      'fr': 'TextField',
      'ar': '',
    },
    'l0otcadg': {
      'fr': 'TextField',
      'ar': '',
    },
    'onhehnpf': {
      'fr': 'الهاتف',
      'ar': '',
    },
    '8u6hammv': {
      'fr': 'TextField',
      'ar': '',
    },
    'mhfiqxcq': {
      'fr': 'الولاية',
      'ar': '',
    },
    'r87m4we2': {
      'fr': 'Option 1',
      'ar': '',
    },
    'guspgbuw': {
      'fr': 'Option 2',
      'ar': '',
    },
    'jvjq756x': {
      'fr': 'Option 3',
      'ar': '',
    },
    'dse03rpb': {
      'fr': 'ولاية ...',
      'ar': '',
    },
    'zxswoluu': {
      'fr': 'Search...',
      'ar': '',
    },
    'uivtl8ge': {
      'fr': 'القطاعات',
      'ar': '',
    },
    'joydhkwg': {
      'fr': 'Option 1',
      'ar': '',
    },
    'e2pvksnh': {
      'fr': 'Option 2',
      'ar': '',
    },
    '65s448ie': {
      'fr': 'Option 3',
      'ar': '',
    },
    'xg7o8qlg': {
      'fr': 'القطاع ...',
      'ar': '',
    },
    's9038s47': {
      'fr': 'Search...',
      'ar': '',
    },
    'ovq00n9u': {
      'fr': 'تاريخ الاعلان',
      'ar': '',
    },
    'fszcpqs5': {
      'fr': 'TextField',
      'ar': '',
    },
    'ieb9xu9w': {
      'fr': 'pdf',
      'ar': '',
    },
    '0d8wkjwh': {
      'fr': 'الملفات ',
      'ar': '',
    },
    'vl3j335g': {
      'fr': 'الغاء',
      'ar': '',
    },
    '58rspqqz': {
      'fr': 'حفظ',
      'ar': '',
    },
  },
  // new_fournisseur
  {
    '6tn2fmo2': {
      'fr': 'اسم المورد',
      'ar': '',
    },
    'jo22ara2': {
      'fr': 'TextField',
      'ar': '',
    },
    'njlrxbxa': {
      'fr': 'تفاصيل المنتج',
      'ar': '',
    },
    's2re27cu': {
      'fr': 'TextField',
      'ar': '',
    },
    'pog7das6': {
      'fr': 'العنوان',
      'ar': '',
    },
    '0fs2lm3x': {
      'fr': 'TextField',
      'ar': '',
    },
    '4frgpmtf': {
      'fr': 'تاريخ الاعلان',
      'ar': '',
    },
    '5ygrd91p': {
      'fr': 'TextField',
      'ar': '',
    },
    'd05gdc9r': {
      'fr': 'img',
      'ar': '',
    },
    '7548ugz8': {
      'fr': 'صورة المورد ',
      'ar': '',
    },
    'ti9mldi6': {
      'fr': 'img',
      'ar': '',
    },
    'lyffzinh': {
      'fr': 'صور المنتج ',
      'ar': '',
    },
    'j78oxwvj': {
      'fr': 'الغاء',
      'ar': '',
    },
    '7m3azgrm': {
      'fr': 'حفظ',
      'ar': '',
    },
  },
  // TRIAL
  {
    'sxcppsa3': {
      'fr': '✨ الفترة التجريبية انتهت! ✨',
      'ar': '',
    },
    'kfrnopkv': {
      'fr':
          'شكرًا لاستخدامك تطبيقنا \nلقد استمتعت بفترة تجريبية مجانية مدتها 3 أيام. للاستمرار في الاستفادة من خدماتنا والوصول إلى جميع الميزات الحصرية، يرجى الاشتراك الآن. استثمر في مستقبل أعمالك بخطوة صغيرة اليوم!\"',
      'ar': '',
    },
    'sf88qgij': {
      'fr': 'الرئيسية',
      'ar': '',
    },
    'pjtajvy3': {
      'fr': 'الاشتراك',
      'ar': '',
    },
  },
  // userprofile
  {
    'tfuyqs9w': {
      'fr': 'حسابك',
      'ar': '',
    },
    'hzchp2s2': {
      'fr': 'الاسم الكامل ',
      'ar': '',
    },
    'dsa7i3d2': {
      'fr': 'البريد الالكتروني',
      'ar': '',
    },
    '601luip5': {
      'fr': 'رقم الهاتف',
      'ar': '',
    },
    'n0atcf0l': {
      'fr': 'نوع الاشتراك ',
      'ar': '',
    },
    '8svxocqe': {
      'fr': 'وصول مميز ',
      'ar': '',
    },
    '2v13ya11': {
      'fr': 'فترة تجريبية ',
      'ar': '',
    },
    'q2eh414e': {
      'fr': 'غير مشترك',
      'ar': '',
    },
    '71fr99fs': {
      'fr': 'الاشتراك السنوي مفعل ',
      'ar': '',
    },
    '0uxoz3cs': {
      'fr': 'حفظ التغييرات',
      'ar': '',
    },
  },
  // abonementalert
  {
    'xy8yadle': {
      'fr': ' طلب الاشتراك الخاص بك قيد الدراسة ',
      'ar': '',
    },
    'ozpet2y0': {
      'fr':
          'شكرا على ثقتك في تطبيقنا \nطلب الاشتراك قيد المعالجة سنعلمك بأي تحديث حول  طلبك ',
      'ar': '',
    },
    'l5txetxr': {
      'fr': 'حسنا',
      'ar': '',
    },
  },
  // Miscellaneous
  {
    '09njmi3c': {
      'fr': '',
      'ar': '',
    },
    'cklmfqtp': {
      'fr': '',
      'ar': '',
    },
    '3e3cw3pd': {
      'fr': '',
      'ar': '',
    },
    'bvo6g1gj': {
      'fr': '',
      'ar': '',
    },
    '2skq5zwm': {
      'fr': '',
      'ar': '',
    },
    'blqif280': {
      'fr': '',
      'ar': '',
    },
    'inzvgtsu': {
      'fr': '',
      'ar': '',
    },
    '11e0ju0b': {
      'fr': '',
      'ar': '',
    },
    '9jby9nk0': {
      'fr': '',
      'ar': '',
    },
    'z5cza31l': {
      'fr': '',
      'ar': '',
    },
    'vsqci3ln': {
      'fr': '',
      'ar': '',
    },
    '52qcz8h5': {
      'fr': '',
      'ar': '',
    },
    'p7bt27i1': {
      'fr': '',
      'ar': '',
    },
    't56vxrc5': {
      'fr': '',
      'ar': '',
    },
    'jx47u4cf': {
      'fr': '',
      'ar': '',
    },
    'cpq9nu16': {
      'fr': '',
      'ar': '',
    },
    'q4hwl2x6': {
      'fr': '',
      'ar': '',
    },
    'lxqr1vhr': {
      'fr': '',
      'ar': '',
    },
    'ecsxbd0x': {
      'fr': '',
      'ar': '',
    },
    'it6x2wn4': {
      'fr': '',
      'ar': '',
    },
    'ml4yqov7': {
      'fr': '',
      'ar': '',
    },
    '0idgioc8': {
      'fr': '',
      'ar': '',
    },
    'v49raljw': {
      'fr': '',
      'ar': '',
    },
    'e980k8kg': {
      'fr': '',
      'ar': '',
    },
    '769q7we4': {
      'fr': '',
      'ar': '',
    },
    'u5r2cg3o': {
      'fr': '',
      'ar': '',
    },
    '7igwkxo1': {
      'fr': '',
      'ar': '',
    },
  },
].reduce((a, b) => a..addAll(b));
