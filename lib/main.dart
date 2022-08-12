import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workshop_lab_2022/components/home_page.dart';
import 'package:workshop_lab_2022/components/page_editor.dart';
import 'package:workshop_lab_2022/components/todo_provider.dart';
import 'package:workshop_lab_2022/components/button_editor.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) {
            return TodoProvider();
          },
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          "/": (context) => HomePage(),
          "/add_edit": (context) => PageEditor(),
        },
        initialRoute: "/",
      ),
    );
  }
}
