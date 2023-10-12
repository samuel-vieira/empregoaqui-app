class AplicacaoDTO {
  final String nomeVaga;
  final String idVaga;
  final String empresaNome;

  AplicacaoDTO({
    required this.nomeVaga,
    required this.idVaga,
    required this.empresaNome,
  });

  AplicacaoDTO.fromFirestore(Map<String, dynamic> json)
      : this(
          nomeVaga: json['vaga_nome'].toString(),
          idVaga: json['vaga_id'].toString(),
          empresaNome: json['vaga_empresa_nome'].toString(),
        );

  Map<String, Object> toFirestore() {
    return {
      'vaga_nome': nomeVaga,
      'vaga_id': idVaga,
      'vaga_empresa_nome': empresaNome,
    };
  }

  @override
  String toString() {
    return 'nomeVaga: $nomeVaga, idVaga: $idVaga, empresaNome: $empresaNome';
  }
}
