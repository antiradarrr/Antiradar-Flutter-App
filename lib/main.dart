import 'dart:async';

import 'package:antiradar/src/core/utils/logger/logger.dart';
import 'package:antiradar/src/feature/initialization/runner/runner.dart';

void main() => runZonedGuarded(() {
      Runner.launch();
    }, (error, stack) {
      logger.e('GLOBAL EXCEPTION', error: error, stackTrace: stack);
    });




  // SafeArea(
  //                     child: Align(
  //                   alignment: Alignment.topLeft,
  //                   child: Padding(
  //                     padding: const EdgeInsets.only(top: 10, left: 16),
  //                     child: DecoratedBox(
  //                       decoration: BoxDecoration(
  //                           borderRadius: BorderRadius.circular(6),
  //                           boxShadow: [
  //                             BoxShadow(
  //                               color:
  //                                   const Color(0xFF000000).withOpacity(0.15),
  //                               offset: const Offset(0, 4),
  //                               blurRadius: 10,
  //                               spreadRadius: 0,
  //                             ),
  //                           ],
  //                           border: Border.all(
  //                               width: 1,
  //                               color: const Color.fromRGBO(222, 222, 222, 1))),
  //                       child: ClipRRect(
  //                         borderRadius: BorderRadius.circular(6),
  //                         child: SizedBox(
  //                           height: 100,
  //                           width: 242,
  //                           child: ColoredBox(
  //                             color: const Color.fromRGBO(245, 245, 245, 1),
  //                             child: Padding(
  //                               padding:
  //                                   const EdgeInsets.only(left: 14, right: 14),
  //                               child: Row(
  //                                 children: [
  //                                   SvgPicture.asset(
  //                                       'assets/icons/arrow_bottom.svg'),
  //                                   const Padding(
  //                                     padding: EdgeInsets.only(
  //                                         top: 10, bottom: 17, left: 5),
  //                                     child: Column(
  //                                       crossAxisAlignment:
  //                                           CrossAxisAlignment.start,
  //                                       children: <Widget>[
  //                                         Text(
  //                                           '200 m',
  //                                           style: TextStyle(
  //                                               fontFamily: 'SFPro',
  //                                               fontStyle: FontStyle.normal,
  //                                               fontSize: 18,
  //                                               fontWeight: FontWeight.w600,
  //                                               letterSpacing: -0.38,
  //                                               color: Colors.black),
  //                                         ),
  //                                         Flexible(
  //                                           child: Text(
  //                                             'Static',
  //                                             softWrap: true,
  //                                             style: TextStyle(
  //                                                 fontSize: 20,
  //                                                 fontFamily: 'SFPro',
  //                                                 fontStyle: FontStyle.normal,
  //                                                 fontWeight: FontWeight.w500,
  //                                                 color: Colors.black),
  //                                           ),
  //                                         ),
  //                                         Flexible(
  //                                             child: Text(
  //                                           'chamber',
  //                                           style: TextStyle(
  //                                               fontSize: 20,
  //                                               fontFamily: 'SFPro',
  //                                               fontStyle: FontStyle.normal,
  //                                               fontWeight: FontWeight.w500,
  //                                               color: Colors.black),
  //                                         ))
  //                                       ],
  //                                     ),
  //                                   ),
  //                                   const Spacer(),
  //                                   SvgPicture.asset(
  //                                       'assets/icons/camera_stop.svg')
  //                                 ],
  //                               ),
  //                             ),
  //                           ),
  //                         ),
  //                       ),
  //                     ),
  //                   ),
  //                 )),