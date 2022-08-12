import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workshop_lab_2022/components/button_editor.dart';
import 'package:workshop_lab_2022/components/models.dart';
import 'package:workshop_lab_2022/components/page_editor.dart';
import 'package:workshop_lab_2022/components/todo_provider.dart';

class Detail extends StatelessWidget {
  TodoModel? todo;
  Detail({Key? key, this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Todo Details',
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return PageEditor(todo: todo);
                  },
                ),
              );
            },
            icon: Icon(Icons.edit),
          ),
          const SizedBox(width: 10),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.delete),
          )
        ],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              todo!.todo_title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              todo!.todo_description,
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            SizedBox(
              height: 128,
            ),
            Center(
              child: ElevatedButton(
                onPressed: (todo!.isDone)
                    ? null
                    : () {
                        Provider.of<TodoProvider>(context, listen: false)
                            .markasDone(todo!);
                        Navigator.pop(context);
                      },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 28,
                    vertical: 8,
                  ),
                  child: Text('MARK AS DONE'),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xff4276FC),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  elevation: 0,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
