import 'package:CFriends/index.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class FeedbackWidget extends StatefulWidget {
  @override
  _FeedbackWidgetState createState() => _FeedbackWidgetState();
}

class _FeedbackWidgetState extends State<FeedbackWidget> {
  double rating = 0;
  DatabaseService _dbService = DatabaseService();
  TextEditingController _controller = TextEditingController();
  Widget buildRatingBar() {
    return RatingBar(
      allowHalfRating: true,
      itemCount: 5,
      minRating: 0,
      maxRating: 5,
      initialRating: 0,
      itemBuilder: (context, index) {
        return Icon(Icons.star, color: Colors.amber);
      },
      onRatingUpdate: (newRating) {
        rating = newRating;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Text("Please give your valuable Feedback to help improve the app"),
            buildRatingBar(),
            TextFormField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: "Please Enter your feedback",
                hintText: "This app is awesome",
              ),
            ),
            RaisedButton.icon(
                onPressed: () async {
                  if (rating != 0) {
                    FocusScope.of(context).unfocus();
                    await _dbService.saveFeedback(
                        Provider.of<User>(context, listen: false),
                        rating,
                        _controller.value.text);
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text("Submitted"),
                    ));
                    Scaffold.of(context).setState(() {
                      print("Feedback widget rebuilt");
                      _controller.text = "";
                      rating = 0;
                    });
                  } else {
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text("Please give rating"),
                    ));
                  }
                },
                icon: Icon(Icons.send),
                label: Text("Submit")),
          ],
        ),
      ),
    );
  }
}
