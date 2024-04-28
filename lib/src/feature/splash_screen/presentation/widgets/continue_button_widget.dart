import 'package:antiradar/src/uikit/text_style/app_text_styles.dart';
import 'package:flutter/material.dart';

/// {@template continue_button_widget}
/// ContinueButtonWidget widget.
/// {@endtemplate}
class ContinueButtonWidget extends StatelessWidget {
  /// {@macro continue_button_widget}
  const ContinueButtonWidget({
    super.key,
    required this.title,
    required this.onPressed,
  });

  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: EdgeInsets.only(
              left: MediaQuery.sizeOf(context).width * 0.2,
              right: MediaQuery.sizeOf(context).width * 0.2,
              bottom: MediaQuery.sizeOf(context).height * 0.04),
          child: AspectRatio(
            aspectRatio: 4.5,
            child: InkWell(
              onTap: onPressed,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      title,
                      style: AppTextStyles.addButtonStyle,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
