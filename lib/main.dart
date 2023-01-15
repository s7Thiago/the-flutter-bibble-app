import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:the_bibble_app/tools/file_tools.dart';
import 'package:the_bibble_app/tools/titulos/titulo.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  FileTools fTool = FileTools();

  String content = await fTool.loadFromBibbleJson('titulo');

  List<dynamic> dados = jsonDecode(content);

  Titulo titulo = Titulo(dados.map((e) {
    List<String> header = (e['header']).cast<String>();
    List<List<String>> rows = (e['rows'] as List)
        .map((j) => (j as List).cast<String>().toList())
        .toList();

    return Item(header, rows);
  }).toList());

  List<TituloDefine> tituloDefine = titulo.dados[0].rows.map((e) {
    return TituloDefine(
      int.parse(e[0]),
      e[1],
      int.parse(e[2]),
      int.parse(e[3]),
      int.parse(e[4]),
      e[5],
    );
  }).toList();

  String json = jsonEncode(tituloDefine
      .map(
        (e) => e.toMap(),
      )
      .toList());

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
