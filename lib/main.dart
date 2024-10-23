import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  // Manage the result
  int result = 0;

  // Controllers for input fields
  TextEditingController firstNumController = TextEditingController();
  TextEditingController secondNumController = TextEditingController();

  // Method to calculate addition
  void calculateSum() {
    int firstNum = int.tryParse(firstNumController.text) ?? 0;
    int secondNum = int.tryParse(secondNumController.text) ?? 0;
    setState(() {
      result = firstNum + secondNum;
    });
  }

  // Method to calculate subtraction
  void calculateSubtraction() {
    int firstNum = int.tryParse(firstNumController.text) ?? 0;
    int secondNum = int.tryParse(secondNumController.text) ?? 0;
    setState(() {
      result = firstNum - secondNum;
    });
  }

  // Method to calculate multiplication
  void calculateMultiplication() {
    int firstNum = int.tryParse(firstNumController.text) ?? 0;
    int secondNum = int.tryParse(secondNumController.text) ?? 0;
    setState(() {
      result = firstNum * secondNum;
    });
  }

  // Method to calculate division
  void calculateDivision() {
    int firstNum = int.tryParse(firstNumController.text) ?? 0;
    int secondNum = int.tryParse(secondNumController.text) ?? 1; // Avoid division by zero
    setState(() {
      result = (secondNum != 0) ? firstNum ~/ secondNum : 0; // Integer division
    });
  }

  // Method to clear inputs and reset result
  void clearInputs() {
    setState(() {
      firstNumController.clear();
      secondNumController.clear();
      result = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Unit 5 Calculator"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Addition Row
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: firstNumController,
                    decoration: const InputDecoration(labelText: "First Number"),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 10),
                const Text(" + "),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: secondNumController,
                    decoration: const InputDecoration(labelText: "Second Number"),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 10),
                IconButton(
                  icon: const Icon(Icons.add_circle_outline),
                  iconSize: 40.0,
                  onPressed: calculateSum, // Call the method to calculate sum
                  tooltip: 'Add',
                ),
              ],
            ),
            const SizedBox(height: 8), // Small vertical spacing

            // Subtraction Row
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: firstNumController,
                    decoration: const InputDecoration(labelText: "First Number"),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 10),
                const Text(" - "),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: secondNumController,
                    decoration: const InputDecoration(labelText: "Second Number"),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 10),
                IconButton(
                  icon: const Icon(Icons.remove_circle_outline),
                  iconSize: 40.0,
                  onPressed: calculateSubtraction, // Call the method to calculate subtraction
                  tooltip: 'Subtract',
                ),
              ],
            ),
            const SizedBox(height: 8), // Small vertical spacing

            // Multiplication Row
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: firstNumController,
                    decoration: const InputDecoration(labelText: "First Number"),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 10),
                const Text(" × "),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: secondNumController,
                    decoration: const InputDecoration(labelText: "Second Number"),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 10),
                IconButton(
                  icon: const Icon(Icons.clear),
                  iconSize: 40.0,
                  onPressed: calculateMultiplication, // Call the method to calculate multiplication
                  tooltip: 'Multiply',
                ),
              ],
            ),
            const SizedBox(height: 8), // Small vertical spacing

            // Division Row
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: firstNumController,
                    decoration: const InputDecoration(labelText: "First Number"),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 10),
                const Text(" ÷ "),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: secondNumController,
                    decoration: const InputDecoration(labelText: "Second Number"),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 10),
                IconButton(
                  icon: const Icon(Icons.horizontal_split),
                  iconSize: 40.0,
                  onPressed: calculateDivision, // Call the method to calculate division
                  tooltip: 'Divide',
                ),
              ],
            ),
            const SizedBox(height: 16), // Small vertical spacing before buttons

            // Result and Clear Button
            Text(
              'Result: $result',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 16), // Slightly larger spacing before the clear button
            ElevatedButton(
              onPressed: clearInputs, // Call the method to clear inputs
              child: const Text('Clear'),
            ),
          ],
        ),
      ),
    );
  }
}
