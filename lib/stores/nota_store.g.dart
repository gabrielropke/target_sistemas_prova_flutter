// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nota_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$notaStore on _notaStore, Store {
  late final _$listaDeDadosAtom =
      Atom(name: '_notaStore.listaDeDados', context: context);

  @override
  List<String> get listaDeDados {
    _$listaDeDadosAtom.reportRead();
    return super.listaDeDados;
  }

  @override
  set listaDeDados(List<String> value) {
    _$listaDeDadosAtom.reportWrite(value, super.listaDeDados, () {
      super.listaDeDados = value;
    });
  }

  late final _$carregarListaDeDadosAsyncAction =
      AsyncAction('_notaStore.carregarListaDeDados', context: context);

  @override
  Future<void> carregarListaDeDados() {
    return _$carregarListaDeDadosAsyncAction
        .run(() => super.carregarListaDeDados());
  }

  late final _$excluirNotaAsyncAction =
      AsyncAction('_notaStore.excluirNota', context: context);

  @override
  Future<void> excluirNota(int index) {
    return _$excluirNotaAsyncAction.run(() => super.excluirNota(index));
  }

  @override
  String toString() {
    return '''
listaDeDados: ${listaDeDados}
    ''';
  }
}
