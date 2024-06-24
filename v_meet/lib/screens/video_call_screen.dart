import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jitsi_meet_flutter_sdk/jitsi_meet_flutter_sdk.dart';
import 'package:v_meet/resources/auth_methods.dart';
import 'package:v_meet/resources/jitsi_meet_methods.dart';
import 'package:v_meet/utils/colors.dart';
import 'package:v_meet/widgets/meeting_option.dart';

class VideoCallScreen extends StatefulWidget {
  const VideoCallScreen({super.key});

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  final AuthMethods _authMethods = AuthMethods();
  late TextEditingController meetingIDController;
  late TextEditingController nameController;
  final JitsiMeetMethods _jitsiMeetMethods = JitsiMeetMethods();
  bool isAudioMuted = true;
  bool isVideoMuted = true;

  @override
  void initState() {
    super.initState();
    meetingIDController = TextEditingController();
    nameController = TextEditingController(
      text: _authMethods.currentUser!.displayName
    );
  }

  @override
  void dispose() {
    meetingIDController.dispose();
    nameController.dispose();
    //JitsiMeet.removeAllListeners();
    super.dispose();
  }
  _joinMeeting() {
    _jitsiMeetMethods.createNewMeeting(
      roomName: meetingIDController.text,
      username: nameController.text,
      isAudioMuted: isAudioMuted,
      isVideoMuted: isVideoMuted
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,
        title: const Text(
          'Join a Meeting',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          SizedBox(
            height: 60,
            child: TextField(
              controller: meetingIDController,
              maxLines: 1,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                fillColor: secondaryBackgroundColor,
                filled: true,
                border: InputBorder.none,
                hintText: 'Meeting ID',
              )
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 60,
            child: TextField(
              controller: nameController,
              maxLines: 1,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                fillColor: secondaryBackgroundColor,
                filled: true,
                border: InputBorder.none,
                hintText: 'Name',
              )
            ),
          ),
          const SizedBox(height: 20),
          InkWell(
            onTap: _joinMeeting,
            child: const Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                'Join',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold
                ),
              ),
            )
          ),
          const SizedBox(height: 20),
          MeetingOption(
            text: "Mute Audio",
            isMute: isAudioMuted,
            onChanged: (value) {
              setState(() {
                isAudioMuted = value;
              });
            }
          ),
          MeetingOption(
            text: "Join without Video",
            isMute: isVideoMuted,
            onChanged: (value) {
              setState(() {
                isVideoMuted = value;
              });
            }
          )
        ],
      )
    );
  }
}
