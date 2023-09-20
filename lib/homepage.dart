import 'package:flutter/material.dart';
import 'package:sample_app/navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        leading: const BackButton(),
        title: const Text(
          "Let's Play",
          style: TextStyle(letterSpacing: 2.0, fontSize: 25.0),
        ),
        bottom: TabBar(
          isScrollable: false,
          controller: _tabController,
          tabs: const [
            Tab(
              icon: Icon(Icons.liquor_rounded),
            ),
            Tab(
              icon: Icon(Icons.donut_small),
            ),
            Tab(
              icon: Icon(Icons.call),
            ), 
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          MessageScreen(),
          StatusScreen(),
          HistoryScreen(),
        ],
      ),
      bottomNavigationBar: const NavBar(),
    );
  }
}

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.red,
    );
  }
}

class StatusScreen extends StatelessWidget {
  const StatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
    );
  }
}

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.amber,
    );
  }
}
