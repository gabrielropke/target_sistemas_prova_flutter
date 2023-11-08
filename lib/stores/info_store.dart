import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'info_store.g.dart';

class infoStore = _infoStore with _$infoStore;

abstract class _infoStore with Store {

  @observable
  TextEditingController controllerTexto = TextEditingController();

  @action
  void setTexto(String value) => controllerTexto.text = value;

  String validarTextfield() {
    final texto = controllerTexto.text;

    if (texto.isEmpty) {
      return 'Texto em branco';
    }

    return 'Sucesso';
  }
}
