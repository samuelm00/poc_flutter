import 'package:flutter/material.dart';

class BottomNavigationWrapper extends StatefulWidget {
  final List<BottomNavigationBarItem> navigationItems;
  final List<Widget> children;
  final int initialIndex;

  const BottomNavigationWrapper(
      {super.key,
      required this.children,
      required this.initialIndex,
      required this.navigationItems});

  @override
  State<BottomNavigationWrapper> createState() =>
      _BottomNavigationWrapperState();
}

class _BottomNavigationWrapperState extends State<BottomNavigationWrapper> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  void _onTab(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: widget.children[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: widget.navigationItems,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue[800],
        onTap: _onTab,
      ),
    );
  }
}
