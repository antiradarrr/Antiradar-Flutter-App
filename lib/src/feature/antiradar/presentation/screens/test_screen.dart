import 'package:antiradar/src/feature/antiradar/presentation/widgets/vertical/start_button_vertical_widget.dart';
import 'package:flutter/material.dart';

/// {@template test_screen}
/// TestScreen widget.
/// {@endtemplate}
class TestScreen extends StatefulWidget {
  /// {@macro test_screen}
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height * 0.6,
            decoration: BoxDecoration(color: Theme.of(context).cardColor),
            child: Column(
              children: <Widget>[
                Text(
                  'Speed control',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(fontSize: 24),
                ),
                Text(
                  'Stationary camera',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(fontSize: 24, fontWeight: FontWeight.w400),
                ),
                Spacer(),
                StartButtonVerticalWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
