import 'package:flutter/material.dart';

class MathOperationsPage extends StatefulWidget {
  const MathOperationsPage({super.key});

  @override
  _MathOperationsPageState createState() => _MathOperationsPageState();
}

class _MathOperationsPageState extends State<MathOperationsPage> {
  final TextEditingController num1Controller = TextEditingController();
  final TextEditingController num2Controller = TextEditingController();
  String result = '';

  void calculate(bool isAddition) {
    String num1Text = num1Controller.text.replaceAll(',', '.');
    String num2Text = num2Controller.text.replaceAll(',', '.');
    double? num1 = double.tryParse(num1Text);
    double? num2 = double.tryParse(num2Text);

    if (num1 == null || num2 == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Masukkan angka yang valid!'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    setState(() {
      result = isAddition ? 'Hasil: ${num1 + num2}' : 'Hasil: ${num1 - num2}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Penjumlahan & Pengurangan'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Masukkan Angka:",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: num1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Angka 1',
                floatingLabelBehavior: FloatingLabelBehavior.never,
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.looks_one),
                filled: true,
                fillColor: Color(0xFFFFC0EB),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: num2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Angka 2',
                floatingLabelBehavior: FloatingLabelBehavior.never,
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.looks_two),
                filled: true,
                fillColor: Color(0xFFFFC0EB),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () => calculate(true),
                  icon: Icon(Icons.add),
                  label: Text('Tambah'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () => calculate(false),
                  icon: Icon(Icons.remove),
                  label: Text('Kurang'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            if (result.isNotEmpty)
              Card(
                color: Color(0xFFFFC0EB),
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Center(
                    child: Text(
                      result,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF410038),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
