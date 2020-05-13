import 'package:CFriends/index.dart';
import 'package:CFriends/screens/webview.dart';
import 'package:html/parser.dart';

class FeedPage extends StatefulWidget {
  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  CodeforcesService cs = CodeforcesService();
  DatabaseService ds = DatabaseService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(builder: (context,AsyncSnapshot<List<BlogEntry>> snapshot){
      if(snapshot.hasData){
        return ListView.builder(itemBuilder: (context,index){
          snapshot.data[index].title=parse(snapshot.data[index].title).documentElement.text;
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius:BorderRadius.circular(20.0),
              ),
              child: ListTile(
                leading: Icon(Icons.subdirectory_arrow_right),
                title: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(snapshot.data[index].title,style: TextStyle(
                    color:HexColor("#FFFFFF"),
                    fontWeight: FontWeight.bold
                  ),),
                ),
                subtitle: Row(children:<Widget>[Icon(Icons.chevron_right),Text(snapshot.data[index].authorHandle)], ),
                onTap: () async{
                  // await launch("https://codeforces.com/blog/entry/"+snapshot.data[index].id.toString());
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>WebViewWidget(url: "https://codeforces.com/blog/entry/"+snapshot.data[index].id.toString(),title:snapshot.data[index].title)));
                },
              ),
            ),
          );
        },itemCount: snapshot.data.length,);
      }else{
        return Loading();
      }
    },
    future: cs.fetchBlogEntries(),
    );
  }
}
