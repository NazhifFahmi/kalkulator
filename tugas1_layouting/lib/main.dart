import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dart Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void login() {
    if (usernameController.text == 'admin' &&
        passwordController.text == '1234') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Username atau password salah!'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 5,
          margin: EdgeInsets.symmetric(horizontal: 24),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Login',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 12),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: login,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home'), backgroundColor: Colors.blueAccent),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 4,
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Daftar Anggota:',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                      ),
                    ),
                    SizedBox(height: 8),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.person, color: Colors.blue),
                      title: Text('Seftian Alung Qiu Prakoso'),
                      subtitle: Text('123220112'),
                    ),
                    ListTile(
                      leading: Icon(Icons.person, color: Colors.blue),
                      title: Text('Nazhif Alaudin Fahmi'),
                      subtitle: Text('123220063'),
                    ),
                    ListTile(
                      leading: Icon(Icons.person, color: Colors.blue),
                      title: Text('Taufika Retno'),
                      subtitle: Text('123220196'),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                ElevatedButton.icon(
                  onPressed:
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MathOperationsPage(),
                        ),
                      ),
                  icon: Icon(Icons.calculate),
                  label: Text('Penjumlahan & Pengurangan'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed:
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OddEvenInputPage(),
                        ),
                      ),
                  icon: Icon(Icons.numbers),
                  label: Text('Cek Ganjil/Genap'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed:
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CountDigitsPage(),
                        ),
                      ),
                  icon: Icon(Icons.format_list_numbered),
                  label: Text('Hitung Jumlah Digit'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

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
    numberController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hitung Jumlah Digit'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Masukkan Angka:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            TextField(
              controller: numberController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Masukkan Angka',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.format_list_numbered),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton.icon(
                onPressed: countDigits,
                icon: Icon(Icons.calculate),
                label: Text('Hitung Digit'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                ),
              ),
            ),
            SizedBox(height: 20),
            if (digitCountMessage.isNotEmpty)
              Card(
                color: Colors.green.shade50,
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
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            TextField(
              controller: num1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Angka 1',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.looks_one),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: num2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Angka 2',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.looks_two),
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
                color: Colors.blue.shade50,
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
                        color: Colors.blueAccent,
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
    numberController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cek Bilangan Ganjil / Genap'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Masukkan Bilangan:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            TextField(
              controller: numberController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Masukkan Angka',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.numbers),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton.icon(
                onPressed: checkOddEven,
                icon: Icon(Icons.check),
                label: Text('Cek Bilangan'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                ),
              ),
            ),
            SizedBox(height: 20),
            if (message.isNotEmpty)
              Card(
                color: Colors.blue.shade50,
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
