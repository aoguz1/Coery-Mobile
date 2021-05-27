import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttermvvmtemplate/core/base/view/base_widget.dart';
import 'package:fluttermvvmtemplate/core/components/button/water_button.dart';
import 'package:fluttermvvmtemplate/core/components/page_view_card/page_view_card.dart';
import 'package:fluttermvvmtemplate/core/components/text_input/text_input.dart';
import 'package:fluttermvvmtemplate/core/components/to_do_component/to_do_square.dart';
import 'package:fluttermvvmtemplate/core/extension/context_extension.dart';
import 'package:fluttermvvmtemplate/view/detail/viewmodel/detail_view_model.dart';

class DetailView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<DetailViewModel>(
      viewModel: DetailViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, DetailViewModel viewModel) =>
          Scaffold(
        floatingActionButton: fabDoneButton(context),
        body: Column(
          children: [
            Expanded(flex: 4, child: detailTopArea(context)),
            Expanded(flex: 6, child: slideBody(viewModel))
          ],
        ),
      ),
    );
  }

  Container detailTopArea(BuildContext context) {
    return Container(
      padding: context.paddingMedium,
      width: double.infinity,
      color: context.colors.primary,
      child: Column(
        children: [
          Expanded(flex: 2, child: SizedBox()),
          Expanded(flex: 3, child: enterEventText(context)),
          Expanded(flex: 3, child: subtitleText(context))
        ],
      ),
    );
  }

  Container slideBody(DetailViewModel viewModel) {
    return Container(
      child: Column(
        children: [
          Expanded(
            flex: 6,
            child: Container(
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: SvgPicture.asset('asset/svg/polygon_down.svg'),
                  ),
                  Expanded(flex: 4, child: pageSlider(viewModel)),
                  Expanded(
                    flex: 1,
                    child: SvgPicture.asset('asset/svg/polygon_up.svg'),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: changeBody(viewModel),
          ),
          Spacer(
            flex: 4,
          )
        ],
      ),
    );
  }

  FloatingActionButton fabDoneButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      backgroundColor: context.colors.onPrimary,
      child: Icon(
        Icons.done,
        color: Colors.white,
        size: 30,
      ),
    );
  }

  Container subtitleText(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: Text(
        'Yaptığın aktiviteleri girerek kolayca takip et !',
        style: context.textTheme.subtitle1!.copyWith(color: Colors.white),
      ),
    );
  }

  Container enterEventText(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: Text(
        'Etkinlik Gir ⚡️',
        style: context.textTheme.headline5,
      ),
    );
  }

  Container pageSlider(DetailViewModel viewModel) {
    return Container(
      child: PageView(
        onPageChanged: (value) {
          viewModel.changeInitialPage(value);
        },
        controller: viewModel.controller,
        children: [
          PageViewCard('💪', 'Spor'),
          PageViewCard('💦', 'Su'),
          PageViewCard('📕', 'Kitap'),
          PageViewCard('⏰', 'Yapılacaklar'),
        ],
      ),
    );
  }

  Observer changeBody(DetailViewModel viewModel) {
    return Observer(builder: (_) {
      return viewModel.changePage();
    });
  }
}

class BookDetailWidget extends StatelessWidget {
  BookDetailWidget({
    Key? key,
  }) : super(key: key);
  final viewModel = DetailViewModel();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          TextInputWidget(
              labelName: 'Kitap Adı',
              controller: viewModel.book_name_text_controller),
          TextInputWidget(
              labelName: 'Okunan Sayfa',
              controller: viewModel.book_name_text_controller)
        ],
      ),
    );
  }
}

class SportDetailWidget extends StatelessWidget {
  SportDetailWidget({
    Key? key,
  }) : super(key: key);
  final viewModel = DetailViewModel();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          TextInputWidget(
              labelName: 'Aktivite Adı',
              controller: viewModel.book_name_text_controller),
          TextInputWidget(
              labelName: 'Süre',
              controller: viewModel.book_name_text_controller)
        ],
      ),
    );
  }
}

class TodoDetailWidget extends StatelessWidget {
  TodoDetailWidget({
    Key? key,
  }) : super(key: key);
  final viewModel = DetailViewModel();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.paddingLow,
      child: Column(
        children: [
          Expanded(
              flex: 2,
              child: TextInputWidget(
                  labelName: 'Aktivite Adı',
                  controller: viewModel.book_name_text_controller)),
          Expanded(
            flex: 2,
            child: Padding(
              padding: context.paddingLow,
              child: Row(
                children: [
                  Flexible(child: ToDoSquare(context.colors.primary)),
                  Flexible(child: ToDoSquare(context.colors.error)),
                  Flexible(child: ToDoSquare(context.colors.secondary)),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class WaterDetailWidget extends StatelessWidget {
  WaterDetailWidget({
    Key? key,
  }) : super(key: key);
  final viewModel = DetailViewModel();
  @override
  Widget build(BuildContext context) {
    String glass_svg = 'asset/image/glass.png';
    String mini_bottle_svg = 'asset/image/bottle1.png';
    String big_bottle_svg = 'asset/image/bottle2.png';
    return Container(
      padding: context.paddingLow,
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: context.paddingMediumHorizontal,
              child: RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: 'Bugünkü ihtiyacını karşılamak için',
                      style: context.textTheme.subtitle2),
                  TextSpan(
                    text: ' 1.4',
                    style: context.textTheme.subtitle2!
                        .copyWith(color: context.colors.primary),
                  ),
                  TextSpan(
                    text: ' litre daha su içmelisin',
                    style: context.textTheme.subtitle2,
                  )
                ]),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: context.paddingNormalVertical.copyWith(bottom: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  WaterButton(
                    assetPath: glass_svg,
                    waterSize: '200 ml',
                    onPress: () {},
                  ),
                  WaterButton(
                      assetPath: mini_bottle_svg,
                      waterSize: '500 ml',
                      onPress: () {}),
                  WaterButton(
                      assetPath: big_bottle_svg,
                      waterSize: '1 lt',
                      onPress: () {})
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
