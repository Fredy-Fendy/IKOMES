import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'Mezon Woulant',
    theme: ThemeData(primarySwatch: Colors.grey, scaffoldBackgroundColor: Colors.white),
    initialRoute: '/',
    routes: {
      '/': (context) => HomeScreen(),
      '/lisMachin': (context) => LisMachinScreen(),
      '/panye': (context) => PanyeScreen(),
    },
    onGenerateRoute: (settings) => settings.name == '/detay' 
        ? MaterialPageRoute(builder: (context) => DetayScreen(machin: settings.arguments as Map<String, dynamic>))
        : null,
    debugShowCheckedModeBanner: false,
  );
}

class PanyeModel {
  static List<Map<String, dynamic>> panye = [];
  static void ajouteMachin(m) => panye.add(m);
  static void retireMachin(i) => panye.removeAt(i);
  static int get kantite => panye.length;
}

final List<Map<String, dynamic>> toutMachin = [
  {
    'non': 'Toyota Corolla', 
    'deskripsyon': '2020 - 25,000 km', 
    'imageUrl': 'https://images.unsplash.com/photo-1626072557464-90403d788e8d?w=400&h=300&fit=crop', 
    'pri': '750,000 HTG', 
    'detay': 'Toyota Corolla 2020. Des modèn, trè ekonomik. Motè 1.8L, 132 ch. Klimatizasyon, Bluetooth, kamera rekil. Konsomasyon 7.2L/100km.'
  },
  {
    'non': 'Honda Civic', 
    'deskripsyon': '2019 - 30,000 km', 
    'imageUrl': 'https://images.unsplash.com/photo-1636915860623-57b9b74133e6?w=400&h=300&fit=crop', 
    'pri': '800,000 HTG', 
    'detay': 'Honda Civic 2019. Koulè wouj. Motè 2.0L, 158 ch. Ekran tactile, Apple CarPlay, sièges chauffants. Konsomasyon 7.8L/100km.'
  },
  {
    'non': 'Tesla Model 3', 
    'deskripsyon': '2022 - 15,000 km', 
    'imageUrl': 'https://images.unsplash.com/photo-1560958089-b8a1929cea89?w=400&h=300&fit=crop', 
    'pri': '1,500,000 HTG', 
    'detay': 'Tesla Model 3 2022. Blan, Autonomie 500km, charge rapide. Toit en verre, écran 15", Autopilot. Machin elektrik nan eta parfe.'
  },
  {
    'non': 'Jeep Wrangler', 
    'deskripsyon': '2020 - 22,000 km', 
    'imageUrl': 'https://images.unsplash.com/photo-1638381744405-02ec736143e8?w=400&h=300&fit=crop', 
    'pri': '1,100,000 HTG', 
    'detay': 'Jeep Wrangler 2020 4x4. Motè 3.6L V6, 285 ch. Kapab fè tout tèren. Toit anlè, GPS, kamera 360.'
  },
  {
    'non': 'Ford Mustang', 
    'deskripsyon': '2018 - 40,000 km', 
    'imageUrl': 'https://images.unsplash.com/photo-1547744152-14d985cb937f?w=400&h=300&fit=crop', 
    'pri': '1,200,000 HTG', 
    'detay': 'Ford Mustang 2018. Koulè ble. Motè V8 5.0L, 460 ch. Boîte automatique 10 vitesses. Puissance et élégance.'
  },
  {
    'non': 'Chevrolet Spark', 
    'deskripsyon': '2021 - 18,000 km', 
    'imageUrl': 'https://plus.unsplash.com/premium_photo-1736291135522-eff21d790977?w=400&h=300&fit=crop', 
    'pri': '550,000 HTG', 
    'detay': 'Chevrolet Spark 2021. Ti machin ekonomik. Motè 1.4L, 98 ch. Pafè pou lavil. Konsomasyon 6.5L/100km.'
  },
  {
    'non': 'Hyundai Elantra', 
    'deskripsyon': '2020 - 35,000 km', 
    'imageUrl': 'https://images.unsplash.com/photo-1721002913303-7dac5b3b69c4?w=400&h=300&fit=crop', 
    'pri': '680,000 HTG', 
    'detay': 'Hyundai Elantra 2020. Motè 2.0L, 147 ch. Wireless charging, sièges en cuir, toit ouvrant.'
  },
  {
    'non': 'Kia Soul', 
    'deskripsyon': '2019 - 28,000 km', 
    'imageUrl': 'https://images.unsplash.com/photo-1765863238259-2ccdba6a881e?w=400&h=300&fit=crop', 
    'pri': '720,000 HTG', 
    'detay': 'Kia Soul 2019. Desen inik. Motè 1.6L, 130 ch. Beaucoup d\'espace intérieur. Système audio premium.'
  },
];

