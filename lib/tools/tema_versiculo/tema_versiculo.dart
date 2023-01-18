class InnerData {
  final List<String> header;
  final List<List<dynamic>> rows;

  InnerData(this.header, this.rows);

  factory InnerData.fromMap(Map<String, dynamic> map) {
    return InnerData(
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

class TargetData {
  final List<InnerData> data;

  TargetData(this.data);

  factory TargetData.fromMap(List<dynamic> data) {
    return TargetData(
      data.map((e) => InnerData.fromMap(e)).toList(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      '': data.map((e) => e.toMap()).toList(),
    };
  }
}

class TargetDataOk {
  final int id;
  final int capitulo;
  final int qtdeVersiculos;

  TargetDataOk({
    required this.id,
    required this.capitulo,
    required this.qtdeVersiculos,
  });

  // toMap
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'capitulo': capitulo,
      'qtdeVersiculos': qtdeVersiculos,
    };
  }
}
