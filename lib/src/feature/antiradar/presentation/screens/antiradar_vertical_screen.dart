import 'package:antiradar/src/core/dependencies/dependencies.dart';
import 'package:antiradar/src/feature/antiradar/presentation/bloc/antiradar_bloc.dart';
import 'package:antiradar/src/feature/antiradar/presentation/painter/antiradar_vertical_max_painter.dart';
import 'package:antiradar/src/feature/antiradar/presentation/widgets/vertical/start_button_vertical_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

/// {@template antiradar_vertical_screen}
/// AntiradarVerticalScreen widget.
/// {@endtemplate}
class AntiradarVerticalScreen extends StatefulWidget {
  /// {@macro antiradar_vertical_screen}
  const AntiradarVerticalScreen({super.key});

  @override
  State<AntiradarVerticalScreen> createState() =>
      _AntiradarVerticalScreenState();
}

class _AntiradarVerticalScreenState extends State<AntiradarVerticalScreen> {
  late final AntiradarBloc antiradarBloc;

  @override
  void initState() {
    super.initState();
    antiradarBloc = Dependencies.of(context).antiradarBloc;
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
        value: const SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark,
            systemNavigationBarColor: Colors.white),
        child: BlocConsumer<AntiradarBloc, AntiradarState>(
          bloc: antiradarBloc,
          listener: (context, state) {},
          builder: (context, state) {
            return Scaffold(
              backgroundColor: Colors.white,
              body: Stack(
                children: [
                  CustomPaint(
                    painter: AntiradarVerticalMaxPainter(),
                    size: const Size(double.infinity, double.infinity),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.sizeOf(context).height * 0.72),
                      child: SvgPicture.asset(
                        'assets/icons/point.svg',
                        height: 40,
                        width: 40,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.sizeOf(context).height * 0.70,
                          left: 16),
                      child: InkWell(
                        child: SvgPicture.asset('assets/icons/camera.svg'),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.sizeOf(context).height * 0.70,
                          right: 16),
                      child: Container(
                        height: MediaQuery.sizeOf(context).height * 0.14,
                        width: MediaQuery.sizeOf(context).width * 0.17,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF000000).withOpacity(0.15),
                              offset: const Offset(0, 4),
                              blurRadius: 10,
                              spreadRadius: 0,
                            )
                          ],
                        ),
                        child: ColoredBox(
                          color: Colors.white,
                          child: Column(
                            children: [
                              Expanded(
                                  child: Center(
                                child: InkWell(
                                  onTap: () {},
                                  child:
                                      SvgPicture.asset('assets/icons/add.svg'),
                                ),
                              )),
                              Expanded(
                                  child: Center(
                                child: InkWell(
                                  child: SvgPicture.asset(
                                      'assets/icons/volume_up.svg'),
                                ),
                              ))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SafeArea(
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 16, top: 10),
                        child: DecoratedBox(
                          decoration:
                              BoxDecoration(shape: BoxShape.circle, boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF000000).withOpacity(0.15),
                              offset: const Offset(0, 4),
                              blurRadius: 10,
                              spreadRadius: 0,
                            )
                          ]),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: SizedBox(
                              height: 80,
                              width: 80,
                              child: ColoredBox(
                                color: Colors.white,
                                child: Center(
                                  child: Text(
                                    state.speed.toString(),
                                    style: const TextStyle(
                                        fontSize: 28,
                                        fontFamily: 'SFPro',
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const StartButtonVerticalWidget(),
                ],
              ),
            );
          },
        ));
  }
}