class MachinKare extends StatelessWidget {
  final Map<String, dynamic> machin;
  const MachinKare(this.machin, {super.key});

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: () => Navigator.pushNamed(context, '/detay', arguments: machin),
    child: Container(
      color: Colors.white,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(height: 120, width: double.infinity, 
          child: Image.network(machin['imageUrl'], fit: BoxFit.cover)),
        Padding(padding: const EdgeInsets.all(8), child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(machin['non'], style: const TextStyle(fontWeight: FontWeight.w600, color: Colors.black87)),
            const SizedBox(height: 4),
            Text(machin['deskripsyon'], style: TextStyle(fontSize: 12, color: Colors.grey.shade600)),
            const SizedBox(height: 4),
            Text(machin['pri'], style: const TextStyle(fontWeight: FontWeight.w600, color: Colors.black87, fontSize: 14)),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: () {
                PanyeModel.ajouteMachin({'non': machin['non'], 'deskripsyon': machin['deskripsyon'], 'imageUrl': machin['imageUrl'], 'pri': machin['pri']});
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('${machin['non']} ajoute nan panye'), 
                  backgroundColor: Colors.grey.shade800, 
                  duration: const Duration(seconds: 1)
                ));
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6), 
                color: Colors.grey.shade800,
                child: const Text('Ajoute 🛒', style: TextStyle(color: Colors.white, fontSize: 12))
              ),
            ),
          ],
        )),
      ]),
    ),
  );
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.white, elevation: 1,
      leading: Builder(builder: (context) => IconButton(
        icon: const Icon(Icons.menu, color: Colors.black87), 
        onPressed: () => Scaffold.of(context).openDrawer()
      )),
      title: const Text('Mezon Woulant', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600, letterSpacing: 1.2)),
      actions: const [Padding(padding: EdgeInsets.all(16), child: Text('PEYE', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600, letterSpacing: 1.2)))],
    ),
    drawer: Drawer(child: ListView(padding: EdgeInsets.zero, children: [
      DrawerHeader(decoration: BoxDecoration(color: Colors.grey.shade900),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.end, children: [
          const Text('MENI', style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.w600, letterSpacing: 1.5)),
          const SizedBox(height: 8), 
          Text('Mezon Woulant', style: TextStyle(color: Colors.grey.shade400, fontSize: 14, letterSpacing: 1.2)),
        ]),
      ),
      ListTile(
        leading: Icon(Icons.login, color: Colors.grey.shade800), 
        title: const Text('KONEKTE', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w500)), 
        onTap: () => Navigator.pop(context)
      ),
      ListTile(
        leading: Icon(Icons.list, color: Colors.grey.shade800), 
        title: const Text('LIS MACHIN', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w500)), 
        onTap: () { Navigator.pop(context); Navigator.pushNamed(context, '/lisMachin'); }
      ),
      ListTile(
        leading: Icon(Icons.logout, color: Colors.grey.shade800), 
        title: const Text('DEKONEKTE', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w500)), 
        onTap: () => Navigator.pop(context)
      ),
    ])),
    body: SingleChildScrollView(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Padding(padding: EdgeInsets.all(16), child: Text('KATEGORI', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black87, letterSpacing: 1.5))),
      Padding(padding: const EdgeInsets.symmetric(horizontal: 16), child: Column(children: [
        Container(width: double.infinity, height: 100, margin: const EdgeInsets.only(bottom: 12), child: Row(children: [
          Container(width: 100, height: 100, child: Image.network('https://images.unsplash.com/photo-1549317661-bd32c8ce0db2?w=400&h=300&fit=crop', fit: BoxFit.cover)),
          Expanded(child: Container(height: 100, color: Colors.grey.shade200, child: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text('Machin Esans', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black87)),
            Text('Toyota, Honda', style: TextStyle(color: Colors.grey.shade700)),
          ])))),
        ])),
        Container(width: double.infinity, height: 100, margin: const EdgeInsets.only(bottom: 12), child: Row(children: [
          Container(width: 100, height: 100, child: Image.network('https://images.unsplash.com/photo-1560958089-b8a1929cea89?w=400&h=300&fit=crop', fit: BoxFit.cover)),
          Expanded(child: Container(height: 100, color: Colors.grey.shade300, child: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text('Machin Elektrik', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black87)),
            Text('Tesla, Jeep', style: TextStyle(color: Colors.grey.shade700)),
          ])))),
        ])),
      ])),
      const SizedBox(height: 20),
      const Padding(padding: EdgeInsets.all(16), child: Text('MACHIN POPILÈ', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black87, letterSpacing: 1.5))),
      Padding(padding: const EdgeInsets.symmetric(horizontal: 16), child: GridView.count(
        shrinkWrap: true, 
        physics: const NeverScrollableScrollPhysics(), 
        crossAxisCount: 2, 
        mainAxisSpacing: 16, 
        crossAxisSpacing: 16, 
        childAspectRatio: 0.9,
        children: [MachinKare(toutMachin[0]), MachinKare(toutMachin[3])], // Toyota ak Jeep sèlman
      )),
      const SizedBox(height: 80),
    ])),
    floatingActionButton: FloatingActionButton(
      onPressed: () => Navigator.pushNamed(context, '/panye'),
      backgroundColor: Colors.grey.shade800,
      child: Stack(children: [
        const Icon(Icons.shopping_cart, color: Colors.white),
        if (PanyeModel.kantite > 0) Positioned(right: 0, top: 0, child: Container(
          padding: const EdgeInsets.all(2), 
          decoration: const BoxDecoration(color: Colors.black87, shape: BoxShape.circle),
          constraints: const BoxConstraints(minWidth: 16, minHeight: 16),
          child: Text('${PanyeModel.kantite}', style: const TextStyle(color: Colors.white, fontSize: 10), textAlign: TextAlign.center),
        )),
      ]),
    ),
    floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    bottomNavigationBar: BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: (i) { 
        setState(() => _selectedIndex = i); 
        if (i == 1) Navigator.pushNamed(context, '/panye'); 
        else if (i == 2) Navigator.pushNamed(context, '/lisMachin'); 
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'AKEY'),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'PANYE'),
        BottomNavigationBarItem(icon: Icon(Icons.list), label: 'LIS MACHIN'),
      ],
      selectedItemColor: Colors.black87, 
      unselectedItemColor: Colors.grey,
    ),
  );
}

