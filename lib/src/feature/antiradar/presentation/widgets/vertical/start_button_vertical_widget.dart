import 'package:antiradar/src/feature/splash_screen/wrappers/theme_wrapper.dart';
import 'package:antiradar/src/uikit/text_style/app_text_styles.dart';
import 'package:flutter/material.dart';

/// {@template start_button_vertical_widget}
/// StartButtonVerticalWidget widget.
/// {@endtemplate}
class StartButtonVerticalWidget extends StatelessWidget {
  /// {@macro start_button_vertical_widget}
  const StartButtonVerticalWidget({super.key, this.voidCallback});

  final VoidCallback? voidCallback;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final screenWidth = MediaQuery.sizeOf(context).width;
    final theme = Theme.of(context);
    return Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: EdgeInsets.only(
              left: screenWidth * 0.2,
              right: screenWidth * 0.2,
              bottom: screenHeight * 0.044),
          child: AspectRatio(
              aspectRatio: 4,
              child: ElevatedButton(
                  onPressed: () {
                    ThemeWrapper.of(context).changeTheme();
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: theme.primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: const FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      'STOP',
                      style: AppTextStyles.kButtonStyle,
                    ),
                  ))),
        ));
  }
}
