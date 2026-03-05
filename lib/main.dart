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
      home: const MyHomePage(title: 'Счетчик'),
    );
  }
}

class StudentInfo extends StatelessWidget {
  final String fullName;
  final String group;
  final String studentId;

  final Color backgroundColor;
  final Color textColor;
  final double fontSize;
  final double borderRadius;
  final double rightMargin;

  const StudentInfo({
    super.key,
    required this.fullName,
    required this.group,
    required this.studentId,
    this.backgroundColor = Colors.white,
    this.textColor = Colors.blue,
    this.fontSize = 20.0,
    this.borderRadius = 20.0,
    this.rightMargin = 100.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: rightMargin),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Text(
        'ФИО: $fullName\n\n'
            'Номер группы: $group\n\n'
            'Номер студенческого билета: $studentId',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: textColor,
          fontSize: fontSize,
        ),
      ),
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
        child: SimpleCounter()
      ),
    );
  }
}

class SimpleCounter extends StatefulWidget {
  const SimpleCounter({super.key});

  @override
  State<SimpleCounter> createState() => _SimpleCounterState();
}

class _SimpleCounterState extends State<SimpleCounter> {

  int _count = 0;

  void _increment() {
    setState(() {
      _count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Количество нажатий: $_count',
          style: const TextStyle(fontSize: 20),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: _increment,
          child: const Text('Нажми меня'),
        ),
      ],
    );
  }
}