import 'dart:math';

import 'package:flutter/material.dart';
import 'package:v_meet/resources/jitsi_meet_methods.dart';
import 'package:v_meet/widgets/my_row_button.dart';

class MeetingScreen extends StatelessWidget {
  MeetingScreen({super.key});

  final JitsiMeetMethods _jitsiMeetMethods = JitsiMeetMethods();
  createMeeting() async {
    var random = Random();
    String roomName = (random.nextInt(100000000) + 10000000).toString();
    _jitsiMeetMethods.createNewMeeting(
      roomName: roomName,
      isAudioMuted: true,
      isVideoMuted: true
    );
  }
  joinMeeting(BuildContext context) {
    Navigator.pushNamed(context, '/video_call');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
     children: [
       const SizedBox(height: 20),
       Row(
         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
         children: [
           RowButton(
             onPressed: () {
                createMeeting();
             },
             text: 'New Meet',
             icon: Icons.videocam,
          ),
          RowButton(
             onPressed: () => joinMeeting(context),
             text: 'Join Meet',
             icon: Icons.add_box_rounded,
          ),
          RowButton(
             onPressed: () {
    
             },
             text: 'Schedule',
             icon: Icons.calendar_today,
          ),
          RowButton(
             onPressed: () {
    
             },
             text: 'Share Screen',
             icon: Icons.arrow_upward_rounded,
          )
         ],
       ),
       const Expanded(
         child: Center(
           child: Text(
             'Create/Join meetings with just a click!',
             style: TextStyle(
               fontSize: 18,
               fontWeight: FontWeight.bold,
               color: Colors.grey
             ),
           )
         )
       )
     ]
    );
  }
}