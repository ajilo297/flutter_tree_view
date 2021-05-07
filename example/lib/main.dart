import 'package:example/models/document.dart';
import 'package:example/widgets/directory_widget.dart';
import 'package:example/widgets/file_widget.dart';
import 'package:flutter/material.dart';

import 'package:tree_view/tree_view.dart';

void main() => runApp(MainApplication());

class MainApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key? key, this.title}) : super(key: key);

  final String? title;

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
        startExpanded: false,
        children: _getChildList(documentList),
      ),
    );
  }

  List<Widget> _getChildList(List<Document> childDocuments) {
    return childDocuments.map((document) {
      if (!document.isFile) {
        return Container(
          margin: EdgeInsets.only(left: 8),
          child: TreeViewChild(
            parent: _getDocumentWidget(document: document),
            children: _getChildList(document.childData),
          ),
        );
      }
      return Container(
        margin: const EdgeInsets.only(left: 4.0),
        child: _getDocumentWidget(document: document),
      );
    }).toList();
  }

  Widget _getDocumentWidget({required Document document}) => document.isFile
      ? _getFileWidget(document: document)
      : _getDirectoryWidget(document: document);

  DirectoryWidget _getDirectoryWidget({required Document document}) =>
      DirectoryWidget(
        directoryName: document.name,
        lastModified: document.dateModified,
      );

  FileWidget _getFileWidget({required Document document}) => FileWidget(
        fileName: document.name,
        lastModified: document.dateModified,
      );
}
