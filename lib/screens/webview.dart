import 'package:CFriends/index.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebViewWidget extends StatelessWidget {
  String url, title;
  WebViewWidget({@required this.url, @required this.title});
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      // initialChild: Loading(),
      appBar: AppBar(
        title: Text(title),
      ),
      url: url,
      withZoom: true,
      scrollBar: true,
      useWideViewPort: true,
      withLocalStorage: true,
      // withOverviewMode: true,
    );
  }
}
