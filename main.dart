import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mezon Woulant',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/lisMachin': (context) => LisMachinScreen(),
        '/panye': (context) => PanyeScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

// Klas pou jere panye an
class PanyeModel {
  static List<Map<String, dynamic>> panye = [];

  static void ajouteMachin(Map<String, dynamic> machin) {
    panye.add(machin);
  }

  static void retireMachin(int index) {
    panye.removeAt(index);
  }

  static int get kantite => panye.length;
}

// Ekran 1: Paj prensipal
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu, color: Colors.black87),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        title: Text(
          'Mezon Woulant',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.2,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'PEYE',
              style: TextStyle(
                color: Colors.grey.shade700,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.2,
              ),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.grey.shade900,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'MENI',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.5,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Mezon Woulant',
                    style: TextStyle(
                      color: Colors.grey.shade400,
                      fontSize: 14,
                      letterSpacing: 1.2,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.login, color: Colors.grey.shade800),
              title: Text('KONEKTE', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w500)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.list, color: Colors.grey.shade800),
              title: Text('LIS MACHIN', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w500)),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/lisMachin');
              },
            ),
            ListTile(
              leading: Icon(Icons.logout, color: Colors.grey.shade800),
              title: Text('DEKONEKTE', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w500)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tit "Kategori"
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'KATEGORI',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey.shade800,
                  letterSpacing: 1.5,
                ),
              ),
            ),
            
            // 2 kategori yo youn anba lòt
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  // Kategori 1 - Machin Esans
                  Container(
                    width: double.infinity,
                    height: 100,
                    margin: EdgeInsets.only(bottom: 12),
                    color: Colors.grey.shade200,
                    child: Row(
                      children: [
                        Container(
                          width: 100,
                          color: Colors.grey.shade400,
                          child: Icon(Icons.local_gas_station, size: 50, color: Colors.white),
                        ),
                        Expanded(
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Machin Esans', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black87)),
                                Text('Toyota, Honda', style: TextStyle(color: Colors.grey.shade700)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Kategori 2 - Machin Elektrik
                  Container(
                    width: double.infinity,
                    height: 100,
                    margin: EdgeInsets.only(bottom: 12),
                    color: Colors.grey.shade300,
                    child: Row(
                      children: [
                        Container(
                          width: 100,
                          color: Colors.grey.shade600,
                          child: Icon(Icons.electric_car, size: 50, color: Colors.white),
                        ),
                        Expanded(
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Machin Elektrik', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black87)),
                                Text('Tesla, Nissan', style: TextStyle(color: Colors.grey.shade700)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            
            SizedBox(height: 20),
            
            // Tit pou machin yo
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'MACHIN POPILÈ',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey.shade800,
                  letterSpacing: 1.5,
                ),
              ),
            ),
            
            // 4 machin yo sou fòm kare (2 kolòn)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 0.9,
                children: [
                  _buildMachinKare('Toyota Corolla', '2020 - 25,000 km', Icons.directions_car, context, '750,000 HTG'),
                  _buildMachinKare('Honda Civic', '2019 - 30,000 km', Icons.time_to_leave, context, '800,000 HTG'),
                  _buildMachinKare('Tesla Model 3', '2022 - 15,000 km', Icons.electric_car, context, '1,500,000 HTG'),
                  _buildMachinKare('Nissan Leaf', '2021 - 20,000 km', Icons.bolt, context, '950,000 HTG'),
                ],
              ),
            ),
            SizedBox(height: 80),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/panye');
        },
        backgroundColor: Colors.grey.shade800,
        child: Stack(
          children: [
            Icon(Icons.shopping_cart, color: Colors.white),
            if (PanyeModel.kantite > 0)
              Positioned(
                right: 0,
                top: 0,
                child: Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  constraints: BoxConstraints(
                    minWidth: 16,
                    minHeight: 16,
                  ),
                  child: Text(
                    '${PanyeModel.kantite}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
          if (index == 1) {
            Navigator.pushNamed(context, '/panye');
          } else if (index == 2) {
            Navigator.pushNamed(context, '/lisMachin');
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: _selectedIndex == 0 ? Colors.black87 : Colors.grey.shade400),
            label: 'AKEY',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart, color: _selectedIndex == 1 ? Colors.black87 : Colors.grey.shade400),
            label: 'PANYE',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list, color: _selectedIndex == 2 ? Colors.black87 : Colors.grey.shade400),
            label: 'LIS MACHIN',
          ),
        ],
        selectedItemColor: Colors.black87,
        unselectedItemColor: Colors.grey.shade400,
      ),
    );
  }

  Widget _buildMachinKare(String non, String deskripsyon, IconData ikon, BuildContext context, String pri) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 120,
            width: double.infinity,
            color: Colors.grey.shade300,
            child: Icon(ikon, size: 50, color: Colors.grey.shade700),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(non, style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black87)),
                SizedBox(height: 4),
                Text(deskripsyon, style: TextStyle(fontSize: 12, color: Colors.grey.shade600)),
                SizedBox(height: 4),
                Text(pri, style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black87, fontSize: 14)),
                SizedBox(height: 8),
                GestureDetector(
                  onTap: () {
                    Map<String, dynamic> machin = {
                      'non': non,
                      'deskripsyon': deskripsyon,
                      'ikon': ikon,
                      'pri': pri,
                    };
                    PanyeModel.ajouteMachin(machin);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('$non ajoute nan panye'),
                        backgroundColor: Colors.grey.shade800,
                        duration: Duration(seconds: 1),
                      ),
                    );
                    setState(() {});
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    color: Colors.grey.shade800,
                    child: Text(
                      'Ajoute 🛒',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Ekran 2: Lis machin (8 machin)
class LisMachinScreen extends StatefulWidget {
  @override
  _LisMachinScreenState createState() => _LisMachinScreenState();
}

class _LisMachinScreenState extends State<LisMachinScreen> {
  int _selectedIndex = 2;
  
  List<Map<String, dynamic>> lisMachin = [
    {'non': 'Toyota Corolla', 'deskripsyon': '2020 - 25,000 km', 'ikon': Icons.directions_car, 'pri': '750,000 HTG'},
    {'non': 'Honda Civic', 'deskripsyon': '2019 - 30,000 km', 'ikon': Icons.time_to_leave, 'pri': '800,000 HTG'},
    {'non': 'Tesla Model 3', 'deskripsyon': '2022 - 15,000 km', 'ikon': Icons.electric_car, 'pri': '1,500,000 HTG'},
    {'non': 'Nissan Leaf', 'deskripsyon': '2021 - 20,000 km', 'ikon': Icons.bolt, 'pri': '950,000 HTG'},
    {'non': 'Ford Mustang', 'deskripsyon': '2018 - 40,000 km', 'ikon': Icons.speed, 'pri': '1,200,000 HTG'},
    {'non': 'Chevrolet Spark', 'deskripsyon': '2021 - 18,000 km', 'ikon': Icons.car_repair, 'pri': '550,000 HTG'},
    {'non': 'Hyundai Elantra', 'deskripsyon': '2020 - 35,000 km', 'ikon': Icons.directions_car, 'pri': '680,000 HTG'},
    {'non': 'Kia Soul', 'deskripsyon': '2019 - 28,000 km', 'ikon': Icons.electric_car, 'pri': '720,000 HTG'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: IconThemeData(color: Colors.black87),
        title: Text(
          'LIS MACHIN',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.2,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'PEYE',
              style: TextStyle(
                color: Colors.grey.shade700,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.2,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: GridView.count(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 0.9,
          children: lisMachin.map((machin) {
            return Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 120,
                    width: double.infinity,
                    color: Colors.grey.shade300,
                    child: Icon(machin['ikon'], size: 50, color: Colors.grey.shade700),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          machin['non'],
                          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: Colors.black87),
                        ),
                        SizedBox(height: 4),
                        Text(
                          machin['deskripsyon'],
                          style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                        ),
                        SizedBox(height: 4),
                        Text(
                          machin['pri'],
                          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black87, fontSize: 14),
                        ),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Bouton ajoute nan panyen
                            GestureDetector(
                              onTap: () {
                                Map<String, dynamic> nouvoMachin = {
                                  'non': machin['non'],
                                  'deskripsyon': machin['deskripsyon'],
                                  'ikon': machin['ikon'],
                                  'pri': machin['pri'],
                                };
                                PanyeModel.ajouteMachin(nouvoMachin);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('${machin['non']} ajoute nan panye'),
                                    backgroundColor: Colors.grey.shade800,
                                    duration: Duration(seconds: 1),
                                  ),
                                );
                                setState(() {});
                              },
                              child: Container(
                                padding: EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Text('🛒', style: TextStyle(fontSize: 20)),
                              ),
                            ),
                            // Bouton kè
                            GestureDetector(
                              onTap: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('${machin['non']} ajoute nan favori'),
                                    backgroundColor: Colors.black87,
                                    duration: Duration(seconds: 1),
                                  ),
                                );
                              },
                              child: Container(
                                padding: EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Text('❤️', style: TextStyle(fontSize: 20)),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/panye');
        },
        backgroundColor: Colors.grey.shade800,
        child: Stack(
          children: [
            Icon(Icons.shopping_cart, color: Colors.white),
            if (PanyeModel.kantite > 0)
              Positioned(
                right: 0,
                top: 0,
                child: Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  constraints: BoxConstraints(
                    minWidth: 16,
                    minHeight: 16,
                  ),
                  child: Text(
                    '${PanyeModel.kantite}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
          if (index == 1) {
            Navigator.pushNamed(context, '/panye');
          } else if (index == 0) {
            Navigator.pushNamed(context, '/');
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: _selectedIndex == 0 ? Colors.black87 : Colors.grey.shade400),
            label: 'AKEY',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart, color: _selectedIndex == 1 ? Colors.black87 : Colors.grey.shade400),
            label: 'PANYE',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list, color: _selectedIndex == 2 ? Colors.black87 : Colors.grey.shade400),
            label: 'LIS MACHIN',
          ),
        ],
        selectedItemColor: Colors.black87,
        unselectedItemColor: Colors.grey.shade400,
      ),
    );
  }
}

