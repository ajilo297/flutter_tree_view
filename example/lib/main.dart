import 'package:flutter/material.dart';

import 'package:tree_view/tree_view.dart';

void main() => runApp(MainApplication());

class MainApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeView(),
    );
  }
}

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Example'),
      ),
      body: TreeView(
        startExpanded: true,
        children: [
          TreeViewChild(

            parent: Text('P1'),
            children: [
              Text('C1'),
              Text('C2'),
              Text('C3'),
              Text('C4'),
              TreeViewChild(
                parent: Text('P11'),
                children: <Widget>[
                  Text('C11'),
                  Text('C12'),
                  Text('C13'),
                  Text('C14'),
                ],
              ),
              Text('C5'),
              Text('C6'),
              TreeViewChild(
                parent: Text('P11'),
                children: <Widget>[
                  Text('C11'),
                  Text('C12'),
                  Text('C13'),
                  Text('C14'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
