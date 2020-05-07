import 'package:CFriends/index.dart';

class FeedPage extends StatefulWidget {
  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  CodeforcesService cs=CodeforcesService();
  var data="";
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children:[
          RaisedButton.icon(onPressed: ()async{
            data=await cs.fetchData(); 
            setState(() {
            });
          }, icon: Icon(Icons.data_usage), label: Text("Get data")),
          Text(data),
        ],
      ),
    );
  }
}