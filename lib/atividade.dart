class Atividade{
  String? urlImg;
  String? titulo;
  String? descricao;
  String? dataInicio;
  String? dataFim;
  bool? atrasada;
  bool? concluida;
  bool? destaque;

  Atividade({this.urlImg, required this.titulo, required this.descricao, this.dataInicio, this.dataFim, this.atrasada=false, this.concluida=false, this.destaque=false});
}