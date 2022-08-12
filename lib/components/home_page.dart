import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workshop_lab_2022/components/button_editor.dart';
import 'package:workshop_lab_2022/components/detail.dart';
import 'package:workshop_lab_2022/components/page_editor.dart';
import 'package:workshop_lab_2022/components/todo_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: Consumer<TodoProvider>(
        builder: ((
          context,
          value,
          child,
        ) {
          return ListView(
            padding: const EdgeInsets.all(20.0),
            children: value.todo_data.isNotEmpty
                ? value.todo_data.map(
                    (e) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Detail(
                                todo: e,
                              ),
                            ),
                          );
                        },
                        child: Card(
                          child: ListTile(
                            leading: Checkbox(
                              value: e.isDone,
                              onChanged: (bool? value) {
                                Provider.of<TodoProvider>(context,
                                        listen: false)
                                    .markasDone(e);
                              },
                            ),
                            title: Text(e.todo_title),
                            subtitle: Text(e.todo_description),
                            trailing: Wrap(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return PageEditor(
                                            todo: e,
                                          );
                                        },
                                      ),
                                    );
                                  },
                                  icon: Icon(Icons.edit),
                                ),
                                IconButton(
                                  onPressed: () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text('Are you sure?'),
                                        action: SnackBarAction(
                                          label: 'Yes!',
                                          onPressed: () {
                                            Provider.of<TodoProvider>(
                                                    context,
                                                    listen: false)
                                                .removeTodo(e);
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                  icon: Icon(Icons.delete),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ).toList()
                : [
                    Center(
                      child: Text('List empty!'),
                    )
                  ],
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return PageEditor(
                isEditMode: false,
              );
            },
          ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
