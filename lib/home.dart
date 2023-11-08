import 'package:flutter/material.dart';
import 'atividade.dart';
import 'banco.dart';
import 'dados.dart';
import 'menu.dart';
import 'view_cadAtividade.dart';
import 'view_detalhe_tarefa.dart';

class Home extends StatefulWidget {
  Banco? bd;
  Home({Key? key, this.bd}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  bool busca = false;
  TextEditingController controllerBuscaTarefas = TextEditingController();
  List<Atividade> listaAtividades = [];
  List<Atividade> campoBuscaVazio = [];

  void salvar(Atividade at){
    listaAtividades.add(at);
    setState(() {
      listaAtividades;
    });
    Navigator.pop(context);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    carregarAtividades();
  }

  Future<void> carregarAtividades() async{
    listaAtividades = await widget.bd!.listarAtividades();
    setState(() {
      listaAtividades;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: busca ? TextField(
          style: TextStyle(fontSize: 20, color: Colors.white),
          cursorColor: Colors.white,
          showCursor: true,
          autofocus: true,
          decoration: const InputDecoration(
            hintText: "digite um texto...",
            hintStyle: TextStyle(color: Colors.white),
          ),
          controller: controllerBuscaTarefas,
          onTapOutside: (e){
            setState(() {
              busca = false;
            });
          },
          onChanged: (e){
            List<Atividade> campoBuscaPreenchido = [];

            if(controllerBuscaTarefas.text.isEmpty){
              setState(() {
                listaAtividades = campoBuscaVazio;
              });
            }else{
              listaAtividades.forEach((element) {
                if (element.titulo!.toLowerCase().contains(controllerBuscaTarefas.text) || element.descricao!.toLowerCase().contains(controllerBuscaTarefas.text)) {
                  campoBuscaPreenchido.add(element);
                }
              });
              setState(() {
                listaAtividades = campoBuscaPreenchido;
              });
            }
          },
        ) : const Text("Tarefas"),
        actions: [
          IconButton(
              onPressed: (){
                setState(() {
                  busca = true;
                });
              },
              icon: Icon(Icons.search)
          )
        ],
      ),
      drawer: Menu(),
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
                      "${listaAtividades[index].urlImg}",),
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
        tooltip: "Nova atividade",
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
