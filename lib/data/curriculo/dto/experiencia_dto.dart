class ExperienciaDTO {
  final String empresa;
  final String descricao;
  final String cargo;
  final String tempoInicio;
  final String tempoFim;

  ExperienciaDTO({
    required this.empresa,
    required this.descricao,
    required this.cargo,
    required this.tempoInicio,
    required this.tempoFim,
  });

  ExperienciaDTO.fromFirestore(
    Map<String, Object?> json,
  ) : this(
          empresa: json['empresa']! as String,
          descricao: json['descricao']! as String,
          cargo: json['cargo']! as String,
          tempoInicio: json['tempoInicio']! as String,
          tempoFim: json['tempoFim']! as String,
        );

  Map<String, Object?> toFirestore() {
    return {
      'empresa': empresa,
      'descricao': descricao,
      'cargo': cargo,
      'tempoInicio': tempoInicio,
      'tempoFim': tempoFim,
    };
  }
}
