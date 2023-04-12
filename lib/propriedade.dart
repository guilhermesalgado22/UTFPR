class Propriedade {
  int? id;
  String nome;
  String descricao;
  String tipoSolo;

  Propriedade({
    this.id,
    required this.nome,
    required this.descricao,
    required this.tipoSolo,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'descricao': descricao,
      'tipoSolo': tipoSolo,
    };
  }

  static Propriedade fromMap(Map<String, dynamic> map) {
    return Propriedade(
      id: map['id'],
      nome: map['nome'],
      descricao: map['descricao'],
      tipoSolo: map['tipoSolo'],
    );
  }
}
