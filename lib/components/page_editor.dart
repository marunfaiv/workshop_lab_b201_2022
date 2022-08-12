import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import 'package:workshop_lab_2022/components/models.dart';
import 'package:workshop_lab_2022/components/todo_provider.dart';

class PageEditor extends StatelessWidget {
  final bool isEditMode;
  final TodoModel? todo;
  PageEditor({
    Key? key,
    this.isEditMode = true,
    this.todo,
  }) : super(key: key);

  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (isEditMode) {
      controller1.text = todo!.todo_title;
      controller2.text = todo!.todo_description;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          (isEditMode) ? 'Edit Todo' : 'Add Todo',
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              onChanged: (value) {},
              controller: controller1,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Title',
                  hintText: "Todo Title"),
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 28,
            ),
            Container(
              height: 156,
              child: TextField(
                onChanged: (value) {},
                controller: controller2,
                maxLines: 10,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Detail',
                  hintText: "Description of your Todo",
                  isDense: true,
                ),
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              height: 128,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (controller1.text.isEmpty || controller2.text.isEmpty) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Error'),
                          content: const SizedBox(
                            child: Text(
                              'Masih ada yang kosong',
                              textAlign: TextAlign.left,
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    if (!isEditMode) {
                      const uuid = Uuid();
                      Provider.of<TodoProvider>(context, listen: false)
                          .addTodo(
                        TodoModel(
                          todo_id: uuid.v4(),
                          todo_title: controller1.text,
                          todo_description: controller2.text,
                        ),
                      );
                    } else if (isEditMode) {
                      Provider.of<TodoProvider>(context, listen: false)
                          .updateTodo(
                        TodoModel(
                          todo_id: todo!.todo_id,
                          todo_title: controller1.text,
                          todo_description: controller2.text,
                        ),
                      );
                    }
                    Navigator.popUntil(
                      context,
                      ModalRoute.withName("/"),
                    );
                  }
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 28,
                    vertical: 8,
                  ),
                  child: Text('SUBMIT'),
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
