import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class politicas_widget extends StatelessWidget {
  const politicas_widget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final politicas = Uri.parse('https://www.google.com.br/');
        if (await canLaunchUrl(politicas)) {
          await launchUrl(politicas);
        }
      },
      child: const Text(
        'Política de Privacidade',
        style: TextStyle(fontSize: 14),
      ),
    );
  }
}
