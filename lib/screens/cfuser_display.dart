import 'package:flutter/material.dart';
import 'package:CFriends/index.dart';

class CfUserWidget extends StatefulWidget {
  final CFUser cfUser;
  Function removeFriendHandle;
  CfUserWidget(this.cfUser, this.removeFriendHandle);
  @override
  _CfUserWidgetState createState() => _CfUserWidgetState();
}

class _CfUserWidgetState extends State<CfUserWidget> {
  @override
  Widget build(BuildContext context) {
    // print(widget.cfUser.cfRank);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {},
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          semanticContainer: true,
          elevation: 8.0,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
              height: 180.0,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              // color: Colors.pink,
                              child: CircleAvatar(
                                radius: 50.0,
                                backgroundImage: NetworkImage(
                                    "https:" + widget.cfUser.cfAvatar),
                              ),
                            ),
                            flex: 3,
                          ),
                          Expanded(
                              child: Container(
                                // color: Colors.purple,
                                child: Center(
                                    child: Padding(
                                  padding: EdgeInsets.only(left: 5.0),
                                  child: Text(widget.cfUser.cfOrganization),
                                )),
                              ),
                              flex: 2),
                        ],
                      ),
                      // color: Colors.red,
                    ),
                    flex: 5,
                  ),
                  Expanded(
                    child: Container(
                      // color: Colors.yellow,
                      child: Center(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  child: Text(
                                    widget.cfUser.cfRank,
                                    style: TextStyle(
                                      color: NameColor.getNameColor(
                                          widget.cfUser.cfRank),
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  child: Text(
                                    widget.cfUser.cfHandle,
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w900,
                                      color: NameColor.getNameColor(
                                          widget.cfUser.cfRank),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  child: Text(
                                    widget.cfUser.cfFirstName +
                                        " " +
                                        widget.cfUser.cfLastName,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  child: Text(widget.cfUser.cfCity +
                                      " " +
                                      widget.cfUser.cfCountry),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    flex: 5,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        // color: Colors.blue,
                        child: Column(
                          children: <Widget>[
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 5.0),
                                child: IconButton(
                                    icon: Icon(Icons.remove_circle),
                                    onPressed: () {
                                      widget.removeFriendHandle(
                                          widget.cfUser.cfHandle);
                                    }),
                              ),
                              flex: 2,
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: CircleAvatar(
                                  child:
                                      Text(widget.cfUser.cfRating.toString()),
                                  radius: 25.0,
                                ),
                              ),
                              flex: 4,
                            ),
                            Divider(
                              height: 5.0,
                            ),
                            Expanded(
                              child: CircleAvatar(
                                child:
                                    Text(widget.cfUser.cfMaxRating.toString()),
                                radius: 25.0,
                              ),
                              flex: 4,
                            ),
                          ],
                        ),
                      ),
                    ),
                    flex: 3,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
