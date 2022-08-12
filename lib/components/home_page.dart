import 'package:flutter/material.dart';
import 'package:workshop_lab_2022/components/button_editor.dart';
import 'package:workshop_lab_2022/components/detail.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> todos = [];
  bool _isChecked = false;
  void _addCardWidget() {
    setState(() {
      todos.add(
        card(),
      );
    });
  }

  Widget card() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Detail()),
        );
      },
      child: Container(
        child: Column(
          children: [
            Row(
              children: [
                Checkbox(
                  value: _isChecked,
                  onChanged: (bool? value) {
                    setState(
                      () {
                        _isChecked = value!;
                      },
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Judul',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        'subjudul yg akan diisi oleh deskripsi',
                        style: TextStyle(
                          fontWeight: FontWeight.w100,
                          color: Color(0xff808080),
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Row(
                  children: [
                    const ButtonEditor(),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        setState(() {
                          todos.removeLast();
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
            Divider(
              color: Colors.black,
              thickness: 1,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Todo List'),
        ),
        body: Center(
          child: ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) => todos[index],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _addCardWidget,
          tooltip: 'Tambah list',
          child: const Icon(
            Icons.add,
          ),
        ),
      ),
    );
  }
}
