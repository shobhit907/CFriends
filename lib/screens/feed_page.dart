import 'package:CFriends/index.dart';
import 'package:provider/provider.dart';

class FeedPage extends StatefulWidget {
  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  CodeforcesService cs = CodeforcesService();
  DatabaseService ds = DatabaseService();

  var data = "";
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          RaisedButton.icon(
              onPressed: () async {
                data = await cs.fetchData();
                // await ds.getFriends(Provider.of<User>(context,listen: false));
                setState(() {});
              },
              icon: Icon(Icons.data_usage),
              label: Text("Get data")),
          Text(data),
        ],
      ),
    );
  }
}
