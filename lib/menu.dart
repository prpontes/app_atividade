import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT1vQPe-Pm_-I8ZPk82L0XEggV76c7--2zrdw&usqp=CAU"),
                    radius: 30,
                  ),
                  ListTile(
                    title: Text("Admin", style: TextStyle(fontSize: 18),),
                    subtitle: Text("admin@gmail.com", style: TextStyle(fontSize: 16),),
                  )
                ],
              )
          ),
          ListTile(
            onTap: (){
              Navigator.pushReplacementNamed(context, "/home");
            },
            leading: const Icon(Icons.image, color: Colors.green,),
            title: const Text("Tarefas"),
          ),
          ListTile(
            onTap: (){
              Navigator.pushReplacementNamed(context, "/telausuario");
            },
            leading: const Icon(Icons.account_box, color: Colors.green,),
            title: const Text("Usuário"),
          ),
          const Divider(
            color: Colors.black,
          ),
          ListTile(
            onTap: (){
              Navigator.pushReplacementNamed(context, "/");
            },
            leading: const Icon(Icons.logout, color: Colors.green,),
            title: const Text("Sair"),
          ),
        ],
      ),
    );
  }
}

