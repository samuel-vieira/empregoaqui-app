class Curriculo {
  final List<dynamic> competencias;
  final List<dynamic> experiencias;

  Curriculo({
    required this.competencias,
    required this.experiencias,
  });

  @override
  String toString() {
    return 'competencias: $competencias, experiencias: $experiencias';
  }
}
