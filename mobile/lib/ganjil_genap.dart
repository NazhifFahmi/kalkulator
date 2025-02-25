import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'inputFormatter.dart';

class OddEvenInputPage extends StatefulWidget {
  const OddEvenInputPage({super.key});

  @override
  _OddEvenInputPageState createState() => _OddEvenInputPageState();
}

class _OddEvenInputPageState extends State<OddEvenInputPage> {
  final TextEditingController numberController = TextEditingController();
  String message = '';

  void checkOddEven() {
    String number = numberController.text.replaceAll('.', '');
    int? num = int.tryParse(number);
    setState(() {
      if (num != null) {
        message =
            num % 2 == 0
                ? 'Bilangan $num adalah GENAP'
                : 'Bilangan $num adalah GANJIL';
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
        backgroundColor: Color(0xFF56021F), // Warna app bar
        foregroundColor: Colors.white,
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
                floatingLabelBehavior: FloatingLabelBehavior.never,
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.numbers, color: Color(0xFF56021F)),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton.icon(
                onPressed: checkOddEven,
                icon: Icon(Icons.check, color: Colors.white),
                label: Text('Cek Bilangan'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF56021F), // Warna tombol
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
                        color: Color(0xFF56021F),
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
