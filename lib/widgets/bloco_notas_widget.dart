import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:target_teste/pages/info_page.dart';
import 'package:target_teste/stores/nota_store.dart';

class bloco_notas_widget extends StatefulWidget {
  const bloco_notas_widget({Key? key}) : super(key: key);

  @override
  _bloco_notas_widgetState createState() => _bloco_notas_widgetState();
}

class _bloco_notas_widgetState extends State<bloco_notas_widget> {
  final notaStore storeNota = notaStore();
  TextEditingController controllerEditTexto = TextEditingController();
  late String novoTexto = '';

  @override
  void initState() {
    super.initState();
    storeNota.carregarListaDeDados();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (storeNota.listaDeDados.isEmpty)
              const Center(
                child: Text(
                  'Não há dados armazenados.',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
              )
            else
              Expanded(
                  child: ListView.builder(
                itemCount: storeNota.listaDeDados.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  String textoClicado =
                                      storeNota.listaDeDados[index];
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                            content: Text(textoClicado));
                                      });
                                },
                                child: Text(
                                  storeNota.listaDeDados[
                                      index], // Exibe o texto da lista
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18),
                                  maxLines:
                                      1, // Defina o número máximo de linhas antes da quebra
                                  overflow: TextOverflow
                                      .ellipsis, // Define o comportamento de overflow
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              title: const Text('Editar texto'),
                                              content: TextField(
                                                autofocus: true,
                                                textAlign: TextAlign.center,
                                                controller: controllerEditTexto,
                                                keyboardType:
                                                    TextInputType.text,
                                                decoration: InputDecoration(
                                                  hintText:
                                                      'Digite seu novo texto',
                                                  hintStyle: const TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6)),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(6),
                                                          borderSide:
                                                              const BorderSide(
                                                                  color: Colors
                                                                      .white)),
                                                  contentPadding:
                                                      const EdgeInsets.fromLTRB(
                                                          32, 10, 32, 16),
                                                  filled: true,
                                                  fillColor: Colors.white,
                                                ),
                                                onSubmitted: (value) async {
                                                  setState(() {
                                                    novoTexto =
                                                        controllerEditTexto
                                                            .text;
                                                    storeNota.editarNota(
                                                        index, novoTexto);
                                                    Navigator.of(context)
                                                        .pushReplacement(
                                                      MaterialPageRoute(
                                                        builder: (BuildContext
                                                                context) =>
                                                            const info_page(),
                                                      ),
                                                    );
                                                  });
                                                },
                                              ),
                                            );
                                          });
                                    },
                                    child: SizedBox(
                                        width: 25,
                                        child: Image.asset(
                                            'assets/icones/editar_icone.png'))),
                                const SizedBox(width: 8),
                                GestureDetector(
                                    onTap: () {
                                      QuickAlert.show(
                                          context: context,
                                          title: 'Atenção',
                                          text: 'Deseja excluir esta nota?',
                                          confirmBtnText: 'Sim',
                                          onConfirmBtnTap: () {
                                            storeNota.excluirNota(index);
                                            Navigator.of(context)
                                                .pushReplacement(
                                              MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        const info_page(),
                                              ),
                                            );
                                          },
                                          type: QuickAlertType.warning);
                                    },
                                    child: SizedBox(
                                        width: 30,
                                        child: Image.asset(
                                            'assets/icones/remover_icone.png')))
                              ],
                            )
                          ],
                        ),
                        const Divider(
                          color: Colors.black38,
                        )
                      ],
                    ),
                  );
                },
              ))
          ],
        );
      },
    );
  }
}
