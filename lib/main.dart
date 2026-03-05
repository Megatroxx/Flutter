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
          children: <Widget>[
            const Text(
              'ФИО: Бакальская Софья Юрьевна',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.red,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Номер группы: ИКБО-06-22',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            const Text(
              'Номер студенческого билета: 22И1580',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: null,
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.blue),
                foregroundColor: WidgetStatePropertyAll(Colors.white),
                elevation: WidgetStatePropertyAll(8),
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              child: const Text('Текст на кнопке'),
            ),
          ],
        ),
      ),
    );
  }
}