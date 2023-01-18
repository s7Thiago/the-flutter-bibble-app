import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:the_bibble_app/tools/file_tools.dart';
import 'package:the_bibble_app/tools/tema_versiculo/tema_versiculo.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  FileTools fTool = FileTools();

  String content = await fTool.loadFromBibbleJson('tema_versiculo');

  List<dynamic> dados = jsonDecode(content);

  List<TemaVersiculoData> temasOld =
      dados.map((e) => TemaVersiculoData.fromMap(e)).toList();

  List<TemaVersiculoOk> temas = temasOld[0]
      .rows
      .map((e) => TemaVersiculoOk(
            id: int.parse(e[0]),
            idTema: int.parse(e[1]),
            sequencia: int.parse(e[2]),
            idLivro: int.parse(e[3]),
            capitulo: int.parse(e[4]),
            versiculo: int.parse(e[5]),
          ))
      .toList();

  String json = jsonEncode(temas
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
