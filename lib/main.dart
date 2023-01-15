import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:the_bibble_app/tools/file_tools.dart';
import 'package:the_bibble_app/tools/livro/livro_converter.dart';
import 'package:the_bibble_app/tools/livro/livro_old.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  FileTools fTool = FileTools();

  String content = await fTool.loadFromBibbleJson('livro');

  List<dynamic> dados = jsonDecode(content);

  LivroOld lOld = LivroOld(dados.map((e) {
    List<String> header = (e['header'] as List).cast<String>();
    List<List<String>> rows =
        (e['rows'] as List).map((j) => (j as List).cast<String>()).toList();

    return InnerObj(header, rows);
  }).toList());

  String json = jsonEncode(lOld.data[0].rows
      .map(
        (e) => Livro(
          idLivro: e[0],
          nome: e[1],
          testamento: e[2],
          qtdeCapitulo: e[3],
        ),
      )
      .toList().map((e) => e.toMap()).toList());

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
