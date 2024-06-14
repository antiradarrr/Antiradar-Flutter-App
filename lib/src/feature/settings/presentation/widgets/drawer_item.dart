import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../uikit/text_style/additional_text_styles.dart';
import '../../../splash_screen/wrappers/theme_wrapper.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    super.key,
    required this.title,
    required this.iconAsset,
    this.themeChanger = false,
  });

  final String title;
  final String iconAsset;

  final bool themeChanger;

  @override
  Widget build(BuildContext context) {
    final themeMode = ThemeScope.of(context).themeMode;
    final additionalStyle = StyleProvider.of(themeMode);
    return ListTile(
      leading: SvgPicture.asset(iconAsset),
      title: Text(
        title,
        style: additionalStyle.listTileStyle,
      ),
    );
  }
}
