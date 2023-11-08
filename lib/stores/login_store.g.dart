// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$loginStore on _loginStore, Store {
  late final _$controllerUsuarioAtom =
      Atom(name: '_loginStore.controllerUsuario', context: context);

  @override
  TextEditingController get controllerUsuario {
    _$controllerUsuarioAtom.reportRead();
    return super.controllerUsuario;
  }

  @override
  set controllerUsuario(TextEditingController value) {
    _$controllerUsuarioAtom.reportWrite(value, super.controllerUsuario, () {
      super.controllerUsuario = value;
    });
  }

  late final _$controllerSenhaAtom =
      Atom(name: '_loginStore.controllerSenha', context: context);

  @override
  TextEditingController get controllerSenha {
    _$controllerSenhaAtom.reportRead();
    return super.controllerSenha;
  }

  @override
  set controllerSenha(TextEditingController value) {
    _$controllerSenhaAtom.reportWrite(value, super.controllerSenha, () {
      super.controllerSenha = value;
    });
  }

  late final _$_loginStoreActionController =
      ActionController(name: '_loginStore', context: context);

  @override
  void setUsuario(String value) {
    final _$actionInfo = _$_loginStoreActionController.startAction(
        name: '_loginStore.setUsuario');
    try {
      return super.setUsuario(value);
    } finally {
      _$_loginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSenha(String value) {
    final _$actionInfo =
        _$_loginStoreActionController.startAction(name: '_loginStore.setSenha');
    try {
      return super.setSenha(value);
    } finally {
      _$_loginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
controllerUsuario: ${controllerUsuario},
controllerSenha: ${controllerSenha}
    ''';
  }
}
