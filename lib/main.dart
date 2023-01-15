import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:the_bibble_app/tools/file_tools.dart';
import 'package:the_bibble_app/tools/livro/livro_old.dart';
import 'package:the_bibble_app/tools/temas/tema.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  FileTools fTool = FileTools();

  String content = await fTool.loadFromBibbleJson('tema');

  List<dynamic> dados = jsonDecode(content);

  LivroOld lOld = LivroOld(dados.map((e) {
    List<String> header = (e['header'] as List).cast<String>();
    List<List<String>> rows = (e['rows'] as List).map((j) => (j as List).cast<String>()).toList();

    return InnerObj(header, rows);
  }).toList());

  List<Tema> temas = lOld.data[0].rows.map((tema) => Tema(id: int.parse(tema[0]), nome: tema[1])).toList();

  String json = jsonEncode(temas.map((e) => e.toMap()).toList());

  debugPrint(json);

  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [Text('Nada')],
          ),
        ),
      ),
    );
  }
}
