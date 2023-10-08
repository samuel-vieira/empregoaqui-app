class Competencia {
  final String nome;
  final String tempo;

  Competencia({
    required this.nome,
    required this.tempo,
  });

  @override
  String toString() {
    return 'nome: $nome, tempo: $tempo';
  }
}
