class TemaVersiculoData {
  final List<String> header;
  final List<List<dynamic>> rows;

  TemaVersiculoData(this.header, this.rows);

  factory TemaVersiculoData.fromMap(Map<String, dynamic> map) {
    return TemaVersiculoData(
      (map['header']).cast<String>(),
      (map['rows']).cast<List<dynamic>>(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'header': header,
      'rows': rows,
    };
  }
}

class TemaVersiculo {
  final List<TemaVersiculoData> data;

  TemaVersiculo(this.data);

  factory TemaVersiculo.fromMap(List<dynamic> data) {
    return TemaVersiculo(
      data.map((e) => TemaVersiculoData.fromMap(e)).toList(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      '': data.map((e) => e.toMap()).toList(),
    };
  }
}

class TemaVersiculoOk {
  final int id;
  final int idTema;
  final int sequencia;
  final int idLivro;
  final int capitulo;
  final int versiculo;

  TemaVersiculoOk({
    required this.id,
    required this.idTema,
    required this.sequencia,
    required this.idLivro,
    required this.capitulo,
    required this.versiculo,
  });

  // toMap
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'idTema': idTema,
      'sequencia': sequencia,
      'idLivro': idLivro,
      'capitulo': capitulo,
      'versiculo': versiculo,
    };
  }
}
