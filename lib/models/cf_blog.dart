import 'package:CFriends/index.dart';

class BlogEntry{
  int timeSeconds;
  int id;
  String authorHandle,title;
  List<dynamic> tags;
  int rating;
  BlogEntry({this.timeSeconds,this.id,this.authorHandle,this.title,this.tags,this.rating});

  factory BlogEntry.fromJson(Map<String,dynamic> json){
    return BlogEntry(
      timeSeconds: json['timeSeconds'] as int,
      id:json['blogEntry']['id'] as int,
      authorHandle: json['blogEntry']['authorHandle'] as String,
      title: json['blogEntry']['title'] as String,
      tags: json['blogEntry']['tags'] as List<dynamic>,
      rating: json['blogEntry']['rating'] as int,
    );
  }
}
