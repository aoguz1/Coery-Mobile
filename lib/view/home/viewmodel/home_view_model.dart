import 'package:mobx/mobx.dart';
part 'home_view_model.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store {
  @observable
  DateTime date = DateTime.now();

  @action
  String getDate() {
    final dateParse = DateTime.parse(date.toString());
    final formattedDate =
        '${dateParse.day} ${dateParse.month} ${dateParse.year}';
    return formattedDate;
  }
}
