enum MovieLanguage {
  en,
  fr,
  de,
  hi,
  it,
  ja,
  ko,
  ml,
  mr,
  pa,
  es,
  ta,
}

extension MovieLanguageExtension on MovieLanguage {
  String get name {
    switch (this) {
      case MovieLanguage.de:
        return 'German';
      case MovieLanguage.en:
        return 'English';
      case MovieLanguage.es:
        return 'Spanish';
      case MovieLanguage.fr:
        return 'French';
      case MovieLanguage.hi:
        return 'Hindi';
      case MovieLanguage.it:
        return 'Italian';
      case MovieLanguage.ja:
        return 'Japanese';
      case MovieLanguage.ko:
        return 'Korean';
      case MovieLanguage.ml:
        return 'Malayalam';
      case MovieLanguage.mr:
        return 'Marathi';
      case MovieLanguage.pa:
        return 'Punjabi';
      case MovieLanguage.ta:
        return 'Tamil';
      default:
        return '';
    }
  }
}
