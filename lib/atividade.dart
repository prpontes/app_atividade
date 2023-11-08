import 'package:path/path.dart';

class Atividade{
  int? id;
  String? urlImg;
  String? titulo;
  String? descricao;
  String? dataInicio;
  String? dataFim;
  bool? atrasada;
  bool? concluida;
  bool? destaque;

  Atividade({this.id, this.urlImg, required this.titulo, required this.descricao, this.dataInicio, this.dataFim, this.atrasada=false, this.concluida=false, this.destaque=false});

  Map<String, dynamic> toMap(){
    return {
      'id' : id,
      'urlImg' : urlImg,
      'titulo' : titulo,
      'descricao' : descricao,
    };
  }
}