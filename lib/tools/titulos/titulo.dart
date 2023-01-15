class Titulo {
  final List<Item> dados;

  Titulo(this.dados);
}

class Item {
  final List<String> header;
  final List<List<String>> rows;

  Item(this.header, this.rows);

  fromMap(Map<String, dynamic> json) {
    return Item(json['header'], json['rows']);
  }
}

class TituloDefine {
  final int id;
  final String texto;
  final int idLivro;
  final int numeroVersiculo;
  final int capitulo;
  final String categoria;

  TituloDefine(
    this.id,
    this.texto,
    this.idLivro,
    this.numeroVersiculo,
    this.capitulo,
    this.categoria,
  );

  toMap() {
    return {
      'id': id,
      'texto': texto,
      'idLivro': idLivro,
      'numeroVersiculo': numeroVersiculo,
      'capitulo': capitulo,
      'categoria': categoria,
    };
  }
}
