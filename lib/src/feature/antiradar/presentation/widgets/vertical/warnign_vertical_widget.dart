import 'package:antiradar/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

/// {@template warnign_vertical_widget}
/// WarnignVerticalWidget widget.
/// {@endtemplate}
class WarnignVerticalWidget extends StatefulWidget {
  /// {@macro warnign_vertical_widget}
  const WarnignVerticalWidget({super.key});

  @override
  State<WarnignVerticalWidget> createState() => _WarnignVerticalWidgetState();
}

class _WarnignVerticalWidgetState extends State<WarnignVerticalWidget> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    return Align(
      alignment: Alignment.topLeft,
      child: SafeArea(
        child: AspectRatio(
          aspectRatio: 3,
          child: Container(
            padding: const EdgeInsets.all(14),
            margin:
                EdgeInsets.only(left: 14, right: screenWidth * 0.38, top: 24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Theme.of(context).cardColor,
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF000000).withOpacity(0.15),
                  offset: const Offset(0, 4),
                  blurRadius: 10,
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Flexible(
                  flex: 2,
                  child: Row(
                    children: <Widget>[
                      Flexible(
                        flex: 1,
                        child: SvgPicture.asset(
                          'assets/icons/arrow_top.svg',
                          height: double.infinity,
                        ),
                      ),
                      const SizedBox(width: 10),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              '200m',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "SFPro",
                                  height: 0),
                            ),
                            Text(AppLocalizations.of(context)!.static,
                                style: Theme.of(context).textTheme.titleSmall),
                            Text(
                              AppLocalizations.of(context)!.chamber,
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      SvgPicture.asset(
                        'assets/icons/camera_stop.svg',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
