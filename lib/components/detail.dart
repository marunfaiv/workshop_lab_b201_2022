import 'package:flutter/material.dart';
import 'package:workshop_lab_2022/components/button_editor.dart';

class Detail extends StatelessWidget {
  const Detail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Todo Details',
        ),
        actions: [
          const ButtonEditor(),
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
              'Todo Title',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'This is some todo details that you supposesdd to write right now',
              style: TextStyle(
                fontSize: 15,
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
