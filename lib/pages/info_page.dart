import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:target_teste/stores/info_store.dart';
import 'package:target_teste/widgets/bloco_notas_widget.dart';
import 'package:target_teste/widgets/politicas_widget.dart';

class info_page extends StatefulWidget {
  const info_page({super.key});

  @override
  State<info_page> createState() => _info_pageState();
}

class _info_pageState extends State<info_page> {
  infoStore storeInfo = infoStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color.fromARGB(255, 9, 74, 94), Color(0xff299695)]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 350,
                      color: Colors.white,
                      child: const bloco_notas_widget(),
                    ),
                    const SizedBox(height: 50),
                    TextField(
                      autofocus: true,
                      textAlign: TextAlign.center,
                      controller: storeInfo.controllerTexto,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: 'Digite seu texto',
                        hintStyle: const TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: const BorderSide(color: Colors.white)),
                        contentPadding:
                            const EdgeInsets.fromLTRB(32, 10, 32, 16),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      onChanged: storeInfo.setTexto,
                      onSubmitted: (value) async {
                        final mensagemErro = storeInfo.validarTextfield();
                        if (mensagemErro == 'Sucesso') {
                          final textoDigitado = storeInfo.controllerTexto.text;
                          final prefs = await SharedPreferences.getInstance();
                          final listaDeDados =
                              prefs.getStringList('listaDeDados') ?? [];
                          listaDeDados.add(textoDigitado);
                          await prefs.setStringList(
                              'listaDeDados', listaDeDados);
                          storeInfo.controllerTexto.clear();
                        }
                        // ignore: use_build_context_synchronously
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const info_page(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 100),
                    const politicas_widget()
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
