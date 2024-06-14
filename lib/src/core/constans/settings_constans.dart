import 'package:flutter/cupertino.dart';

import '../../../l10n/app_localizations.dart';


List<AboutSettings> settingsList(BuildContext context) {
  final words = AppLocalizations.of(context);
  return [

// AboutSettings(title: words.se, assetsName: assetsName, routePath: routePath)
  ];
}

final class AboutSettings {
  AboutSettings({
    required this.title,
    required this.assetsName,
    required this.routePath,
  });

  final String title;
  final String assetsName;

  final String routePath;
}
