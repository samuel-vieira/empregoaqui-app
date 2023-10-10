class AplicacaoDTO {
  final String nomeVaga;
  final String idVaga;

  AplicacaoDTO({
    required this.nomeVaga,
    required this.idVaga,
  });

  AplicacaoDTO.fromFirestore(Map<String, dynamic> json)
      : this(
          nomeVaga: json['vaga_nome'].toString(),
          idVaga: json['vaga_id'].toString(),
        );

  Map<String, Object> toFirestore() {
    return {
      'vaga_nome': nomeVaga,
      'vaga_id': idVaga,
    };
  }

  @override
  String toString() {
    return 'nomeVaga: $nomeVaga, idVaga: $idVaga';
  }
}
