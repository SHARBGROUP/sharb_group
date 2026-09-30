import 'package:flutter/material.dart';

import 'screens/add_product_screen.dart';
import 'settings_screen.dart';
import 'app_language.dart';
import 'language_manager.dart';

void main() {
  runApp(const SharbGroupApp());
}

class SharbGroupApp extends StatelessWidget {
  const SharbGroupApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SHARB Business',
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

  AppLanguage selectedLanguage = AppLanguage.mixed;

  bool isLoadingLanguage = true;

  @override
  void initState() {
    super.initState();
    loadAppLanguage();
  }

  Future<void> loadAppLanguage() async {
    final language = await LanguageManager.loadLanguage();

    if (!mounted) {
      return;
    }

    setState(() {
      selectedLanguage = language;
      isLoadingLanguage = false;
    });
  }

  String appText(String key) {
    return AppLanguageData.text(
      selectedLanguage,
      key,
    );
  }

  Future<void> openSettings() async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SettingsScreen(),
      ),
    );

    await loadAppLanguage();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoadingLanguage) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      body: _buildCurrentPage(),

      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,

        onDestinationSelected: (index) {
          setState(() {
            selectedIndex = index;
          });
        },

        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.dashboard_outlined),
            selectedIcon: const Icon(Icons.dashboard),
            label: appText('dashboard'),
          ),

          NavigationDestination(
            icon: const Icon(Icons.point_of_sale_outlined),
            selectedIcon: const Icon(Icons.point_of_sale),
            label: appText('sales'),
          ),

          NavigationDestination(
            icon: const Icon(Icons.shopping_bag_outlined),
            selectedIcon: const Icon(Icons.shopping_bag),
            label: appText('orders'),
          ),

          NavigationDestination(
            icon: const Icon(Icons.inventory_2_outlined),
            selectedIcon: const Icon(Icons.inventory_2),
            label: appText('products'),
          ),

          NavigationDestination(
            icon: const Icon(Icons.menu),
            label: appText('more'),
          ),
        ],
      ),
    );
  }

  Widget _buildCurrentPage() {
    switch (selectedIndex) {
      case 0:
        return DashboardScreen(
          language: selectedLanguage,
        );

      case 1:
        return PosScreen(
          language: selectedLanguage,
        );

      case 2:
        return OrdersScreen(
          language: selectedLanguage,
        );

      case 3:
        return ProductsScreen(
          language: selectedLanguage,
        );

      case 4:
        return MoreScreen(
          language: selectedLanguage,
          onSettingsTap: openSettings,
        );

      default:
        return DashboardScreen(
          language: selectedLanguage,
        );
    }
  }
}

// ============================================================
// DASHBOARD
// ============================================================

class DashboardScreen extends StatelessWidget {
  final AppLanguage language;

  const DashboardScreen({
    super.key,
    required this.language,
  });

