class Experiencia {
  final String empresa;
  final String descricao;
  final String cargo;
  final String dataInicio;
  final String dataFim;
  final String id;

  Experiencia({
    required this.empresa,
    required this.descricao,
    required this.cargo,
    required this.dataInicio,
    required this.dataFim,
    required this.id,
  });

  @override
  String toString() {
    return 'empresa: $empresa, descrição: $descricao, cargo: $cargo, dataInicio: $dataInicio, dataFim: $dataFim, id: $id';
  }
}
