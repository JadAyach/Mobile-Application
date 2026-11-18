import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expense Tracker',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Expense Tracker'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Current Balance',
              style: TextStyle(fontSize: 18),
            ),

            const SizedBox(height: 10),

            const Text(
              '\$1,250.00',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              'Recent Transactions',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            const TransactionTile(
              title: 'Groceries',
              amount: '-\$45.00',
              icon: Icons.shopping_cart,
            ),

            const TransactionTile(
              title: 'Salary',
              amount: '+\$800.00',
              icon: Icons.work,
            ),

            const TransactionTile(
              title: 'Transportation',
              amount: '-\$20.00',
              icon: Icons.directions_bus,
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Add transaction clicked!'),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class TransactionTile extends StatelessWidget {
  final String title;
  final String amount;
  final IconData icon;

  const TransactionTile({
    super.key,
    required this.title,
    required this.amount,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(icon, color: Colors.green),
        title: Text(title),
        trailing: Text(
          amount,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}