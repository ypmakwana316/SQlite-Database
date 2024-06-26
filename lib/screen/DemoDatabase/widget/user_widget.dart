import 'package:flutter/material.dart';

import '../../../common/style/custom_text_style.dart';
import '../user_table_model.dart';

class NoteWidget extends StatelessWidget {
  final UserTable note;
  final VoidCallback onTap;
  final VoidCallback onLongPress;

  const NoteWidget({
    Key? key,
    required this.note, required this.onLongPress, required this.onTap
  }) : super (key : key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: onTap,
      onLongPress: onLongPress,
      child:  Padding(padding: const EdgeInsets.symmetric(vertical: 6,horizontal: 24),
          child: Card(
            elevation: 2,
            child:Padding(padding: const EdgeInsets.symmetric(horizontal: 20 ,vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                    child: Text(note.title,style:CustomTextStyle.getTitleStyle(),)),
                const Padding(padding: EdgeInsets.symmetric(vertical: 6 ,horizontal: 12),
                  child: Divider(
                    thickness: 1,
                  ) ,),
                Text(note.description,style:CustomTextStyle.getTitleStyle(),)
              ],
            )),
          )),
    );
  }

}