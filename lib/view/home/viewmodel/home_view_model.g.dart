// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeViewModel on _HomeViewModelBase, Store {
  final _$dateAtom = Atom(name: '_HomeViewModelBase.date');

  @override
  DateTime get date {
    _$dateAtom.reportRead();
    return super.date;
  }

  @override
  set date(DateTime value) {
    _$dateAtom.reportWrite(value, super.date, () {
      super.date = value;
    });
  }

  final _$selectedCardAtom = Atom(name: '_HomeViewModelBase.selectedCard');

  @override
  int get selectedCard {
    _$selectedCardAtom.reportRead();
    return super.selectedCard;
  }

  @override
  set selectedCard(int value) {
    _$selectedCardAtom.reportWrite(value, super.selectedCard, () {
      super.selectedCard = value;
    });
  }

  final _$touchedValueAtom = Atom(name: '_HomeViewModelBase.touchedValue');

  @override
  double? get touchedValue {
    _$touchedValueAtom.reportRead();
    return super.touchedValue;
  }

  @override
  set touchedValue(double? value) {
    _$touchedValueAtom.reportWrite(value, super.touchedValue, () {
      super.touchedValue = value;
    });
  }

  final _$sayiAtom = Atom(name: '_HomeViewModelBase.sayi');

  @override
  int get sayi {
    _$sayiAtom.reportRead();
    return super.sayi;
  }

  @override
  set sayi(int value) {
    _$sayiAtom.reportWrite(value, super.sayi, () {
      super.sayi = value;
    });
  }

  final _$_HomeViewModelBaseActionController =
      ActionController(name: '_HomeViewModelBase');

  @override
  void increment() {
    final _$actionInfo = _$_HomeViewModelBaseActionController.startAction(
        name: '_HomeViewModelBase.increment');
    try {
      return super.increment();
    } finally {
      _$_HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String getDate() {
    final _$actionInfo = _$_HomeViewModelBaseActionController.startAction(
        name: '_HomeViewModelBase.getDate');
    try {
      return super.getDate();
    } finally {
      _$_HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
date: ${date},
selectedCard: ${selectedCard},
touchedValue: ${touchedValue},
sayi: ${sayi}
    ''';
  }
}
