class InnerObj {
  final List<String> header;
  final List<List<String>> rows;

  InnerObj(this.header, this.rows);

  InnerObj fromMap(Map<String, dynamic> input) {
    return InnerObj(input['header'], input['rows']);
  }

  Map<String, dynamic> toMap() {
    return {
      'header': header,
      'rows': rows,
    };
  }

}

class LivroOld {
  final List<InnerObj> data;

  LivroOld(this.data);

  LivroOld fromMap(List<Map<String, dynamic>> json) {
    return LivroOld(json.map((e) => (e as InnerObj).fromMap(e)).toList());
  }

  List<Map<String, dynamic>> toMap() {
    return data.map((e) => e.toMap()).toList();
  }

}