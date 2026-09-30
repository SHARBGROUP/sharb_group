import 'package:flutter/material.dart';
import 'screens/add_product_screen.dart';

void main() {
  runApp(const SharbGroupApp());
}

class SharbGroupApp extends StatelessWidget {
  const SharbGroupApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SHARB GROUP',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1565C0),
        ),
        scaffoldBackgroundColor: const Color(0xFFF5F7FA),
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;

  final List<Widget> pages = const [
    DashboardScreen(),
    PosScreen(),
    OrdersScreen(),
    ProductsScreen(),
    MoreScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.dashboard_outlined),
            selectedIcon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          NavigationDestination(
            icon: Icon(Icons.point_of_sale_outlined),
            selectedIcon: Icon(Icons.point_of_sale),
            label: 'Sales / POS',
          ),
          NavigationDestination(
            icon: Icon(Icons.shopping_bag_outlined),
            selectedIcon: Icon(Icons.shopping_bag),
            label: 'Orders',
          ),
          NavigationDestination(
            icon: Icon(Icons.inventory_2_outlined),
            selectedIcon: Icon(Icons.inventory_2),
            label: 'Products',
          ),
          NavigationDestination(
            icon: Icon(Icons.menu),
            label: 'More',
          ),
        ],
      ),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'SHARB GROUP',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF1565C0),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Dashboard',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              'আজকের Business Overview',
              style: TextStyle(fontSize: 15),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: _summaryCard(
                    'আজকের Sales',
                    '৳ 0',
                    Icons.point_of_sale,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _summaryCard(
                    'আজকের Profit',
                    '৳ 0',
                    Icons.trending_up,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _summaryCard(
                    'Pending Orders',
                    '0',
                    Icons.shopping_bag,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _summaryCard(
                    'Customer Due',
                    '৳ 0',
                    Icons.account_balance_wallet,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 28),
            const Text(
              'Quick Actions',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                _actionButton(
                  'New Sale',
                  Icons.point_of_sale,
                ),
                _actionButton(
                  'New Order',
                  Icons.add_shopping_cart,
                ),
                _actionButton(
                  'Add Product',
                  Icons.inventory_2,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AddProductScreen(),
                      ),
                    );
                  },
                ),
                _actionButton(
                  'Customer',
                  Icons.people,
                ),
                _actionButton(
                  'Expense',
                  Icons.money_off,
                ),
              ],
            ),
            const SizedBox(height: 28),
            const Text(
              'Business Status',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Card(
              child: ListTile(
                leading: const Icon(
                  Icons.cloud_done,
                  color: Colors.green,
                ),
                title: const Text('System Status'),
                subtitle: const Text(
                  'Ready • Offline + Cloud Sync',
                ),
                trailing: const Text('ONLINE'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _summaryCard(
      String title,
      String value,
      IconData icon,
      ) {
    return Card(
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 28),
            const SizedBox(height: 12),
            Text(
              title,
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _actionButton(
      String title,
      IconData icon, {
        VoidCallback? onPressed,
      }) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon),
      label: Text(title),
    );
  }
}

class PosScreen extends StatelessWidget {
  const PosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const PlaceholderScreen(
      title: 'Sales / POS',
      icon: Icons.point_of_sale,
    );
  }
}

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const PlaceholderScreen(
      title: 'Orders',
      icon: Icons.shopping_bag,
    );
  }
}

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const PlaceholderScreen(
      title: 'Products',
      icon: Icons.inventory_2,
    );
  }
}

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('More'),
        backgroundColor: const Color(0xFF1565C0),
        foregroundColor: Colors.white,
      ),
      body: ListView(
        children: const [
          ListTile(
            leading: Icon(Icons.local_shipping),
            title: Text('Delivery'),
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text('Customers'),
          ),
          ListTile(
            leading: Icon(Icons.local_shipping_outlined),
            title: Text('Suppliers'),
          ),
          ListTile(
            leading: Icon(Icons.account_balance),
            title: Text('Accounts'),
          ),
          ListTile(
            leading: Icon(Icons.bar_chart),
            title: Text('Reports'),
          ),
          ListTile(
            leading: Icon(Icons.backup),
            title: Text('Backup'),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
          ),
        ],
      ),
    );
  }
}

class PlaceholderScreen extends StatelessWidget {
  final String title;
  final IconData icon;

  const PlaceholderScreen({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: const Color(0xFF1565C0),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 70),
            const SizedBox(height: 16),
            Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Module coming next...',
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}