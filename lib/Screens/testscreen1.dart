import 'package:flutter/material.dart';

class CaretakerHomeScreen extends StatefulWidget {
  @override
  _CaretakerHomeScreenState createState() => _CaretakerHomeScreenState();
}

class _CaretakerHomeScreenState extends State<CaretakerHomeScreen> {
  int _selectedTab = 0;
  List<Widget> _tabs = [    MedicinesTab(),    NotificationsTab(),  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pill Reminder System'),
      ),
      body: _tabs[_selectedTab],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        onTap: (index) {
          setState(() {
            _selectedTab = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.medical_services),
            label: 'Medicines',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
        ],
      ),
    );
  }
}

class NotificationsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Notifications Tab',
          style: TextStyle(fontSize: 24),
        ),
        SizedBox(height: 16),
        Text(
          'No notifications yet.',
          style: TextStyle(fontSize: 18),
        ),
      ],
    );
  }
}

class MedicinesTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Medicines Tab',
          style: TextStyle(fontSize: 24),
        ),
        SizedBox(height: 16),
        Text(
          'No medicines yet.',
          style: TextStyle(fontSize: 18),
        ),
      ],
    );
  }
}