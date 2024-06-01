import 'package:jitsi_meet_flutter_sdk/jitsi_meet_flutter_sdk.dart';
import 'package:v_meet/resources/auth_methods.dart';
import 'package:v_meet/resources/firestore_methods.dart';

class JitsiMeetMethods{
  final AuthMethods _authMethods = AuthMethods();
  final FireStoreMethods _fireStoreMethods = FireStoreMethods();

  var jitsiMeet = JitsiMeet();
  void createNewMeeting({
    required String roomName,
    required bool isAudioMuted,
    required bool isVideoMuted,
    String username = "",
    }) async{
    try{
      String name;
      if(username.isEmpty){
        name = _authMethods.currentUser!.displayName!;
      }else{
        name = username;
      }
      var options = JitsiMeetConferenceOptions(
      serverURL: "https://meet.jit.si",
      room: "jitsiIsAwesomeWithFlutter",
      configOverrides: {
        "startWithAudioMuted": isAudioMuted,
        "startWithVideoMuted": isVideoMuted,
        "subject" : "Jitsi with Flutter",
      },
      featureFlags: {
        "unsaferoomwarning.enabled": false
      },
      userInfo: JitsiMeetUserInfo(
          displayName: name,
          email: _authMethods.currentUser!.email,
          avatar: _authMethods.currentUser!.photoURL
      ),
    );
    _fireStoreMethods.addToMeetingHistory(roomName);
    jitsiMeet.join(options);
    }catch(error){
      print("Error occured: $error");
    }
  }
}