import 'package:flutter/material.dart';
import 'package:v_meet/resources/auth_methods.dart';
import 'package:v_meet/screens/history_meetings_screen.dart';
import 'package:v_meet/screens/meetings_screen.dart';
import 'package:v_meet/utils/colors.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _page = 0;
  onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }
  List<Widget> pages = [
    MeetingScreen(),
    const HistoryMeetingScreen(),
    const Center(
      child: Text(
        'My Contacts'
      ),
    )
    //const SettingsScreen()
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        title: const Text(
          'Meet & Chat',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              AuthMethods().signOut();
            },
            icon: const Icon(
              Icons.logout,
            ),
          )],
        //centerTitle: true,
        backgroundColor: backgroundColor,
      ),

      body: pages[_page],

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: footerColor,
        selectedItemColor: Colors.white,
        currentIndex: _page,
        onTap: onPageChanged,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.comment_bank,
            ),
            label: 'Meetings',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.lock_clock,
            ),
            label: 'Meetings',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline,
            ),
            label: 'Contacts',
          ),
          /*BottomNavigationBarItem(
            icon: Icon(
              Icons.settings_outlined,
            ),
            label: 'Settings',
          )*/
        ]
          
      ),
    );
  }
}