class LisMachinScreen extends StatefulWidget {
  @override
  _LisMachinScreenState createState() => _LisMachinScreenState();
}

class _LisMachinScreenState extends State<LisMachinScreen> {
  int _selectedIndex = 2;
  
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.white, elevation: 1,
      iconTheme: const IconThemeData(color: Colors.black87),
      title: const Text('LIS MACHIN', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600, letterSpacing: 1.2)),
      actions: const [Padding(padding: EdgeInsets.all(16), child: Text('PEYE', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600, letterSpacing: 1.2)))],
    ),
    body: SingleChildScrollView(
      padding: const EdgeInsets.all(16), 
      child: GridView.count(
        shrinkWrap: true, 
        physics: const NeverScrollableScrollPhysics(), 
        crossAxisCount: 2, 
        mainAxisSpacing: 16, 
        crossAxisSpacing: 16, 
        childAspectRatio: 0.9,
        children: toutMachin.map((m) => MachinKare(m)).toList(),
      )
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: () => Navigator.pushNamed(context, '/panye'),
      backgroundColor: Colors.grey.shade800,
      child: Stack(children: [
        const Icon(Icons.shopping_cart, color: Colors.white),
        if (PanyeModel.kantite > 0) Positioned(right: 0, top: 0, child: Container(
          padding: const EdgeInsets.all(2), 
          decoration: const BoxDecoration(color: Colors.black87, shape: BoxShape.circle),
          constraints: const BoxConstraints(minWidth: 16, minHeight: 16),
          child: Text('${PanyeModel.kantite}', style: const TextStyle(color: Colors.white, fontSize: 10), textAlign: TextAlign.center),
        )),
      ]),
    ),
    floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    bottomNavigationBar: BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: (i) { 
        setState(() => _selectedIndex = i);
        if (i == 1) Navigator.pushNamed(context, '/panye');
        else if (i == 0) Navigator.pushNamed(context, '/');
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'AKEY'),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'PANYE'),
        BottomNavigationBarItem(icon: Icon(Icons.list), label: 'LIS MACHIN'),
      ],
      selectedItemColor: Colors.black87, 
      unselectedItemColor: Colors.grey,
    ),
  );
}

