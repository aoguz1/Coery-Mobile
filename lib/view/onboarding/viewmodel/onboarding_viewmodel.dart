import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/core/base/model/base_view_model.dart';
import 'package:fluttermvvmtemplate/core/components/text/locale_text.dart';
import 'package:fluttermvvmtemplate/core/extension/string_extension.dart';
import 'package:fluttermvvmtemplate/core/init/lang/locale_keys.g.dart';
import 'package:fluttermvvmtemplate/view/_product/_constant/image_path_svg.dart';
import 'package:fluttermvvmtemplate/view/onboarding/model/onboard_model.dart';
import 'package:fluttermvvmtemplate/view/onboarding/view/onborarding_view.dart';

import 'package:mobx/mobx.dart';
part 'onboarding_viewmodel.g.dart';

class OnBoardingViewModel = _OnBoardingViewModelBase with _$OnBoardingViewModel;

abstract class _OnBoardingViewModelBase with Store, BaseViewModel {
  void setContext(BuildContext context) => this.context = context;

  @observable
  int currentIndex = 0;

  @action
  incrementCurrentValue() {
    currentIndex++;
    if (currentIndex == 4) {
      currentIndex = 0;
    }
  }

  @action
  changeCurrentIndex(int value) {
    currentIndex = value;
    print(currentIndex);
  }

  changePage() {
    switch (currentIndex) {
      case 0:
        print('TODO ${currentIndex}');
        return TodoOnBoardSlider();
        break;
      case 1:
        print('${currentIndex} Sport');
        return SportOnBoardSlider();
        break;
      case 2:
        print('${currentIndex} Book');
        return BookOnBoardSlider();
        break;
      case 3:
        print('${currentIndex} Water');
        return WaterOnBoardSlider();
        break;
      default:
    }
  }

  List<OnBoardModel> onboardItems = [];
  void init() {
    onboardItems.add(OnBoardModel(
        LocaleKeys.onBoard_page1_headtitle,
        LocaleKeys.onBoard_page1_title,
        LocaleKeys.onBoard_page1_desc,
        SVGImagePaths.instance.startupSVG));

    onboardItems.add(OnBoardModel(
        LocaleKeys.onBoard_page2_headtitle,
        LocaleKeys.onBoard_page2_title,
        LocaleKeys.onBoard_page2_desc,
        SVGImagePaths.instance.sportSVG));

    onboardItems.add(OnBoardModel(
        LocaleKeys.onBoard_page1_headtitle,
        LocaleKeys.onBoard_page3_title,
        LocaleKeys.onBoard_page3_desc,
        SVGImagePaths.instance.readingSVG));

    onboardItems.add(OnBoardModel(
        LocaleKeys.onBoard_page4_headtitle,
        LocaleKeys.onBoard_page4_title,
        LocaleKeys.onBoard_page4_desc,
        SVGImagePaths.instance.drinkSVG));
  }
}
