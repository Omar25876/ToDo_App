import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/todo_dm.dart';

import '../providers/providersetting.dart';
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
late SettingProvider providermode;
  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
    providermode = Provider.of(context);
    TodoDM todo = ModalRoute.of(context)!.settings.arguments as TodoDM;
    double hight = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    titlecontroler = TextEditingController(text: todo.title);
    descriptionecontroler = TextEditingController(text : todo.description);
    return Scaffold(
      backgroundColor: providermode.cuurrenttheme == ThemeMode.light?Color.fromRGBO(223, 236, 219, 1.0):Color.fromRGBO(6, 14, 30, 1.0),
      body: Stack(
        children: [
          Container(
            height: hight*0.3,
            child: AppBar(

              title: Text('todolist'.tr()),
              flexibleSpace: SizedBox(height: hight*0.1,),
              toolbarHeight: hight*0.15,
              iconTheme: IconThemeData(
                  color: providermode.cuurrenttheme == ThemeMode.light?Colors.white:Colors.black),
            ),
          ),
          Container(
            padding:EdgeInsetsDirectional.all(30),
            margin: EdgeInsets.fromLTRB(30, 170, 30, 10),
            decoration: BoxDecoration(
              color: providermode.cuurrenttheme == ThemeMode.light?Colors.white:Color.fromRGBO(20, 25, 34, 1.0),
              borderRadius: BorderRadius.circular(20),
            ),

            child: Form(
              key: formkey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Text('edittask'.tr(),
                          style:TextStyle(
                            color: providermode.cuurrenttheme == ThemeMode.light?Colors.black:Colors.white,
                            fontSize: 22,
                          ),),
                    ),
                    SizedBox(height: hight*0.060),
                    UpdateTextFaild(controller:titlecontroler ,
                        labl: 'title'.tr(),
                        hint:"edittitle".tr() ,
                        type: TextInputType.text,
                      change: (value){
                      todo.title = value;
                      },
                      validate: (value){
                        if(value!.isEmpty){
                          return "emptytitle".tr();
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: hight*0.025),
                    UpdateTextFaild(controller:descriptionecontroler ,
                      labl: 'description'.tr(),
                        hint:"editdesc".tr() ,
                        type: TextInputType.multiline,
                      change: (value){
                      todo.description = value;
                      },
                      validate: (value){
                      if(value!.isEmpty){
                        return "emptydesc".tr();
                      }
                      return null;
                      },
                    ),
                    SizedBox(height: hight*0.06),
                    Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Text('selectdate'.tr(),textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                      ),),
                    ),

                    SizedBox(height: hight*0.02),

                    InkWell(
                      onTap: (){
                        showdatepicker(todo);
                      },
                        child: Text("${todo.time.day}-${todo.time.month}-${todo.time.year}",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 22,
                        ),),
                    ),

                    SizedBox(height: hight*0.12),

                    ElevatedButton(onPressed: (){
                      if(formkey.currentState!.validate()){
                        provider.updatetodo(todo);
                        Navigator.pop(context);
                      }
                    },
                        child: Text('Save Changes',style: TextStyle(
                          fontSize: 18,
                        ),),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.fromLTRB(35,15,35,15),
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
