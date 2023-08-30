import 'package:flutter/material.dart';
import 'atividade.dart';
import 'dados.dart';
import 'view_cadAtividade.dart';
import 'view_detalhe_tarefa.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  void salvar(Atividade at){
    listaAtividades.add(at);
    setState(() {
      listaAtividades;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tarefas"),
      ),
      body: ListView.builder(
        itemCount: listaAtividades.length,
          itemBuilder: (context, index){
            return ListTile(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetalheTarefa()
                  )
                );
              },
              title: Text("${listaAtividades[index].titulo}"),
              subtitle: Text("${listaAtividades[index].descricao}"),
            );
          }
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
          onPressed: (){
            Navigator.push(
                context, 
                MaterialPageRoute(
                    builder: (context) => CadAtividade(f: salvar,)
                )
            );
          }
      ),
    );
  }
}
