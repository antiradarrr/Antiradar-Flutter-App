final class _LocalizationConstans {
  const _LocalizationConstans({required this.langCode, required this.name});

  final String langCode;
  final String name;
}

const localizationList = <_LocalizationConstans>[
  _LocalizationConstans(langCode: 'en', name: 'English (US)'),
  _LocalizationConstans(langCode: 'es', name: 'Español (A. Latina)'),
  _LocalizationConstans(langCode: 'pt', name: 'Português (BR)'),
  _LocalizationConstans(langCode: 'ru', name: 'Русский'),
];
