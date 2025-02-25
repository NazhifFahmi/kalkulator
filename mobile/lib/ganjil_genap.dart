import 'package:flutter/material.dart';

class OddEvenInputPage extends StatefulWidget {
  const OddEvenInputPage({super.key});

  @override
  _OddEvenInputPageState createState() => _OddEvenInputPageState();
}

class _OddEvenInputPageState extends State<OddEvenInputPage> {
  final TextEditingController numberController = TextEditingController();
  String message = '';

  void checkOddEven() {
    int? num = int.tryParse(numberController.text);
    setState(() {
      if (num != null) {
        message =
            num % 2 == 0
                ? 'Bilangan $num adalah **Genap** ✅'
                : 'Bilangan $num adalah **Ganjil** 🔴';
      } else {
        message = '⚠️ Masukkan angka yang valid!';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cek Bilangan Ganjil / Genap'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Masukkan Bilangan:",
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
                prefixIcon: Icon(Icons.numbers),
                filled: true,
                fillColor: Color(0xFFFFC0EB),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton.icon(
                onPressed: checkOddEven,
                icon: Icon(Icons.check),
                label: Text('Cek Bilangan'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                ),
              ),
            ),
            SizedBox(height: 20),
            if (message.isNotEmpty)
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
                      message,
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
