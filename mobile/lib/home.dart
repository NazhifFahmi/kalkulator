import 'package:flutter/material.dart';
import 'tambah_kurang.dart';
import 'ganjil_genap.dart';
import 'jumlah_digit.dart';
import 'login.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Color(0xFF56021F),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            tooltip: 'Logout',
            onPressed: () {
              _showLogoutConfirmationDialog(context);
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFFFDFEF), Color(0xFF56021F).withOpacity(0.5)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          Positioned(
            top: -100,
            left: -100,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF4B164C).withOpacity(0.2), // Warna lingkaran
              ),
            ),
          ),
          Positioned(
            top: 100,
            right: -100,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF4B164C).withOpacity(0.2), // Warna lingkaran
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 4,
                  color: Color(0xFFFFC0EB),
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
                            color: Color(0xFF56021F),
                          ),
                        ),
                        SizedBox(height: 8),
                        Divider(),
                        ListTile(
                          leading: Icon(Icons.person, color: Color(0xFF56021F)),
                          title: Text('Seftian Alung Qiu Prakoso'),
                          subtitle: Text('123220112'),
                        ),
                        ListTile(
                          leading: Icon(Icons.person, color: Color(0xFF56021F)),
                          title: Text('Nazhif Alaudin Fahmi'),
                          subtitle: Text('123220063'),
                        ),
                        ListTile(
                          leading: Icon(Icons.person, color: Color(0xFF56021F)),
                          title: Text('Taufika Retno Wulan'),
                          subtitle: Text('123220196'),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Expanded(
                  child: ListView(
                    children: [
                      _buildMenuButton(
                        context,
                        icon: Icons.calculate,
                        label: 'Penjumlahan & Pengurangan',
                        color: Color(0xFF56021F),
                        onPressed:
                            () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MathOperationsPage(),
                              ),
                            ),
                      ),
                      SizedBox(height: 10),
                      _buildMenuButton(
                        context,
                        icon: Icons.numbers,
                        label: 'Cek Ganjil/Genap',
                        color: Color(0xFF56021F),
                        onPressed:
                            () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => OddEvenInputPage(),
                              ),
                            ),
                      ),
                      SizedBox(height: 10),
                      _buildMenuButton(
                        context,
                        icon: Icons.format_list_numbered,
                        label: 'Hitung Jumlah Digit',
                        color: Color(0xFF56021F),
                        onPressed:
                            () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CountDigitsPage(),
                              ),
                            ),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],

        // Background circles
      ),
    );
  }

  Widget _buildMenuButton(
    BuildContext context, {
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 30, color: Colors.white),
      label: Text(
        label,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 5,
        shadowColor: Colors.black.withOpacity(0.3),
      ),
    );
  }

  void _showLogoutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color(0xFFFFC0EB),
          title: Text(
            'Konfirmasi Logout',
            style: TextStyle(
              color: Color(0xFF410038),
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            'Apakah Anda yakin ingin keluar dari aplikasi?',
            style: TextStyle(color: Color(0xFF410038)),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Batal', style: TextStyle(color: Color(0xFF410038))),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF410038),
              ),
              child: Text('Logout', style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }
}