class DetayScreen extends StatelessWidget {
  final Map<String, dynamic> machin;
  const DetayScreen({required this.machin, super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.white, elevation: 1,
      iconTheme: const IconThemeData(color: Colors.black87),
      title: const Text('DETAY', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600, letterSpacing: 1.2)),
      actions: const [Padding(padding: EdgeInsets.all(16), child: Text('PEYE', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600, letterSpacing: 1.2)))],
    ),
    body: SingleChildScrollView(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(width: double.infinity, height: 250, child: Image.network(machin['imageUrl'], fit: BoxFit.cover)),
      Padding(padding: const EdgeInsets.all(16), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(machin['non'], style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: Colors.black87)),
        const SizedBox(height: 8),
        Text(machin['pri'], style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black87)),
        const SizedBox(height: 8),
        Text(machin['deskripsyon'], style: TextStyle(fontSize: 16, color: Colors.grey.shade600)),
        const SizedBox(height: 20),
        Container(padding: const EdgeInsets.all(16), color: Colors.grey.shade50, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text('DESKRIPSYON DETAYE', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black87, letterSpacing: 1.2)),
          const SizedBox(height: 12),
          Text(machin['detay'] ?? 'Machin nan trè bon eta.', style: const TextStyle(fontSize: 15, color: Colors.black87, height: 1.5)),
        ])),
        const SizedBox(height: 20),
        SizedBox(width: double.infinity, child: ElevatedButton(
          onPressed: () {
            PanyeModel.ajouteMachin({'non': machin['non'], 'deskripsyon': machin['deskripsyon'], 'imageUrl': machin['imageUrl'], 'pri': machin['pri']});
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('${machin['non']} ajoute nan panye'), 
              backgroundColor: Colors.grey.shade800, 
              duration: const Duration(seconds: 1)
            ));
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(backgroundColor: Colors.grey.shade800, padding: const EdgeInsets.symmetric(vertical: 16)),
          child: const Text('Ajoute nan panye 🛒', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white)),
        )),
        const SizedBox(height: 30),
      ])),
    ])),
    bottomNavigationBar: BottomNavigationBar(
      currentIndex: 1,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'AKEY'),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'PANYE'),
        BottomNavigationBarItem(icon: Icon(Icons.list), label: 'LIS MACHIN'),
      ],
      selectedItemColor: Colors.black87, 
      unselectedItemColor: Colors.grey,
    ),
  );
}

class PanyeScreen extends StatefulWidget {
  @override
  _PanyeScreenState createState() => _PanyeScreenState();
}

class _PanyeScreenState extends State<PanyeScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.white, elevation: 1,
      iconTheme: const IconThemeData(color: Colors.black87),
      title: const Text('PANYE', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600, letterSpacing: 1.2)),
      actions: const [Padding(padding: EdgeInsets.all(16), child: Text('PEYE', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600, letterSpacing: 1.2)))],
    ),
    body: PanyeModel.panye.isEmpty 
      ? Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(Icons.shopping_cart, size: 80, color: Colors.grey.shade400),
          const SizedBox(height: 16),
          const Text('Panye vid', style: TextStyle(fontSize: 20, color: Colors.black87, fontWeight: FontWeight.w500)),
          const SizedBox(height: 8),
          Text('Ajoute machin nan panye', style: TextStyle(color: Colors.grey.shade500)),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, '/lisMachin'), 
            style: ElevatedButton.styleFrom(backgroundColor: Colors.grey.shade800),
            child: const Text('Ale nan lis machin', style: TextStyle(color: Colors.white))
          ),
        ]))
      : SingleChildScrollView(
          padding: const EdgeInsets.all(16), 
          child: Column(children: [
            ListView.builder(
              shrinkWrap: true, 
              physics: const NeverScrollableScrollPhysics(), 
              itemCount: PanyeModel.panye.length,
              itemBuilder: (c, i) => Container(
                margin: const EdgeInsets.only(bottom: 12), 
                padding: const EdgeInsets.all(12), 
                color: Colors.grey.shade50,
                child: Row(children: [
                  Container(width: 60, height: 60, child: Image.network(PanyeModel.panye[i]['imageUrl'], fit: BoxFit.cover)),
                  const SizedBox(width: 12),
                  Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text(PanyeModel.panye[i]['non'], style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black87)),
                    const SizedBox(height: 4),
                    Text(PanyeModel.panye[i]['deskripsyon'], style: TextStyle(color: Colors.grey.shade600, fontSize: 12)),
                    const SizedBox(height: 4),
                    Text(PanyeModel.panye[i]['pri'], style: const TextStyle(fontWeight: FontWeight.w600, color: Colors.black87)),
                  ])),
                  IconButton(
                    icon: Icon(Icons.delete, color: Colors.grey.shade700), 
                    onPressed: () {
                      setState(() { PanyeModel.retireMachin(i); });
                      ScaffoldMessenger.of(c).showSnackBar(const SnackBar(
                        content: Text('Machin retire nan panye'), 
                        backgroundColor: Colors.black87, 
                        duration: Duration(seconds: 1)
                      ));
                    }
                  ),
                ]),
              ),
            ),
            const SizedBox(height: 20),
      
            SizedBox(
              width: double.infinity, 
              child: ElevatedButton(
                onPressed: null,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.grey.shade400, padding: const EdgeInsets.symmetric(vertical: 16)),
                child: const Text('PEYE', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white, letterSpacing: 1.5)),
              )
            ),
            const SizedBox(height: 80),
          ])
        ),
    bottomNavigationBar: BottomNavigationBar(
      currentIndex: 1,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'AKEY'),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'PANYE'),
        BottomNavigationBarItem(icon: Icon(Icons.list), label: 'LIS MACHIN'),
      ],
      selectedItemColor: Colors.black87, 
      unselectedItemColor: Colors.grey,
    ),
  );
}
