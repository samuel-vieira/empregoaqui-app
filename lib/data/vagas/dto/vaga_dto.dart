class VagaDTO {
  final String nome;
  final String id;
  final String nomeEmpresa;
  final String sobreEmpresa;
  final String sobreVaga;
  final List requistos;

  VagaDTO({
    required this.nome,
    this.id = '',
    this.nomeEmpresa = '',
    this.sobreEmpresa = '',
    this.sobreVaga = '',
    this.requistos = const [],
  });

  factory VagaDTO.fromJson(dynamic json) {
    return VagaDTO(
      nome: json['nome'],
    );
  }

  static Map<String, dynamic> toJson(VagaDTO vaga) {
    return <String, dynamic>{'nome': vaga.nome};
  }

  @override
  String toString() {
    return "nome: $nome, id: $id, nomeEmpresa: $nomeEmpresa, sobreEmpresa: $sobreEmpresa, sobreVaga: $sobreVaga, requisitos: $requistos";
  }
}
