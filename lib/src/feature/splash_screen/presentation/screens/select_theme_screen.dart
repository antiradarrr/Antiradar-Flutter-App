import 'package:antiradar/src/feature/splash_screen/presentation/widgets/continue_button_widget.dart';
import 'package:antiradar/src/feature/splash_screen/wrappers/theme_wrapper.dart';
import 'package:antiradar/src/uikit/auxiliary/color_provider.dart';
import 'package:antiradar/src/uikit/colors/color_palette.dart';
import 'package:antiradar/src/uikit/gradients/app_gradients.dart';
import 'package:antiradar/src/uikit/text_style/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:antiradar/l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

/// {@template select_theme_screen}
/// SelectThemeScreen widget.
/// {@endtemplate}
class SelectThemeScreen extends StatefulWidget {
  /// {@macro select_theme_screen}
  const SelectThemeScreen({super.key});

  @override
  State<SelectThemeScreen> createState() => _SelectThemeScreenState();
}

class _SelectThemeScreenState extends State<SelectThemeScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final screenWidth = MediaQuery.sizeOf(context).width;
    final currentTheme = ThemeScope.of(context).themeMode;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
          systemNavigationBarColor:
              ColorProvider.systemNavigationColor(context)),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorProvider.appBarColor(context),
          automaticallyImplyLeading: false,
        ),
        body: DecoratedBox(
          decoration: BoxDecoration(
            gradient: AppGradient.themeBackgroundGradient(context),
          ),
          child: Center(
            child: Column(
              children: <Widget>[
                const SizedBox(height: 20),
                SvgPicture.asset(
                  'assets/icons/theme_car.svg',
                  height: screenHeight * 0.4,
                  width: screenWidth * 0.9,
                ),
                SizedBox(height: screenHeight * 0.005),
                Text(AppLocalizations.of(context)!.chooseAStyle,
                    style: AppTextStyles.headerStyle),
                SizedBox(height: screenHeight * 0.05),
                InkWell(
                  onTap: () {
                    ThemeWrapper.of(context).changeTheme();
                  },
                  child: AspectRatio(
                    aspectRatio: 6,
                    child: Container(
                        margin: EdgeInsets.only(
                          left: screenWidth * 0.05,
                          right: screenWidth * 0.05,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: ColorPalette.checkBoxColor,
                        ),
                        child: Stack(
                          children: [
                            AnimatedAlign(
                              alignment: (currentTheme == ThemeMode.dark)
                                  ? Alignment.centerRight
                                  : Alignment.centerLeft,
                              duration: const Duration(milliseconds: 700),
                              child: FractionallySizedBox(
                                widthFactor: 0.5,
                                heightFactor: 1,
                                child: Container(
                                  decoration: BoxDecoration(
                                      boxShadow: const [
                                        BoxShadow(
                                          color:
                                              Color.fromRGBO(53, 53, 53, 0.18),
                                          blurRadius: 13,
                                          spreadRadius: 0,
                                          offset: Offset(0, 0),
                                        ),
                                      ],
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(40)),
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Expanded(
                                    child: Center(
                                        child: Text(
                                  AppLocalizations.of(context)!.light,
                                  style: AppTextStyles.lightButtonProvider(
                                      context),
                                ))),
                                Expanded(
                                    child: Center(
                                        child: Text(
                                  AppLocalizations.of(context)!.dark,
                                  style:
                                      AppTextStyles.darkButtonProvider(context),
                                ))),
                              ],
                            ),
                          ],
                        )),
                  ),
                ),
                const Spacer(),
                ContinueButtonWidget(
                    title: AppLocalizations.of(context)!.contin,
                    onPressed: () {
                      context.go('/welcome');
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
