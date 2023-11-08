import 'package:app_atividade/banco.dart';
import 'atividade.dart';
import 'home.dart';
import 'package:flutter/material.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  // inicializa a criação do banco
  var banco = Banco();
  await banco.criarBanco();

  await banco.inserirAtividade(Atividade(
    urlImg: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4wg5JU_fPLxA6z7aqM8CiXxcE62rc_oys_w&usqp=CAU",
    titulo: "Estudar para a prova",
    descricao: "Estudar o capítulo sobre Widgets do livro de Flutter ",
  ));
  await banco.inserirAtividade(Atividade(
    urlImg: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTYynY6eylz9wqfQz6BxRAZOwLjNYkmLu1EVw&usqp=CAU",
    titulo: "Ir para academia",
    descricao: "Malhar biceps, peito e perna",
  ));
  await banco.inserirAtividade(Atividade(
    urlImg: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSSo8cANauJsaGnV-KwYmcOjYSWfU_pDLlKBw&usqp=CAU",
    titulo: "Implementar a funcionalidade do app",
    descricao: "fazer a correção do bug x",
  ));

  runApp(MaterialApp(
    home: Home(bd: banco,),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.green
    ),
  ));
}