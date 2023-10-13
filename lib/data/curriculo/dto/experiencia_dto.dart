class ExperienciaDTO {
  final String empresa;
  final String descricao;
  final String cargo;
  final String tempoInicio;
  final String tempoFim;
  String id;

  ExperienciaDTO({
    required this.empresa,
    required this.descricao,
    required this.cargo,
    required this.tempoInicio,
    required this.tempoFim,
    required this.id,
  });

  ExperienciaDTO.fromFirestore(
    Map<String, Object?> json,
  ) : this(
          empresa: json['empresa']! as String,
          descricao: json['descricao']! as String,
          cargo: json['cargo']! as String,
          tempoInicio: json['tempoInicio']! as String,
          tempoFim: json['tempoFim']! as String,
          id: json['id'] as String,
        );

  Map<String, Object?> toFirestore() {
    return {
      'empresa': empresa,
      'descricao': descricao,
      'cargo': cargo,
      'tempoInicio': tempoInicio,
      'tempoFim': tempoFim,
      'id': id,
    };
  }
}