// Ekran 3: Panye
class PanyeScreen extends StatefulWidget {
  @override
  _PanyeScreenState createState() => _PanyeScreenState();
}

class _PanyeScreenState extends State<PanyeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: IconThemeData(color: Colors.black87),
        title: Text(
          'PANYE',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.2,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'PEYE',
              style: TextStyle(
                color: Colors.grey.shade700,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.2,
              ),
            ),
          ),
        ],
      ),
      body: PanyeModel.panye.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.shopping_cart, size: 80, color: Colors.grey.shade400),
                  SizedBox(height: 16),
                  Text(
                    'Panye vid',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey.shade700,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Ajoute machin nan panye',
                    style: TextStyle(
                      color: Colors.grey.shade500,
                    ),
                  ),
                  SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/lisMachin');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey.shade800,
                    ),
                    child: Text('Ale nan lis machin', style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            )
          : SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: PanyeModel.panye.length,
                    itemBuilder: (context, index) {
                      final machin = PanyeModel.panye[index];
                      return Container(
                        margin: EdgeInsets.only(bottom: 12),
                        padding: EdgeInsets.all(12),
                        color: Colors.grey.shade50,
                        child: Row(
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              color: Colors.grey.shade300,
                              child: Icon(machin['ikon'], color: Colors.grey.shade700),
                            ),
                            SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    machin['non'],
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(machin['deskripsyon'], style: TextStyle(color: Colors.grey.shade600, fontSize: 12)),
                                  SizedBox(height: 4),
                                  Text(machin['pri'] ?? '750,000 HTG', style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black87)),
                                ],
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.delete, color: Colors.grey.shade700),
                              onPressed: () {
                                setState(() {
                                  PanyeModel.retireMachin(index);
                                });
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Machin retire nan panye'),
                                    backgroundColor: Colors.black87,
                                    duration: Duration(seconds: 1),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.all(16),
                    color: Colors.grey.shade200,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'TOTAL:',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                            letterSpacing: 1.2,
                          ),
                        ),
                        Text(
                          '${_kalkileTotal()} HTG',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey.shade400,
                        padding: EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: Text(
                        'PEYE',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          letterSpacing: 1.5,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 80),
                ],
              ),
            ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.grey.shade400),
            label: 'AKEY',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart, color: Colors.black87),
            label: 'PANYE',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list, color: Colors.grey.shade400),
            label: 'LIS MACHIN',
          ),
        ],
        selectedItemColor: Colors.black87,
        unselectedItemColor: Colors.grey.shade400,
      ),
    );
  }

  String _kalkileTotal() {
    int total = 0;
    for (var machin in PanyeModel.panye) {
      String pri = machin['pri'] ?? '750,000 HTG';
      // Retire " HTG" ak vigil pou konvèti an nimewo
      String nimewo = pri.replaceAll(' HTG', '').replaceAll(',', '');
      total += int.parse(nimewo);
    }
    return total.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},');
  }
}
