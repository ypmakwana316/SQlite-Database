import 'package:flutter/material.dart';
import 'package:sqlite_database/screen/DemoDatabase/database_helper.dart';
import '../../common/style/custom_text_style.dart';
import 'user_table_model.dart';

class UserScreen extends StatelessWidget {
  final UserTable? userTable;

  const UserScreen({super.key,  this.userTable});

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final descriptionController = TextEditingController();

    if (userTable != null) {
      titleController.text = userTable!.title;
      descriptionController.text = userTable!.description;
    }

    return Scaffold(
      appBar: AppBar(
          title: Text(userTable == null ? "Add User" : "Edit User"),
          centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 40.0),
              child: Center(
                  child: Text(
                'What are you thinking now',
                style: CustomTextStyle.getTitleStyle(),
              )),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 40.0),
              child: TextFormField(
                controller: titleController,
                maxLines: 1,
                decoration: const InputDecoration(
                    hintText: "Title",
                    labelText: "User Title",
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.white, width: 0.75),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 40.0),
              child: TextFormField(
                controller: descriptionController,
                maxLines: 5,
                keyboardType: TextInputType.multiline,
                onChanged: (value) {},
                decoration: const InputDecoration(
                    hintText: "Type here note",
                    labelText: "User Desrciption",
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.white, width: 0.75),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ))),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: SizedBox(
                height: 45,
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                    onPressed: () async{
                      final title = titleController.value.text;
                      final description = descriptionController.value.text;

                      if (title.isEmpty || description.isEmpty) {
                        return;
                      }

                      final UserTable data = UserTable(title:title ,description:description,id:userTable!.id );
                      if(data != null){
                        await DataBaseHelper.addNote(data);
                      }
                      else{
                        await DataBaseHelper.updateNote(data);
                      }

                      Navigator.pop(context);
                    },
                    child:
                        Text(userTable == null ?"Save" : "Edit", style: CustomTextStyle.getTitleStyle())),
              ),
            )
          ],
        ),
      ),
    );
  }
}
