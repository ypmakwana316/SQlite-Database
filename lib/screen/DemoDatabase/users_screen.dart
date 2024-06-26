import 'package:flutter/material.dart';
import 'package:sqlite_database/screen/DemoDatabase/widget/user_widget.dart';
import '../../common/style/custom_text_style.dart';
import 'database_helper.dart';
import 'user_table_model.dart';
import 'user_screen.dart';

class usersScreen extends StatefulWidget {
  const usersScreen({super.key});

  @override
  State<usersScreen> createState() => _usersScreenState();
}

class _usersScreenState extends State<usersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Table")),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => const UserScreen()));
        setState(() {
        });
      },child: const Icon(Icons.add)),
      body: FutureBuilder<List<UserTable>?>(
          future: DataBaseHelper.getAllNote(),
          builder: (context, AsyncSnapshot<List<UserTable>?> snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting){
              return const CircularProgressIndicator();
            }
            else if(snapshot.hasError){
              return Center(child: Text(snapshot.hasError.toString(),style: CustomTextStyle.getTitleStyle(),));
            }
            else if(snapshot.hasData){
              if(snapshot.data != null){
                return ListView.builder(
                  itemBuilder: (context, index) => NoteWidget(
                    note: snapshot.data![index],
                    onLongPress: () async {
                      showDialog(context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text("Are you sure want to delet this user?"),
                              actions: [
                                ElevatedButton(onPressed: () async{
                                  await DataBaseHelper.deletNote(snapshot.data![index]);
                                  Navigator.pop(context);
                                  setState(() {

                                  });
                                }, child: const Text('Yes')),
                                ElevatedButton(onPressed: () => Navigator.pop(context), child: const Text('No'))
                              ],
                            );
                          },);
                    },
                    onTap: () async{
                       Navigator.push(context, MaterialPageRoute(builder: (context) => UserScreen(userTable: snapshot.data![index]),));
                       setState(() {

                       });
                    },),
                itemCount: snapshot.data!.length);
              }
             return const Center(
               child: Text("yet this note"),
             );
            }
            return const SizedBox.shrink();
          },),
    );
  }
}
