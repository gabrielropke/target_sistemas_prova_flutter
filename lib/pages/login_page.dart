import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:target_teste/pages/info_page.dart';
import 'package:target_teste/stores/login_store.dart';
import 'package:target_teste/widgets/politicas_widget.dart';
import 'package:target_teste/widgets/text_field_widget.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class login_page extends StatefulWidget {
  const login_page({super.key});

  @override
  State<login_page> createState() => _login_pageState();
}

class _login_pageState extends State<login_page> {
  loginStore storeLogin = loginStore();

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
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                margin: const EdgeInsets.all(18),
                height: 400,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(6.0),
                            child: Text('Usuário'),
                          ),
                          text_field_widget(
                              controller: storeLogin.controllerUsuario,
                              prefixIcon: const Icon(
                                Icons.person,
                                size: 20,
                                color: Colors.black,
                              ),
                              obscureText: false,
                              textInputType: TextInputType.name,
                              enable: true,
                              onChanged: storeLogin.setUsuario),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(6.0),
                            child: Text('Senha'),
                          ),
                          text_field_widget(
                              controller: storeLogin.controllerSenha,
                              prefixIcon: const Icon(
                                Icons.lock,
                                size: 20,
                                color: Colors.black,
                              ),
                              obscureText: true,
                              textInputType: TextInputType.name,
                              enable: true,
                              onChanged: storeLogin.setSenha),
                        ],
                      ),
                      const SizedBox(height: 40),
                      Observer(
                        builder: (_) {
                          return SizedBox(
                            width: 170,
                            height: 45,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32),
                                ),
                              ),
                              onPressed: () {
                                final mensagemErro =
                                    storeLogin.validarTextfield();
                                if (mensagemErro == 'Sucesso') {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const info_page()));
                                } else {
                                  QuickAlert.show(
                                      context: context,
                                      title: 'Aviso',
                                      text: mensagemErro,
                                      confirmBtnText: 'Ok',
                                      type: QuickAlertType.error);
                                }
                              },
                              child: Center(
                                child: Text(
                                  'Entrar',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ),
              ),
              const politicas_widget()
            ],
          ),
        ],
      ),
    );
  }
}
