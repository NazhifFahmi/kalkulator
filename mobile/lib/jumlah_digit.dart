import 'package:flutter/material.dart';

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
      if (input.isNotEmpty && int.tryParse(input) != null) {
        digitCountMessage = 'Jumlah digit: ${input.length} 🔢';
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
        backgroundColor: Colors.orange,
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
              controller: numberController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Masukkan Angka',
                floatingLabelBehavior: FloatingLabelBehavior.never,
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.format_list_numbered),
                filled: true,
                fillColor: Color(0xFFFFC0EB),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton.icon(
                onPressed: countDigits,
                icon: Icon(Icons.calculate),
                label: Text('Hitung Digit'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
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
