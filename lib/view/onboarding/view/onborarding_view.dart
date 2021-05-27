import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttermvvmtemplate/core/base/view/base_widget.dart';
import 'package:fluttermvvmtemplate/core/components/text/auto_locale_text.dart';
import 'package:fluttermvvmtemplate/core/extension/context_extension.dart';
import 'package:fluttermvvmtemplate/core/init/lang/locale_keys.g.dart';
import 'package:fluttermvvmtemplate/view/_product/_constant/image_path_svg.dart';
import 'package:fluttermvvmtemplate/view/home/view/home_view.dart';
import 'package:fluttermvvmtemplate/view/onboarding/model/onboard_model.dart';
import 'package:fluttermvvmtemplate/view/onboarding/viewmodel/onboarding_viewmodel.dart';
import '../../../core/extension/string_extension.dart';

class OnBoardingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<OnBoardingViewModel>(
      viewModel: OnBoardingViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, OnBoardingViewModel viewModel) =>
          Scaffold(
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: context.colors.primary,
            image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.05), BlendMode.dstATop),
              fit: BoxFit.cover,
              image: AssetImage('asset/image/izohips.png'),
            ),
          ),
          child: Column(
            children: [
              Expanded(flex: 8, child: topPageViewArea(viewModel)),
              Expanded(flex: 5, child: bottomPageViewArea(viewModel, context))
            ],
          ),
        ),
      ),
    );
  }

  Container bottomPageViewArea(
      OnBoardingViewModel viewModel, BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Container(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Spacer(flex: 1),
            Observer(builder: (_) {
              return Expanded(
                flex: 2,
                child: buildBottomColumnBody(
                    viewModel.onboardItems[viewModel.currentIndex], context),
              );
            }),
            Expanded(
              flex: 3,
              child: Padding(
                padding: context.paddingNormalHorizontal,
                child: Row(
                  children: [
                    Flexible(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: viewModel.onboardItems.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Observer(builder: (_) {
                            return Padding(
                              padding: EdgeInsets.symmetric(horizontal: 6),
                              child: viewModel.currentIndex == index
                                  ? Container(
                                      height: 20,
                                      width: 20,
                                      color: Colors.blueGrey,
                                    )
                                  : CircleAvatar(
                                      backgroundColor:
                                          context.colors.onSecondary,
                                      radius: 5,
                                    ),
                            );
                          });
                        },
                      ),
                    ),
                    Spacer(),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            horizontal: context.mediaQuery.size.width * 0.076,
                            vertical: context.mediaQuery.size.height * 0.022),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                      ),
                      onPressed: () {
                        viewModel.currentIndex == 3
                            ? Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeView()))
                            : viewModel.incrementCurrentValue();
                      },
                      child: Observer(builder: (_) {
                        return Text(
                          viewModel.currentIndex == 3 ? "Geç" : "İleri",
                          style: context.textTheme.subtitle2!
                              .copyWith(color: context.colors.background),
                        );
                      }),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Column buildBottomColumnBody(OnBoardModel model, BuildContext context) {
    return Column(
      children: [
        Expanded(
            flex: 1,
            child: AutoLocaleText(
              value: model.bottomTitle,
              style: context.textTheme.headline5!
                  .copyWith(color: context.colors.primary),
            )),
        Expanded(
          flex: 1,
          child: Padding(
            padding: context.paddingNormalHorizontal,
            child: Text(
              model.description.locale,
              style: context.textTheme.subtitle2,
            ),
          ),
        )
      ],
    );
  }

  Container topPageViewArea(OnBoardingViewModel viewModel) {
    return Container(
      child: Column(
        children: [
          Expanded(flex: 1, child: SizedBox()),
          Expanded(
              flex: 6,
              child: Observer(builder: (_) {
                return viewModel.changePage();
              }))
        ],
      ),
    );
  }

  Column buildTopColumnBody(OnBoardModel model, BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: AutoLocaleText(
            value: model.topTitle,
            style: context.textTheme.headline5!.copyWith(fontSize: 24),
          ),
        ),
        Expanded(flex: 6, child: SvgPicture.asset(model.imagePath)),
      ],
    );
  }
}

class TodoOnBoardSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: AutoLocaleText(
            value: LocaleKeys.onBoard_page1_headtitle,
            style: context.textTheme.headline5!.copyWith(fontSize: 24),
          ),
        ),
        Expanded(
            flex: 6,
            child: SvgPicture.asset(SVGImagePaths.instance.startupSVG)),
      ],
    );
  }
}

class SportOnBoardSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: AutoLocaleText(
            value: LocaleKeys.onBoard_page2_headtitle,
            style: context.textTheme.headline5!.copyWith(fontSize: 24),
          ),
        ),
        Expanded(
            flex: 6, child: SvgPicture.asset(SVGImagePaths.instance.sportSVG)),
      ],
    );
  }
}

class BookOnBoardSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: AutoLocaleText(
            value: LocaleKeys.onBoard_page3_headtitle,
            style: context.textTheme.headline5!.copyWith(fontSize: 24),
          ),
        ),
        Expanded(
            flex: 6,
            child: SvgPicture.asset(SVGImagePaths.instance.readingSVG)),
      ],
    );
  }
}

class WaterOnBoardSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: AutoLocaleText(
            value: LocaleKeys.onBoard_page4_headtitle,
            style: context.textTheme.headline5!.copyWith(fontSize: 24),
          ),
        ),
        Expanded(
            flex: 6, child: SvgPicture.asset(SVGImagePaths.instance.drinkSVG)),
      ],
    );
  }
}
