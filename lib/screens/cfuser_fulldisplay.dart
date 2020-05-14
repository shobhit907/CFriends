import 'package:CFriends/index.dart';
import 'package:CFriends/screens/submission_widget.dart';

class CFUserSubmission extends StatefulWidget {
  final String handle;
  final int count = 10;
  CFUserSubmission({@required this.handle});
  @override
  _CFUserSubmissionState createState() {
    return _CFUserSubmissionState();
  }
}

class _CFUserSubmissionState extends State<CFUserSubmission> {
  CodeforcesService _cfService = CodeforcesService();
  
  List<Submission> submissions = [];
  int start = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.handle+" submissions")),
      body: FutureBuilder(
          future: _cfService.fetchSubmissions(widget.handle,
              start: start, count: widget.count),
          builder: (context, AsyncSnapshot<List<Submission>> snapshot) {
            if (snapshot.hasData) {
              if (snapshot.connectionState == ConnectionState.done){
                submissions.addAll(snapshot.data);
              }
              return ListView.builder(
                itemBuilder: (context, index) {
                  if (index == submissions.length) {
                    return Center(
                        child: RaisedButton.icon(
                      onPressed: () {
                        setState(() {
                          start += widget.count;
                        });
                      },
                      icon: Icon(Icons.expand_more),
                      label: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Load more"),
                      ),
                    ));
                  } else {
                    return SubmissionWidget(submissions[index]);
                  }
                },
                itemCount: submissions.length + 1,
              );
            } else {
              return Loading();
            }
          }),
    );
  }
}
