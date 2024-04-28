import 'package:antiradar/src/core/constans/localization_constans.dart';
import 'package:antiradar/src/feature/splash_screen/presentation/widgets/continue_button_widget.dart';
import 'package:antiradar/src/feature/splash_screen/wrappers/localization_wrapper.dart';
import 'package:antiradar/src/uikit/gradients/app_gradients.dart';
import 'package:antiradar/src/uikit/text_style/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

/// {@template select_language_screen}
/// SelectLaguageScreen widget.
/// {@endtemplate}
class SelectLaguageScreen extends StatefulWidget {
  /// {@macro select_language_screen}
  const SelectLaguageScreen({super.key});

  @override
  State<SelectLaguageScreen> createState() => _SelectLaguageScreenState();
}

class _SelectLaguageScreenState extends State<SelectLaguageScreen> {
  @override
  Widget build(BuildContext context) {
    final currentLangCode = LocalizationWrapper.of(context).currentLangCode;

    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Color(0xff204A90),
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff377EF6),
          centerTitle: true,
          title: Text(
            AppLocalizations.of(context)!.selectLanguage,
            style: AppTextStyles.header,
          ),
        ),
        body: SizedBox(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          child: DecoratedBox(
            decoration: const BoxDecoration(gradient: AppGradient.blue),
            child: Stack(
              children: <Widget>[
                ListView.separated(
                  padding: const EdgeInsets.only(top: 40, left: 16, right: 16),
                  itemCount: localizationList.length,
                  itemBuilder: (context, index) {
                    final locale = localizationList[index];
                    return InkWell(
                        onTap: () {
                          LocalizationWrapper.of(context)
                              .setLocale(locale.langCode);
                        },
                        child: SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.05,
                          child: Row(
                            children: [
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  locale.name,
                                  style: AppTextStyles.body,
                                ),
                              ),
                              const Spacer(),
                              ActiveWidget(
                                langCode: locale.langCode,
                                currentLocale: currentLangCode,
                              )
                            ],
                          ),
                        ));
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(height: 24);
                  },
                ),



                ContinueButtonWidget(
                    title: AppLocalizations.of(context)!.add,
                    onPressed: () {
                      context.go('/select-theme');
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// {@template select_language_screen}
/// ActiveWidget widget.
/// {@endtemplate}
class ActiveWidget extends StatelessWidget {
  /// {@macro select_language_screen}
  const ActiveWidget(
      {super.key, required this.langCode, required this.currentLocale});

  final String langCode;
  final String currentLocale;
  @override
  Widget build(BuildContext context) {
    if (langCode == currentLocale) {
      return SvgPicture.asset('assets/icons/check.svg');
    }

    return const SizedBox();
  }
}
