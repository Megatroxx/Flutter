import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Practice',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Данные студента'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'ФИО: Бакальская Софья Юрьевна',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 12),
            Text(
              'Номер группы: ИКБО-06-22',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 12),
            Text(
              'Номер студенческого билета: 22И1580',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}