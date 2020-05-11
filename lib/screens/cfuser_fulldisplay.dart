import 'package:CFriends/index.dart';

class CFUserSubmission extends StatefulWidget {
  String handle;
  CFUserSubmission({@required this.handle});
  @override
  _CFUserSubmissionState createState() { 
    return  _CFUserSubmissionState();
  }
}

class _CFUserSubmissionState extends State<CFUserSubmission> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Submission History")),
      body: Text("Viewing "+widget.handle+" Submission"),
    );
  }
}