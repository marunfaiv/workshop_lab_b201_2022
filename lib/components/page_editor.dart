import 'package:flutter/material.dart';

class PageEditor extends StatefulWidget {
  const PageEditor({Key? key}) : super(key: key);

  @override
  State<PageEditor> createState() => _PageEditorState();
}

class _PageEditorState extends State<PageEditor> {
  TextEditingController _ctrl_title = TextEditingController(text: 'Todo Title');
  TextEditingController _ctrl_description =
      TextEditingController(text: 'Details of what you’re supposed to do');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Todo',
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {},
          ),
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
            TextField(
              onChanged: (value) {},
              controller: _ctrl_title,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Title',
              ),
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
                controller: _ctrl_description,
                maxLines: 10,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Detail',
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
                onPressed: () {},
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
