import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:v_meet/resources/firestore_methods.dart';

class HistoryMeetingScreen extends StatelessWidget {
  const HistoryMeetingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FireStoreMethods().meetingsHistory, 
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if(snapshot.hasData) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Meeting History'),
            ),
            body: ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Room name: ${snapshot.data!.docs[index]['meeting_name']}'),
                  subtitle: Text('Joined on ${DateFormat.yMMMd().format((snapshot.data! as dynamic).docs[index]['time'].toDate())}'),
                );
              }
            ),
          );
        } else {
          return const Scaffold(
            body: Center(
              child: Text('No data found'),
            ),
          );
        }
      }
    );
  }
}
