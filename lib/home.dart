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
      body: listaAtividades.isNotEmpty ? ListView.builder(
        itemCount: listaAtividades.length,
          itemBuilder: (context, index){
            return Card(
              child: ListTile(
                onTap: () async {
                  var t = await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              DetalheTarefa(atividade: listaAtividades[index],
                                index: index,)
                      )
                  );
                  if (t == "edit") {
                    setState(() {
                      listaAtividades;
                    });
                  }
                  if (t == "remove") {
                    setState(() {
                      listaAtividades;
                    });
                  }
                },
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "${listaAtividades[index].urlImg}"),
                ),
                title: Text("${listaAtividades[index].titulo}",
                  style: TextStyle(fontSize: 20),),
                subtitle: Text("${listaAtividades[index].descricao}",
                  style: TextStyle(fontSize: 18),),
                trailing: Tooltip(
                  message: "Atividade concluída!",
                  child: Checkbox(
                      value: listaAtividades[index].concluida,
                      onChanged: (valor) {
                        setState(() {
                          listaAtividades[index].concluida = valor;
                        });
                      }),
                ),
              ),
            );
          }
      ) : const Center(child: Text("Nenhuma tarefa!", style: TextStyle(fontSize: 20),),),
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
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white70,
          items: const [
            BottomNavigationBarItem(
              label: "Tarefas",
              icon: Icon(Icons.list)
            ),
            BottomNavigationBarItem(
              label: "Concluídas",
              icon: Icon(Icons.check_box)
            ),
            BottomNavigationBarItem(
              label: "Configuração",
              icon: Icon(Icons.settings)
            ),
          ]
      ),
    );
  }
}
