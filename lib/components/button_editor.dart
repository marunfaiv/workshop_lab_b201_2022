import 'package:flutter/material.dart';
import 'package:workshop_lab_2022/components/page_editor.dart';

class ButtonEditor extends StatelessWidget {
  const ButtonEditor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.edit),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PageEditor(),
          ),
        );
      },
    );
  }
}
