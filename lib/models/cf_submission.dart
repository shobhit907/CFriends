import 'package:cloud_firestore/cloud_firestore.dart';

class Submission{
  int id;
  int contestId;//Can be absent
  int submissionTime;
  String problemName;
  String problemIndex;
  int problemRating;//Can be absent
  List<dynamic> problemTags;
  String verdict;//Can be absent

  Submission({this.id,this.contestId,this.submissionTime,this.problemName,this.problemIndex,this.problemRating,this.problemTags,this.verdict});
  
  factory Submission.fromJson(Map<String,dynamic> json){
    return Submission(
      id: json['id'] as int ?? null,
      contestId: json['contestId'] as int ?? null,
      submissionTime: json['creationTimeSeconds'] as int ?? Timestamp.now().seconds,
      problemName: json['problem']['name'] as String,
      problemIndex: json['problem']['index'] as String,
      problemRating: json['problem']['rating'] as int ?? 0,
      problemTags: json['problem']['tags'] as List<dynamic>,
      verdict: json['verdict'] as String ?? '',
    );
  }
}