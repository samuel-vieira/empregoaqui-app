class Vaga {
  String nome;
  String principalTecnologia;
  String modeloDeTrabalho;
  String nomeEmpresa;
  String tipoDeContrato;
  String salario;
  String sobreVaga;
  String sobreEmpresa;
  List<String> requisitos;

  Vaga({
    required this.nome,
    required this.principalTecnologia,
    required this.modeloDeTrabalho,
    required this.nomeEmpresa,
    required this.tipoDeContrato,
    required this.salario,
    required this.sobreVaga,
    required this.sobreEmpresa,
    required this.requisitos,
  });

  @override
  String toString() {
    return "nome: $nome, principalTecnologia: $principalTecnologia, modeloDeTrabalho: $modeloDeTrabalho, nomeEmpresa: $nomeEmpresa, tipoDeContrato: $tipoDeContrato, salario: $salario, sobreVaga: $sobreVaga, sobreEmpresa: $sobreEmpresa, requisitos: $requisitos";
  }
}