  String text(String key) {
    return AppLanguageData.text(
      language,
      key,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'SHARB Business',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFF1565C0),
        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text(
              text('dashboard'),
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 6),

            Text(
              text('business_overview'),
              style: const TextStyle(
                fontSize: 15,
              ),
            ),

            const SizedBox(height: 20),

            Row(
              children: [
                Expanded(
                  child: summaryCard(
                    text('today_sales'),
                    '৳ 0',
                    Icons.point_of_sale,
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: summaryCard(
                    text('today_profit'),
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
                  child: summaryCard(
                    text('pending_orders'),
                    '0',
                    Icons.shopping_bag,
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: summaryCard(
                    text('customer_due'),
                    '৳ 0',
                    Icons.account_balance_wallet,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 28),

            Text(
              text('quick_actions'),
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            Wrap(
              spacing: 10,
              runSpacing: 10,

              children: [
                actionButton(
                  text('new_sale'),
                  Icons.point_of_sale,
                ),

                actionButton(
                  text('new_order'),
                  Icons.add_shopping_cart,
                ),

                actionButton(
                  text('add_product'),
                  Icons.inventory_2,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                        const AddProductScreen(),
                      ),
                    );
                  },
                ),

                actionButton(
                  text('customers'),
                  Icons.people,
                ),

                actionButton(
                  text('expense'),
                  Icons.money_off,
                ),
              ],
            ),

            const SizedBox(height: 28),

            Text(
              text('business_status'),
              style: const TextStyle(
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

                title: Text(
                  text('system_status'),
                ),

                subtitle: Text(
                  text('ready_offline_cloud'),
                ),

                trailing: Text(
                  text('online'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget summaryCard(
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
            Icon(
              icon,
              size: 28,
            ),

            const SizedBox(height: 12),

            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
              ),
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

  Widget actionButton(
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

// ============================================================
// POS
// ============================================================

class PosScreen extends StatelessWidget {
  final AppLanguage language;

  const PosScreen({
    super.key,
    required this.language,
  });

  @override
  Widget build(BuildContext context) {
    return PlaceholderScreen(
      title: AppLanguageData.text(
        language,
        'sales',
      ),
      icon: Icons.point_of_sale,
      language: language,
    );
  }
}

// ============================================================
// ORDERS
// ============================================================

class OrdersScreen extends StatelessWidget {
  final AppLanguage language;

  const OrdersScreen({
    super.key,
    required this.language,
  });

  @override
  Widget build(BuildContext context) {
    return PlaceholderScreen(
      title: AppLanguageData.text(
        language,
        'orders',
      ),
      icon: Icons.shopping_bag,
      language: language,
    );
  }
}

// ============================================================
// PRODUCTS
// ============================================================

class ProductsScreen extends StatelessWidget {
  final AppLanguage language;

  const ProductsScreen({
    super.key,
    required this.language,
  });

  @override
  Widget build(BuildContext context) {
    return PlaceholderScreen(
      title: AppLanguageData.text(
        language,
        'products',
      ),
      icon: Icons.inventory_2,
      language: language,
    );
  }
}

// ============================================================
// MORE
// ============================================================

class MoreScreen extends StatelessWidget {
  final AppLanguage language;
  final VoidCallback onSettingsTap;

  const MoreScreen({
    super.key,
    required this.language,
    required this.onSettingsTap,
  });

  String text(String key) {
    return AppLanguageData.text(
      language,
      key,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          text('more'),
        ),
        backgroundColor: const Color(0xFF1565C0),
        foregroundColor: Colors.white,
      ),

      body: ListView(
        children: [
          ListTile(
            leading: const Icon(
              Icons.local_shipping,
            ),
            title: Text(
              text('delivery'),
            ),
          ),

          ListTile(
            leading: const Icon(
              Icons.people,
            ),
            title: Text(
              text('customers'),
            ),
          ),

          ListTile(
            leading: const Icon(
              Icons.local_shipping_outlined,
            ),
            title: Text(
              text('suppliers'),
            ),
          ),

          ListTile(
            leading: const Icon(
              Icons.account_balance,
            ),
            title: Text(
              text('accounts'),
            ),
          ),

          ListTile(
            leading: const Icon(
              Icons.bar_chart,
            ),
            title: Text(
              text('reports'),
            ),
          ),

          ListTile(
            leading: const Icon(
              Icons.backup,
            ),
            title: Text(
              text('backup'),
            ),
          ),

          ListTile(
            leading: const Icon(
              Icons.settings,
            ),
            title: Text(
              text('settings'),
            ),
            onTap: onSettingsTap,
          ),
        ],
      ),
    );
  }
}

// ============================================================
// PLACEHOLDER
// ============================================================

class PlaceholderScreen extends StatelessWidget {
  final String title;
  final IconData icon;
  final AppLanguage language;

  const PlaceholderScreen({
    super.key,
    required this.title,
    required this.icon,
    required this.language,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
        ),
        backgroundColor: const Color(0xFF1565C0),
        foregroundColor: Colors.white,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Icon(
              icon,
              size: 70,
            ),

            const SizedBox(height: 16),

            Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              AppLanguageData.text(
                language,
                'module_coming_next',
              ),
              style: const TextStyle(
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}