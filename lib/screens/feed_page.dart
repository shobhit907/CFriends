import 'package:CFriends/index.dart';
import 'package:html/parser.dart';

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
    return FutureBuilder(builder: (context,AsyncSnapshot<List<BlogEntry>> snapshot){
      if(snapshot.hasData){
        return ListView.builder(itemBuilder: (context,index){
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
                  child: Text(parse(snapshot.data[index].title).documentElement.text,style: TextStyle(
                    color:HexColor("#FFFFFF"),
                    fontWeight: FontWeight.bold
                  ),),
                ),
                subtitle: Row(children:<Widget>[Icon(Icons.chevron_right),Text(snapshot.data[index].authorHandle)], ),
                onTap: () async{
                  await launch("https://codeforces.com/blog/entry/"+snapshot.data[index].id.toString());
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
