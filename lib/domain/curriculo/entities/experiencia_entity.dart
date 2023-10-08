class Experiencia {
  final String empresa;
  final String descricao;
  final String cargo;
  final String dataInicio;
  final String dataFim;

  Experiencia({
    required this.empresa,
    required this.descricao,
    required this.cargo,
    required this.dataInicio,
    required this.dataFim,
  });

  @override
  String toString() {
    return 'empresa: $empresa, descrição: $descricao, cargo: $cargo, dataInicio: $dataInicio, dataFim: $dataFim';
  }
}
