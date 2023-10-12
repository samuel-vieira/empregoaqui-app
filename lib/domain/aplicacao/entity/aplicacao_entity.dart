class Aplicacao {
  Aplicacao({
    required this.vagaNome,
    required this.empresaNome,
    required this.id,
  });

  final String vagaNome;
  final String id;
  final String empresaNome;

  @override
  String toString() {
    return 'vagaNome: $vagaNome, id: $id';
  }
}
