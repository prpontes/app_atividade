import 'package:flutter/material.dart';

import 'atividade.dart';

class EditarAtividade extends StatefulWidget {

  Atividade? atividade;
  Function? f;
  int? index;

  EditarAtividade({Key? key, this.f, this.atividade, this.index}) : super(key: key);

  @override
  State<EditarAtividade> createState() => _EditarAtividadeState();
}

class _EditarAtividadeState extends State<EditarAtividade> {
  TextEditingController controllerTitulo = TextEditingController();
  TextEditingController controllerDescricao = TextEditingController();

  @override
  Widget build(BuildContext context) {

    controllerTitulo.text = widget.atividade!.titulo!;
    controllerDescricao.text = widget.atividade!.descricao!;

    return Scaffold(
      appBar: AppBar(
        title: Text("Editar atividade"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
            child: Column(
              children: [
                TextFormField(
                    controller: controllerTitulo,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        label: Text("Título")
                    )
                ),
                TextFormField(
                    controller: controllerDescricao,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        label: Text("Descrição")
                    )
                ),
                TextButton(
                    onPressed: (){
                      widget.f!(
                          Atividade(
                              titulo: controllerTitulo.text,
                              descricao: controllerDescricao.text),
                        widget.index
                      );
                    },
                    child: Text("Salvar")
                )
              ],
            )
        ),
      ),
    );
  }
}
