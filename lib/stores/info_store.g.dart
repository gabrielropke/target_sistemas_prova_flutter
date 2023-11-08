// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$infoStore on _infoStore, Store {
  late final _$controllerTextoAtom =
      Atom(name: '_infoStore.controllerTexto', context: context);

  @override
  TextEditingController get controllerTexto {
    _$controllerTextoAtom.reportRead();
    return super.controllerTexto;
  }

  @override
  set controllerTexto(TextEditingController value) {
    _$controllerTextoAtom.reportWrite(value, super.controllerTexto, () {
      super.controllerTexto = value;
    });
  }

  late final _$_infoStoreActionController =
      ActionController(name: '_infoStore', context: context);

  @override
  void setTexto(String value) {
    final _$actionInfo =
        _$_infoStoreActionController.startAction(name: '_infoStore.setTexto');
    try {
      return super.setTexto(value);
    } finally {
      _$_infoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
controllerTexto: ${controllerTexto}
    ''';
  }
}
