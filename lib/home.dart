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
            return Card(
              child: ListTile(
                onTap: () async {
                  var t = await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetalheTarefa(atividade: listaAtividades[index], index: index,)
                    )
                  );
                  if(t == "edit"){
                    setState(() {
                      listaAtividades;
                    });
                  }
                  if( t == "remove"){
                    setState(() {
                      listaAtividades;
                    });
                  }
                },
                title: Text("${listaAtividades[index].titulo}"),
                subtitle: Text("${listaAtividades[index].descricao}"),
              ),
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
