import 'package:CFriends/index.dart';

class FeedPage extends StatefulWidget {
  var data="";
  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  CodeforcesService cs = CodeforcesService();
  DatabaseService ds = DatabaseService();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          RaisedButton.icon(
              onPressed: () async {
                widget.data = (await cs.fetchSubmissions("shobhit907",start: 1,count: 5))[0].problemName;
                setState(() {});
              },
              icon: Icon(Icons.data_usage),
              label: Text("Get data")),
          Text(widget.data),
        ],
      ),
    );
  }
}
