import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttermvvmtemplate/core/base/view/base_widget.dart';
import 'package:fluttermvvmtemplate/core/components/page_view_card/page_view_card.dart';
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
              floatingActionButton: FloatingActionButton(
                onPressed: () {},
                backgroundColor: context.colors.onPrimary,
                child: Icon(
                  Icons.done,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              body: Column(
                children: [
                  Expanded(
                    flex: 4,
                    child: Container(
                      padding: context.paddingMedium,
                      width: double.infinity,
                      color: context.colors.primary,
                      child: Column(
                        children: [
                          Expanded(flex: 2, child: SizedBox()),
                          Expanded(
                            flex: 3,
                            child: Container(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Etkinlik Gir ⚡️',
                                style: context.textTheme.headline5,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Container(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Yaptığın aktiviteleri girerek kolayca takip et !',
                                style: context.textTheme.subtitle1
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 6,
                      child: Container(
                        child: Column(
                          children: [
                            Expanded(
                              flex: 6,
                              child: Container(
                                child: Column(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: SvgPicture.asset(
                                          'asset/svg/polygon_down.svg'),
                                    ),
                                    Expanded(
                                        flex: 3,
                                        child: Container(
                                          child: PageView(
                                            onPageChanged: (value) {
                                              print(value);
                                              viewModel
                                                  .changeInitialPage(value);
                                            },
                                            controller: viewModel.controller,
                                            children: [
                                              PageViewCard('💪', 'Spor'),
                                              PageViewCard('💦', 'Su'),
                                              PageViewCard('📕', 'Kitap'),
                                              PageViewCard('⏰', 'Yapılacaklar'),
                                            ],
                                          ),
                                        )),
                                    Expanded(
                                      flex: 1,
                                      child: SvgPicture.asset(
                                          'asset/svg/polygon_up.svg'),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 5,
                              child: Container(
                                color: Colors.brown,
                              ),
                            ),
                            Spacer(
                              flex: 6,
                            )
                          ],
                        ),
                      ))
                ],
              ),
            ));
  }
}
