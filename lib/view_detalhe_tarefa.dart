import 'package:flutter/material.dart';

import 'atividade.dart';
import 'dados.dart';
import 'home.dart';
import 'view_editAtividade.dart';

class DetalheTarefa extends StatefulWidget {

  Atividade? atividade;
  int? index;

  DetalheTarefa({Key? key, this.atividade, this.index}) : super(key: key);

  @override
  State<DetalheTarefa> createState() => _DetalheTarefaState();
}

class _DetalheTarefaState extends State<DetalheTarefa> {

  void editar(Atividade at, index){
    listaAtividades.remove(widget.atividade);
    listaAtividades.insert(index, at);
    widget.atividade = at;
    setState(() {
      listaAtividades;
      widget.atividade;
    });
    Navigator.pop(context, "edit");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.keyboard_return),
          onPressed: (){
            Navigator.pop(context, "edit");
          },
        ),
        title: Text("Detalhe da tarefa"),
        actions: [
          IconButton(onPressed: () async{
            await showDialog(
                context: context,
                builder: (context){
                  return AlertDialog(
                    content: Text("Você deseja excluir?"),
                    actions: [
                      TextButton(
                          onPressed: (){
                            Atividade at = listaAtividades.removeAt(widget.index!);
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content:
                                  Text("Tarefa excluída com sucesso!!", style: TextStyle(fontSize: 18),),
                                  backgroundColor: Colors.red,
                                )
                            );
                            Navigator.pop(context, "remove");
                          },
                          child: Text("Sim")
                      ),
                      TextButton(
                          onPressed: (){
                            Navigator.pop(context);
                          },
                          child: Text("Não")
                      )
                    ],
                  );
                }
            );
            Navigator.pop(context, "remove");
          }, icon: Icon(Icons.delete)),
          IconButton(onPressed: (){
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => EditarAtividade(f: editar, atividade: widget.atividade, index: widget.index,)
                )
            );
          }, icon: Icon(Icons.edit))
        ],
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text("Título", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            subtitle: Text(widget.atividade!.titulo!, style: const TextStyle(fontSize: 25)),
          ),
          ListTile(
            title: const Text("Descrição", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            subtitle: Text(widget.atividade!.descricao!, style: const TextStyle(fontSize: 25)),
          ),
        ],
      ),
    );
  }
}
