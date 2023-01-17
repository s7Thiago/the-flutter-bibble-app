class Livro {
  final int idLivro;
  final String nome;
  final String testamento;
  final int qtdeCapitulo;

  Livro({
    required this.idLivro,
    required this.nome,
    required this.testamento,
    required this.qtdeCapitulo,
  });

  factory Livro.fromMap(Map<String, dynamic> map) {
    return Livro(
      idLivro: int.parse(map['idLivro']),
      nome: map['nome'],
      testamento: map['testamento'],
      qtdeCapitulo: int.parse(map['qtdeCapitulo']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'idLivro': idLivro,
      'nome': nome,
      'testamento': testamento,
      'qtdeCapitulo': qtdeCapitulo,
    };
  }

}
