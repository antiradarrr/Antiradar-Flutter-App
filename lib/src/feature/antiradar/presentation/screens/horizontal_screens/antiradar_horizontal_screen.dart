import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../l10n/app_localizations.dart';
import '../../../../../uikit/text_style/app_text_styles.dart';
import '../../painter/antiradar_horizontal_painter.dart';
import '../../widgets/vertical/speed_vertical_widget.dart';

class AntiradarHorizontalScreen extends StatefulWidget {
  const AntiradarHorizontalScreen({super.key});

  @override
  State<AntiradarHorizontalScreen> createState() =>
      _AntiradarHorizontalScreenState();
}

class _AntiradarHorizontalScreenState extends State<AntiradarHorizontalScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    final theme = Theme.of(context);
    return Scaffold(
      body: Stack(
        children: [
          CustomPaint(
            size: Size(width, height),
            painter: AntiradarHorizontalMaxPainter(),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: height * 0.15),
              child: SvgPicture.asset('assets/icons/point.svg'),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const SpeedVerticalWidget(),
                Expanded(
                  child: Container(
                    margin:
                        const EdgeInsets.only(top: 20, bottom: 20, right: 16),
                    height: height * 0.3,
                    width: MediaQuery.sizeOf(context).width * 0.08,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF000000).withOpacity(0.15),
                            offset: const Offset(0, 4),
                            blurRadius: 16,
                            spreadRadius: 0,
                          ),
                        ]),
                    child: Column(
                      children: <Widget>[
                        Expanded(
                            child: SvgPicture.asset('assets/icons/add.svg')),
                        Expanded(
                            child:
                                SvgPicture.asset('assets/icons/volume_up.svg'))
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: height * 0.05, right: 16),
                  child: SizedBox(
                    height: height * 0.15,
                    width: width * 0.15,
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: theme.primaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5))),
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            AppLocalizations.of(context)!.stop,
                            style: AppTextStyles.kButtonStyle,
                          ),
                        )),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Column(
              children: [
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: SvgPicture.asset('assets/icons/camera.svg'),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
