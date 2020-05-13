import 'package:CFriends/index.dart';
import 'package:CFriends/models/cf_submission.dart';
import 'package:CFriends/screens/webview.dart';
import 'package:intl/intl.dart';

class SubmissionWidget extends StatelessWidget {
  final Submission sub;
  SubmissionWidget(this.sub);

  List<Widget> _makeTagsWidget(List<dynamic> tags) {
    List<Widget> _ret = [];
    tags.forEach((_tag) => _ret.add(Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(_tag.toString()),
        )));
    return _ret;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        elevation: 8.0,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Container(
            // height: 120.0,
            child: Row(
              children: <Widget>[
                Container(
                  child: Expanded(
                    flex: 5,
                    child: Column(children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: InkWell(
                          child: Text(
                            sub.problemName,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                                decoration: TextDecoration.underline),
                          ),
                          onTap: () async {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>WebViewWidget(url: "https://codeforces.com/contest/" +
                                  sub.contestId.toString() +
                                  "/problem/" +
                                  sub.problemIndex, title: sub.problemName)));
                            // await launch(
                            //   "https://codeforces.com/contest/" +
                            //       sub.contestId.toString() +
                            //       "/problem/" +
                            //       sub.problemIndex,
                            // );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text("*" + sub.problemRating.toString()),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: InkWell(
                          onTap: () async {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>WebViewWidget(url: "https://codeforces.com/contest/" +
                                sub.contestId.toString() +
                                "/submission/" +
                                sub.id.toString(), title: "Submission")));
                            // await launch("https://codeforces.com/contest/" +
                            //     sub.contestId.toString() +
                            //     "/submission/" +
                            //     sub.id.toString());
                          },
                          child: Text(
                            sub.verdict == "OK" ? "ACCEPTED" : sub.verdict,
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.w800,
                              color: sub.verdict == "OK"
                                  ? HexColor("#4CAB0F")
                                  : HexColor("#F74525"),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          DateFormat('E d MMM y')
                              .add_jm()
                              .format(DateTime.fromMillisecondsSinceEpoch(
                                sub.submissionTime * 1000,
                              )),
                        ),
                      ),
                    ]),
                  ),
                ),
                Container(
                  child: Expanded(
                    flex: 4,
                    child: Column(
                      children: _makeTagsWidget(sub.problemTags),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
