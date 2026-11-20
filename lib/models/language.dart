class Language {
  final String code;
  final String name;
  final String nativeName;

  const Language(this.code, this.name, this.nativeName);

  static const supported = <Language>[
    Language('en', 'English', 'English'),
    Language('ja', 'Japanese', '日本語'),
    Language('es', 'Spanish', 'Español'),
    Language('fr', 'French', 'Français'),
    Language('pt', 'Portuguese', 'Português'),
    Language('de', 'German', 'Deutsch'),
    Language('ko', 'Korean', '한국어'),
    Language('zh', 'Chinese', '中文'),
    Language('it', 'Italian', 'Italiano'),
    Language('ar', 'Arabic', 'العربية'),
    Language('tl', 'Filipino', 'Filipino'),
  ];
}
