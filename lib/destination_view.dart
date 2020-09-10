import 'package:flutter/material.dart';

import 'history_page.dart';
import 'main.dart';
import 'more_page.dart';
import 'root_page.dart';
import 'updates_page.dart';
import 'browse_page.dart';
import 'destination.dart';

class DestinationView extends StatefulWidget {
  const DestinationView({Key key, this.destination}) : super(key: key);

  final Destination destination;

  @override
  _DestinationViewState createState() => _DestinationViewState();
}

class _DestinationViewState extends State<DestinationView> {
  TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    // _textController = TextEditingController(
    //   text: 'sample text: ${widget.destination.title}',
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) {
            switch (settings.name) {
              case '/':
                return HomePage(destination: widget.destination);
              case '/updates':
                return UpdatesPage(destination: widget.destination);
              case '/history':
                return HistoryPage(destination: widget.destination);
              case '/browse':
                return BrowsePage(destination: widget.destination);
              case '/more':
                return MorePage(destination: widget.destination);
            }
          },
        );
      },
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}
