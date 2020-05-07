import 'package:flutter/material.dart';
import 'package:CFriends/index.dart';

class CfUserWidget extends StatefulWidget {
  final CFUser cfUser;
  CfUserWidget(this.cfUser);
  @override
  _CfUserWidgetState createState() => _CfUserWidgetState();
}

class _CfUserWidgetState extends State<CfUserWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {},
        child: Card(
          elevation: 8.0,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
              height: 150.0,
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
                                      color: HexColor("#2D67FC"),
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left:8.0),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  child: Text(widget.cfUser.cfHandle),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  child: Text(widget.cfUser.cfFirstName +
                                      " " +
                                      widget.cfUser.cfLastName),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left:8.0),
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
                    child: Container(color: Colors.blue),
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
