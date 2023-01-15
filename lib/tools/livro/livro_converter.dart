class Livro {
  final String idLivro;
  final String nome;
  final String testamento;
  final String qtdeCapitulo;

  const Livro({
    required this.idLivro,
    required this.nome,
    required this.testamento,
    required this.qtdeCapitulo,
  });

  Map<String, dynamic>  toMap() => {
        "idLivro": idLivro,
        "nome": nome,
        "testamento": testamento,
        "qtdeCapitulo": qtdeCapitulo,
      };
}
