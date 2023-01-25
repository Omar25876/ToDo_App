import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/todo_dm.dart';

import '../providers/todoprovider.dart';
import '../shared/components/update_txtfaild.dart';

class UpdateItem extends StatefulWidget {
  static String updateitem = 'Updaye Item';

  @override
  State<UpdateItem> createState() => _UpdateItemState();
}

class _UpdateItemState extends State<UpdateItem> {
late TextEditingController titlecontroler;

  late TextEditingController descriptionecontroler;
var formkey = GlobalKey<FormState>();
late TodoProvider provider;
  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);

    TodoDM todo = ModalRoute.of(context)!.settings.arguments as TodoDM;
    double hight = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    titlecontroler = TextEditingController(text: todo.title);
    descriptionecontroler = TextEditingController(text : todo.description);
    return Scaffold(
      body: Stack(
        children: [
          AppBar(
            title: Text('To Do List'),
            flexibleSpace: SizedBox(height: hight*0.2,),
          ),


          Container(
            padding:EdgeInsetsDirectional.all(20),
            margin: EdgeInsets.fromLTRB(30, 150, 30, 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),

            child: Form(
              key: formkey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Text('Edit Task'),
                    ),
                    SizedBox(height: hight*0.1),
                    UpdateTextFaild(controller:titlecontroler ,
                        hint:"Edit Title" ,
                        type: TextInputType.text,
                      change: (value){
                      todo.title = value;
                      },
                      validate: (value){
                        if(value!.isEmpty){
                          return "Title shouldn't be empty!";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: hight*0.01),
                    UpdateTextFaild(controller:descriptionecontroler ,
                        hint:"Edit Description" ,
                        type: TextInputType.multiline,
                      change: (value){
                      todo.description = value;
                      },
                      validate: (value){
                      if(value!.isEmpty){
                        return "Description shouldn't be empty!";
                      }
                      return null;
                      },
                    ),
                    SizedBox(height: hight*0.04),
                    Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Text('Select Time',textAlign: TextAlign.left),
                    ),

                    SizedBox(height: hight*0.02),

                    InkWell(
                      onTap: (){
                        showdatepicker(todo);
                      },
                        child: Text("${todo.time.day}-${todo.time.month}-${todo.time.year}")),

                    SizedBox(height: hight*0.2),

                    ElevatedButton(onPressed: (){
                      if(formkey.currentState!.validate()){
                        provider.updatetodo(todo);
                        Navigator.pop(context);
                      }
                    },
                        child: Text('Save Changes'),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        )
                      ),
                    ),

                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );

  }
void showdatepicker(TodoDM todo){
showDatePicker(context: context,
    initialDate: todo.time,
    firstDate: DateTime.now(),
    lastDate: DateTime.now().add(Duration(days: 365))).then(
    (value){
      todo.time = value ?? todo.time;
      setState(() {});
    },
);
}
}
