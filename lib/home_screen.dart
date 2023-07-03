import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app_010/style.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return HomeScreenUI();
  }

}

class HomeScreenUI extends State<HomeScreen>{

  final TextEditingController _titleInputTakingController = TextEditingController();
  final TextEditingController _descriptionInputTakingController = TextEditingController();

  List<ToDo> todos = [];

  /// BottomSheet open method for taking input
  void shoBottomSheetForTakingNewNote(){
    showModalBottomSheet(
        context: context,
        builder: (context){
          return Container(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Text("Add New Note", style: myTextStyle(),),
                const SizedBox(height: 10,),
                TextFormField(
                  controller: _titleInputTakingController,
                  decoration: myInputDecoretion("Title"),
                ),
                const SizedBox(height: 5,),
                TextFormField(
                  controller: _descriptionInputTakingController,
                  decoration: myInputDecoretion("Description"),
                ),
                const SizedBox(height: 5,),
                ElevatedButton(
                  style: myElevatedButtonStyle(),
                    onPressed: (){
                    if(_titleInputTakingController.text.trim().isNotEmpty && _descriptionInputTakingController.text.trim().isNotEmpty){
                      todos.add(ToDo(_titleInputTakingController.text.trim(), _descriptionInputTakingController.text.trim(), false));
                      if(mounted){
                        setState(() {});
                      }
                      _titleInputTakingController.clear();
                      _descriptionInputTakingController.clear();
                      Navigator.pop(context);
                    }
                    }, child: const Text("Add Note"))
              ],
            ),
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ToDo App 10"),
        actions: [
          IconButton(onPressed: (){
            todos.clear();
            if(mounted){
              setState(() {});
            }
          }, icon: Icon(Icons.playlist_remove))
        ],
      ),
      body: ListView.builder(
        itemCount: todos.length,
          itemBuilder: (context, index){
            return ListTile(
              onLongPress: (){
                //todos[index].isDone = true;
                todos[index].isDone = !todos[index].isDone;
                if(mounted){
                  setState(() {});
                }
              },
              title: Text("${todos[index].title}"),
              subtitle: Text("${todos[index].description}"),
              leading: todos[index].isDone ? Icon(Icons.check_circle_rounded) : Icon(Icons.close),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: (){
                  todos.removeAt(index);
                  if(mounted){
                    setState(() {});
                  }
                },
              )
            );
          }
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          //print("Button is clicked");
          shoBottomSheetForTakingNewNote();
        },
      ),
    );
  }
}


class ToDo {
  String? title, description;
  bool isDone = false;

  ToDo(this.title, this.description, this.isDone);
}