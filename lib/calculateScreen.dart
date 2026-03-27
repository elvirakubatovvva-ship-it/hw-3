import 'package:flutter/material.dart';

class CalculateScreen extends StatefulWidget {
  const CalculateScreen({super.key});

  @override
  State<CalculateScreen> createState() => _CalculateScreenState();
}

class _CalculateScreenState extends State<CalculateScreen> {
  final TextEditingController _num1Controller = TextEditingController();
  final TextEditingController _num2Controller = TextEditingController();
  String _result = "Результат";

  void _calculate(String operator) {
    // Пробуем преобразовать текст в числа
    double? n1 = double.tryParse(_num1Controller.text);
    double? n2 = double.tryParse(_num2Controller.text);

    if (n1 == null || n2 == null) {
      setState(() => _result = "Введите числа!");
      return;
    }

    double res = 0;

    switch (operator) {
      case '+': res = n1 + n2; break;
      case '-': res = n1 - n2; break;
      case '*': res = n1 * n2; break; 
      case '/': 
                                                             // Логика деления с проверкой на НОЛЬ
        if (n2 == 0) {
          setState(() => _result = "Ошибка: деление на 0!");
          return;
        }
        res = n1 / n2; 
        break;
    }

    setState(() {
     
      _result = res % 1 == 0 ? res.toInt().toString() : res.toStringAsFixed(2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Калькулятор')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _num1Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Число 1'),
            ),
            TextField(
              controller: _num2Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Число 2'),
            ),
            const SizedBox(height: 30),
            Text(_result, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildOpButton('+'),
                _buildOpButton('-'),
                _buildOpButton('*'),
                _buildOpButton('/'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOpButton(String op) {
    return ElevatedButton(
      onPressed: () => _calculate(op),
      child: Text(op, style: const TextStyle(fontSize: 20)),
    );
  }
}