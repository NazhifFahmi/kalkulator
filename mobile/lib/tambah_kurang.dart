import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

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
    String num1Text = num1Controller.text
        .replaceAll('.', '')
        .replaceAll(',', '.');
    String num2Text = num2Controller.text
        .replaceAll('.', '')
        .replaceAll(',', '.');

    double? num1 = double.tryParse(num1Text);
    double? num2 = double.tryParse(num2Text);

    setState(() {
      if (num1 == null || num2 == null) {
        result = '⚠️ Masukkan angka yang valid!';
      } else {
        double calculationResult = isAddition ? num1 + num2 : num1 - num2;
        result =
            'Hasil: ${NumberFormat('#,##0.###', 'id_ID').format(calculationResult)}';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Penjumlahan & Pengurangan'),
        backgroundColor: Color(0xFF56021F),
        foregroundColor: Colors.white,
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
                color: Color(0xFF56021F),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: num1Controller,
              keyboardType: TextInputType.number,
              inputFormatters: [ThousandsSeparatorInputFormatter()],
              decoration: InputDecoration(
                labelText: 'Angka 1',
                floatingLabelBehavior: FloatingLabelBehavior.never,
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.looks_one, color: Color(0xFF56021F)),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: num2Controller,
              keyboardType: TextInputType.number,
              inputFormatters: [ThousandsSeparatorInputFormatter()],
              decoration: InputDecoration(
                labelText: 'Angka 2',
                floatingLabelBehavior: FloatingLabelBehavior.never,
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.looks_one, color: Color(0xFF56021F)),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () => calculate(true),
                  icon: Icon(Icons.add, color: Colors.white),
                  label: Text('Tambah'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF56021F), // Warna tombol
                    foregroundColor: Colors.white,
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () => calculate(false),
                  icon: Icon(Icons.remove, color: Colors.white),
                  label: Text('Kurang'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF56021F), // Warna tombol
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
                        color: Color(0xFF56021F), // Warna teks
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

class ThousandsSeparatorInputFormatter extends TextInputFormatter {
  final NumberFormat _formatter = NumberFormat.decimalPattern('id_ID');

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    }

    final int selectionIndexFromTheRight =
        newValue.text.length - newValue.selection.end;
    final String newString = _formatter.format(
      int.parse(newValue.text.replaceAll('.', '')),
    );
    return TextEditingValue(
      text: newString,
      selection: TextSelection.collapsed(
        offset: newString.length - selectionIndexFromTheRight,
      ),
    );
  }
}
