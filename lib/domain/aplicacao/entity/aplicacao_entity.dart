class Aplicacao {
  Aplicacao({
    required this.vagaNome,
    required this.id,
  });

  final String vagaNome;
  final String id;

  @override
  String toString() {
    return 'vagaNome: $vagaNome, id: $id';
  }
}
