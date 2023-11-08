import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'nota_store.g.dart';

class notaStore = _notaStore with _$notaStore;

abstract class _notaStore with Store {
  @observable
  List<String> listaDeDados = [];

  @action
  Future<void> carregarListaDeDados() async {
    final prefs = await SharedPreferences.getInstance();
    final dadosSalvos = prefs.getStringList('listaDeDados') ?? [];
    listaDeDados = dadosSalvos;
  }

  @action
  Future<void> excluirNota(int index) async {
    if (index >= 0 && index < listaDeDados.length) {
      listaDeDados.removeAt(index);
      final prefs = await SharedPreferences.getInstance();
      await prefs.setStringList('listaDeDados', listaDeDados);
    }
  }

  @action
  Future<void> editarNota(int index, String novoTexto) async {
    if (index >= 0 && index < listaDeDados.length) {
      listaDeDados[index] = novoTexto;
      final prefs = await SharedPreferences.getInstance();
      await prefs.setStringList('listaDeDados', listaDeDados);
    }
  }
}
