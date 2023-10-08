class CurriculoDTO {
  List<dynamic> experiencias;
  List<dynamic> competencias;

  CurriculoDTO({
    required this.competencias,
    required this.experiencias,
  });

  factory CurriculoDTO.fromFirestore(dynamic json) {
    return CurriculoDTO(
      competencias: json?['competencias'] ?? '',
      experiencias: json?['experiencias'] ?? '',
    );
  }

  @override
  String toString() {
    return 'competencias: $competencias, experiencias: $experiencias';
  }
}
