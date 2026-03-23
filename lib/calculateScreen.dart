import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final TextEditingController firstController = TextEditingController();
  final TextEditingController secondController = TextEditingController();
  double result = 0;

  double get firstValue => double.tryParse(firstController.text) ?? 0;
  double get secondValue => double.tryParse(secondController.text) ?? 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Мини-калькулятор"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: firstController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Первое число",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: secondController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Второе число",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => setState(() => result = firstValue + secondValue),
                  child: const Text("+", style: TextStyle(fontSize: 24)),
                ),
                ElevatedButton(
                  onPressed: () => setState(() => result = firstValue - secondValue),
                  child: const Text("−", style: TextStyle(fontSize: 24)),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                  onPressed: () {
                    setState(() {
                      firstController.clear();
                      secondController.clear();
                      result = 0;
                    });
                  },
                  child: const Text("Сброс"),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Text(
              "Результат: $result",
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    firstController.dispose();
    secondController.dispose();
    super.dispose();
  }
}