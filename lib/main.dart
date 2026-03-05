import 'package:flutter/material.dart';
import 'package:flutter_practice/widget/bottom_nav_buttons.dart';

import 'pages/step_city.dart';
import 'pages/step_format.dart';
import 'pages/step_fulltime.dart';
import 'pages/step_professions.dart';
import 'pages/step_subscription.dart';
import 'pages/step_summary.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vacancy Wizard',
      theme: ThemeData(useMaterial3: true),
      home: const VacancyWizardPage(),
    );
  }
}

enum WorkFormat { office, hybrid, remote }

class VacancyWizardPage extends StatefulWidget {
  const VacancyWizardPage({super.key});

  @override
  State<VacancyWizardPage> createState() => _VacancyWizardPageState();
}

class _VacancyWizardPageState extends State<VacancyWizardPage> {
  int _pageIndex = 0;

  final _professionController = TextEditingController();
  final _cityController = TextEditingController();

  bool? _fullTime; // null пока не выбрал(а)
  WorkFormat? _format;
  bool? _subscription;

  @override
  void dispose() {
    _professionController.dispose();
    _cityController.dispose();
    super.dispose();
  }

  String _titleByIndex(int index) {
    switch (index) {
      case 0:
        return 'Шаг 1/6 — Профессия';
      case 1:
        return 'Шаг 2/6 — Город';
      case 2:
        return 'Шаг 3/6 — Полный день';
      case 3:
        return 'Шаг 4/6 — Формат работы';
      case 4:
        return 'Шаг 5/6 — Подписка';
      case 5:
        return 'Шаг 6/6 — Итог';
      default:
        return 'Vacancy Wizard';
    }
  }

  bool get _canGoNext {
    switch (_pageIndex) {
      case 0:
        return _professionController.text.trim().isNotEmpty;
      case 1:
        return _cityController.text.trim().isNotEmpty;
      case 2:
        return _fullTime != null;
      case 3:
        return _format != null;
      case 4:
        return _subscription != null;
      case 5:
        return true;
      default:
        return false;
    }
  }

  void _goNext() {
    if (_pageIndex >= 5) return;
    if (!_canGoNext) return;

    setState(() {
      _pageIndex++;
    });
  }

  void _goBack() {
    if (_pageIndex <= 0) return;
    setState(() {
      _pageIndex--;
    });
  }

  void _reset() {
    setState(() {
      _pageIndex = 0;
      _professionController.clear();
      _cityController.clear();
      _fullTime = null;
      _format = null;
      _subscription = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final pages = <Widget>[
      StepProfession(
        controller: _professionController,
        onChanged: () => setState(() {}),
      ),
      StepCity(
        controller: _cityController,
        onChanged: () => setState(() {}),
      ),
      StepFullTime(
        value: _fullTime,
        onChanged: (v) => setState(() => _fullTime = v),
      ),
      StepFormat(
        value: _format,
        onChanged: (v) => setState(() => _format = v),
      ),
      StepSubscription(
        value: _subscription,
        onChanged: (v) => setState(() => _subscription = v),
      ),
      StepSummary(
        profession: _professionController.text.trim(),
        city: _cityController.text.trim(),
        fullTime: _fullTime,
        format: _format,
        subscription: _subscription,
        onRestart: _reset,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(_titleByIndex(_pageIndex)),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                child: Padding(
                  key: ValueKey(_pageIndex),
                  padding: const EdgeInsets.all(16),
                  child: pages[_pageIndex],
                ),
              ),
            ),

            BottomNavButtons(
              canGoBack: _pageIndex > 0,
              canGoNext: _canGoNext && _pageIndex < 5,
              isLast: _pageIndex == 5,
              onBack: _goBack,
              onNext: _goNext,
              onFinish: _reset,
            ),
          ],
        ),
      ),
    );
  }
}