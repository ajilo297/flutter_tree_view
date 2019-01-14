import 'package:flutter/material.dart';

import 'package:tree_view/tree_view.dart';
import 'widgets/file_widget.dart';
import 'models/document.dart';
import 'widgets/directory_widget.dart';

void main() => runApp(MainApplication());

class MainApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tree View Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: HomePage(title: 'Tree View Demo'),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Document> documentList = [
    Document(
      name: 'Desktop',
      dateModified: DateTime.now(),
      isFile: false,
      childData: [
        Document(name: 'Projects', dateModified: DateTime.now(), childData: [
          Document(
              name: 'flutter_app',
              dateModified: DateTime.now(),
              childData: [
                Document(
                  name: 'README.md',
                  dateModified: DateTime.now(),
                  isFile: true,
                ),
                Document(
                  name: 'pubspec.yaml',
                  dateModified: DateTime.now(),
                  isFile: true,
                ),
                Document(
                  name: 'pubspec.lock',
                  dateModified: DateTime.now(),
                  isFile: true,
                ),
                Document(
                  name: '.gitignore',
                  dateModified: DateTime.now(),
                  isFile: true,
                ),
                Document(
                  name: 'lib',
                  dateModified: DateTime.now(),
                  isFile: false,
                  childData: [
                    Document(
                      name: 'main.dart',
                      dateModified: DateTime.now(),
                      isFile: true,
                    ),
                  ],
                ),
              ])
        ]),
        Document(
          name: 'test.sh',
          dateModified: DateTime.now(),
          isFile: true,
        ),
        Document(
          name: 'image.png',
          dateModified: DateTime.now(),
          isFile: true,
        ),
        Document(
          name: 'image2.png',
          dateModified: DateTime.now(),
          isFile: true,
        ),
        Document(
          name: 'image3.png',
          dateModified: DateTime.now(),
          isFile: true,
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title ?? 'Tree View demo'),
      ),
      body: TreeView(
        parentList: _getParentList(),
      ),
    );
  }

  List<Parent> _getParentList() {
    List<Parent> parentList = [];

    documentList.forEach((document) {
      Parent parent = _getParent(document: document);
      parentList.add(parent);
    });

    return parentList;
  }

  Parent _getParent({@required Document document}) {
    ChildList childList =
        document.isFile ? null : _getChildList(document: document);

    return Parent(
      parent: _getDocumentWidget(document: document),
      childList: childList,
    );
  }

  ChildList _getChildList({@required Document document}) {
    List<Widget> widgetList = [];

    List<Document> childDocuments = document.childData;
    childDocuments.forEach((childDocument) {
      widgetList.add(Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: _getParent(document: childDocument),
      ));
    });

    return ChildList(children: widgetList);
  }

  Widget _getDocumentWidget({@required Document document}) => document.isFile
      ? _getFileWidget(document: document)
      : _getDirectoryWidget(document: document);

  DirectoryWidget _getDirectoryWidget({@required Document document}) =>
      DirectoryWidget(
        directoryName: document.name,
        lastModified: document.dateModified,
      );

  FileWidget _getFileWidget({@required Document document}) => FileWidget(
        fileName: document.name,
        lastModified: document.dateModified,
      );
}
