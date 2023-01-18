import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:the_bibble_app/tools/file_tools.dart';
import 'package:the_bibble_app/tools/tema_versiculo/tema_versiculo.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  FileTools fTool = FileTools();

  String content = await fTool.loadFromBibbleJson('versiculo');

  List<dynamic> dados = jsonDecode(content);

  List<InnerData> temasOld =
      dados.map((e) => InnerData.fromMap(e)).toList();

  List<TargetDataOk> temas = temasOld[0]
      .rows
      .map((e) => TargetDataOk(
            id: int.parse(e[0]),
            capitulo: int.parse(e[1]),
            versiculo: int.parse(e[2]),
            texto: e[3],
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
