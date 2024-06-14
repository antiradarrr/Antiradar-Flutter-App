import 'package:antiradar/src/feature/settings/presentation/widgets/drawer_item.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const _settingAsset = [
  'assets/icons/language.svg',
  'assets/icons/load_points.svg',
  'assets/icons/settings.svg',
  'assets/icons/theme.svg',
];

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final screenWidth = MediaQuery.sizeOf(context).width;

    final theme = Theme.of(context);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(),
      child: Scaffold(
        appBar: AppBar(),
        drawer: Drawer(
          backgroundColor: theme.scaffoldBackgroundColor,
          child: ListView(
            children: [
              ..._settingAsset.map((e) => DrawerItem(title: e, iconAsset: e)),
            ],
          ),
        ),
        body: Center(
          child: ElevatedButton(
              onPressed: () async {}, child: const Text('Pick File')),
        ),
      ),
    );
  }
}
