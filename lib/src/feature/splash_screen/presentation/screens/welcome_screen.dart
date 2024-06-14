import 'package:antiradar/src/feature/splash_screen/presentation/widgets/continue_button_widget.dart';
import 'package:antiradar/src/uikit/gradients/app_gradients.dart';
import 'package:antiradar/src/uikit/text_style/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:antiradar/l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

/// {@template welcome_screen}
/// WelcomeScreen widget.
/// {@endtemplate}
class WelcomeScreen extends StatefulWidget {
  /// {@macro welcome_screen}
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final screenWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        leading: SizedBox(
          child: FractionallySizedBox(
            widthFactor: 0.7,
            heightFactor: 0.7,
            child: Center(
              child: SvgPicture.asset(
                'assets/icons/menu.svg',
                height: 100,
                width: 100,
              ),
            ),
          ),
        ),
        leadingWidth: MediaQuery.sizeOf(context).height * 0.1,
      ),
      body: SizedBox(
          height: screenHeight,
          width: screenWidth,
          child: DecoratedBox(
            decoration: BoxDecoration(
                gradient: AppGradient.themeBackgroundGradient(context)),
            child: Column(
              children: <Widget>[
                AspectRatio(
                    aspectRatio: 1,
                    child: SvgPicture.asset('assets/icons/driwe_car.svg')),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 42, right: 42),
                    child: Text(
                      AppLocalizations.of(context)!.welcomeToAntiradar,
                      style: AppTextStyles.headerStyle.copyWith(fontSize: 32),
                    ),
                  ),
                ),
                const Spacer(),
                ContinueButtonWidget(
                    title: AppLocalizations.of(context)!.start,
                    onPressed: () {
                      context.push('/antiradar');
                    })
              ],
            ),
          )),
    );
  }
}
