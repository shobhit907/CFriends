import 'package:CFriends/index.dart';

class User{
    String uid,displayName,email,photoUrl;
    User(this.uid,this.displayName,this.email,this.photoUrl){
        // print(this.displayName);
    }
    List<String> friendsHandle=["shobhit907","bit_show"];
    
}

class CFUser{  
    String cfHandle,cfEmail,cfFirstName,cfLastName,cfCountry,cfCity,cfOrganization,cfRank,cfMaxRank,cfAvatar;
    int cfRating,cfMaxRating,cfFriendOfCount,cfContribution;
    CFUser({this.cfHandle,this.cfEmail,this.cfFirstName,this.cfLastName,this.cfCountry,this.cfCity,this.cfOrganization,this.cfRank,this.cfMaxRank,this.cfAvatar,this.cfRating,this.cfMaxRating,this.cfFriendOfCount,this.cfContribution});
    factory CFUser.fromJson(Map<String,dynamic> json){
      return CFUser(
        cfHandle: json['handle'] as String ?? '',
        cfEmail: json['email'] as String ?? '',
        cfFirstName: json['firstName'] as String ?? '',
        cfLastName: json['lastName'] as String ?? '',
        cfCountry: json['country'] as String ?? '',
        cfCity: json['city'] as String ?? '',
        cfOrganization: json['organization'] as String ?? '',
        cfContribution: json['contribution'] as int ?? 0,
        cfRank: json['rank'] as String ?? '',
        cfRating: json['rating'] as int ?? 0,
        cfMaxRank: json['maxRank'] as String ?? '',
        cfMaxRating: json['maxRating'] as int ?? 0,
        cfFriendOfCount: json['friendOfCount'] as int ?? 0,
        cfAvatar: json['avatar'] as String ?? '',
      );
    }
}