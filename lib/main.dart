import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:the_bibble_app/tools/file_tools.dart';
import 'package:the_bibble_app/tools/livro/livro.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  FileTools fTool = FileTools();

  String content = await fTool.loadFromBibbleJson('livro');

  List<dynamic> dados = jsonDecode(content);

  List<Livro> livros = dados.map((e) => Livro.fromMap(e)).toList();



  String json = jsonEncode(livros
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
