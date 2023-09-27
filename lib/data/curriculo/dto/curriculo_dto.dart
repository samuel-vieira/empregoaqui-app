class CurriculoDTO {
  String nome;
  DateTime dataNascimento;
  List<String> experiencias;
  List<String> competencias;

  CurriculoDTO({
    required this.nome,
    required this.competencias,
    required this.dataNascimento,
    required this.experiencias,
  });

  @override
  String toString() {
    return 'nome: $nome, competencias: $competencias, dataNascimento: $dataNascimento, experiencias: $experiencias';
  }
}
