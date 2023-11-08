import 'package:app_atividade/atividade.dart';
import 'package:flutter/material.dart';

class CadAtividade extends StatefulWidget {

  Function? f;

  CadAtividade({Key? key, this.f}) : super(key: key);

  @override
  State<CadAtividade> createState() => _CadAtividadeState();
}

class _CadAtividadeState extends State<CadAtividade> {

  TextEditingController controllerImagem = TextEditingController();
  TextEditingController controllerTitulo = TextEditingController();
  TextEditingController controllerDescricao = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Adicionar atividade"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
            child: Column(
              children: [
                TextFormField(
                    controller: controllerImagem,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        label: Text("Imagem")
                    ),
                    validator: (String? img){
                      if(img!.isEmpty || img == null){
                        return "digite uma url";
                      }
                      return null;
                    },
                ),
                TextFormField(
                  controller: controllerTitulo,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    label: Text("Título")
                  ),
                  validator: (String? titulo){
                    if(titulo!.isEmpty || titulo == null){
                      return "digite um título";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: controllerDescricao,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      label: Text("Descrição")
                  ),
                  validator: (String? desc){
                    if(desc!.isEmpty || desc == null){
                      return "digite uma descrição";
                    }
                    return null;
                  }
                ),
                TextButton(
                    onPressed: (){
                      if(_formKey.currentState!.validate()) {
                        widget.f!(
                            Atividade(
                                urlImg: controllerImagem.text,
                                titulo: controllerTitulo.text,
                                descricao: controllerDescricao.text)
                        );
                      }
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
