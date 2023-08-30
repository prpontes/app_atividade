import 'package:app_atividade/atividade.dart';
import 'package:flutter/material.dart';

class CadAtividade extends StatefulWidget {

  Function? f;

  CadAtividade({Key? key, this.f}) : super(key: key);

  @override
  State<CadAtividade> createState() => _CadAtividadeState();
}

class _CadAtividadeState extends State<CadAtividade> {

  TextEditingController controllerTitulo = TextEditingController();
  TextEditingController controllerDescricao = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Adicionar atividade"),
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
                              descricao: controllerDescricao.text)
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
