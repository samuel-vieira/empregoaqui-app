class VagaDTO {
  final String nome;
  final String nomeEmpresa;
  final String sobreEmpresa;
  final String sobreVaga;
  final List<String> requistos;
  final String modeloTrabalho;
  final String salario;
  final String tipoDeContrato;

  VagaDTO({
    required this.nome,
    this.nomeEmpresa = '',
    this.sobreEmpresa = '',
    this.sobreVaga = '',
    this.requistos = const [],
    this.modeloTrabalho = '',
    this.salario = '',
    this.tipoDeContrato = '',
  });

  factory VagaDTO.fromFirestore(dynamic json) {
    return VagaDTO(
      nome: json['nome'],
      nomeEmpresa: json['nomeEmpresa'],
      sobreEmpresa: json['sobreEmpresa'],
      sobreVaga: json['sobreVaga'],
      requistos: json['requisitos'] is Iterable
          ? List.from(json['requisitos'])
          : const [],
      modeloTrabalho: json['modeloTrabalho'],
      salario: json['salario'],
      tipoDeContrato: json['tipoDeContrato'],
    );
  }

  static Map<String, dynamic> toJson(VagaDTO vaga) {
    return <String, dynamic>{
      'nome': vaga.nome,
      'nomeEmpresa': vaga.nomeEmpresa,
      'sobreEmpresa': vaga.sobreEmpresa,
      'sobreVaga': vaga.sobreVaga,
      'requisitos': vaga.requistos,
      'modeloTrabalho': vaga.modeloTrabalho,
      'salario': vaga.salario,
      'tipoDeContrato': vaga.tipoDeContrato,
    };
  }

  @override
  String toString() {
    return "nome: $nome, nomeEmpresa: $nomeEmpresa, sobreEmpresa: $sobreEmpresa, sobreVaga: $sobreVaga, requisitos: $requistos, modeloTrabalho: $modeloTrabalho, salario: $salario, tipoDeContrato: $tipoDeContrato";
  }
}
