import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'inputFormatter.dart';

class CountDigitsPage extends StatefulWidget {
  const CountDigitsPage({super.key});

  @override
  _CountDigitsPageState createState() => _CountDigitsPageState();
}

class _CountDigitsPageState extends State<CountDigitsPage> {
  final TextEditingController numberController = TextEditingController();
  String digitCountMessage = '';

  void countDigits() {
    String input = numberController.text;
    setState(() {
      input = input.replaceAll(',', '').replaceAll('.', '');
      if (input.isNotEmpty && int.tryParse(input) != null) {
        digitCountMessage =
            'Jumlah digit: ${NumberFormat.decimalPattern('en_US').format(input.length)} 🔢';
      } else {
        digitCountMessage = '⚠️ Masukkan angka yang valid!';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hitung Jumlah Digit'),
        backgroundColor: Color(0xFF56021F), // Warna app bar
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
              controller: numberController,
              keyboardType: TextInputType.number,
              inputFormatters: [ThousandsSeparatorInputFormatter()],
              decoration: InputDecoration(
                labelText: 'Masukkan Angka',
                labelStyle: TextStyle(color: Color(0xFF56021F)),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                border: OutlineInputBorder(),
                prefixIcon: Icon(
                  Icons.format_list_numbered,
                  color: Color(0xFF56021F),
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton.icon(
                onPressed: countDigits,
                icon: Icon(Icons.calculate, color: Colors.white),
                label: Text('Hitung Digit'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF56021F), // Warna tombol
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                ),
              ),
            ),
            SizedBox(height: 20),
            if (digitCountMessage.isNotEmpty)
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
                      digitCountMessage,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
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
