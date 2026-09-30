import 'package:flutter/material.dart';

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
home: const DashboardScreen(),
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
body: Padding(
padding: const EdgeInsets.all(16),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
const Text(
'Dashboard',
style: TextStyle(
fontSize: 24,
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
title: 'আজকের Sales',
value: '৳ 0',
icon: Icons.point_of_sale,
),
),
const SizedBox(width: 12),
Expanded(
child: _summaryCard(
title: 'আজকের Profit',
value: '৳ 0',
icon: Icons.trending_up,
),
),
],
),

const SizedBox(height: 12),

Row(
children: [
Expanded(
child: _summaryCard(
title: 'Pending Orders',
value: '0',
icon: Icons.shopping_bag,
),
),
const SizedBox(width: 12),
Expanded(
child: _summaryCard(
title: 'Customer Due',
value: '৳ 0',
icon: Icons.account_balance_wallet,
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
],
),
),
);
}

static Widget _summaryCard({
required String title,
required String value,
required IconData icon,
}) {
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

static Widget _actionButton(
String title,
IconData icon,
) {
return OutlinedButton.icon(
onPressed: () {},
icon: Icon(icon),
label: Text(title),
);
}
}