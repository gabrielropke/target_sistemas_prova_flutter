import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class loginStore = _loginStore with _$loginStore;

abstract class _loginStore with Store {
  @observable
  TextEditingController controllerUsuario = TextEditingController();

  @action
  void setUsuario(String value) => controllerUsuario.text = value;

  @observable
  TextEditingController controllerSenha = TextEditingController();

  @action
  void setSenha(String value) => controllerSenha.text = value;

  String validarTextfield() {
    final usuario = controllerUsuario.text;
    final senha = controllerSenha.text;

    if (usuario.length < 2) {
      return 'Usuário deve ter no mínimo 2 caracteres.';
    }

    if (usuario.length > 20) {
      return 'Usuário deve ter no máximo 20 caracteres.';
    }

    if (senha.length < 2) {
      return 'Senha deve ter no mínimo 2 caracteres.';
    }

    if (senha.length > 20) {
      return 'Senha deve ter no máximo 20 caracteres.';
    }

    if (usuario.trim() != usuario) {
      return 'Usuário não pode começar/terminar com espaços em branco.';
    }

    if (senha.trim() != senha) {
      return 'Senha não pode começar/terminar com espaços em branco.';
    }

    if (!RegExp(r'^[a-zA-Z0-9]*$').hasMatch(senha)) {
      return 'Não são permitidos caracteres especiais.';
    }

    return 'Sucesso';
  }
}
