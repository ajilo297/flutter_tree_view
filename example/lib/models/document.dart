/**
 * File: document.dart
 * Package:
 * Project: tree_view
 * Author: Ajil Oommen (ajil@altorumleren.com)
 * Description:
 * Date: 06 January, 2019 1:59 PM
 */

import 'package:meta/meta.dart';

class Document {
  final String name;
  final bool isFile;
  final DateTime dateModified;
  final List<Document> childData;

  Document({
    @required this.name,
    @required this.dateModified,
    this.isFile = false,
    this.childData = const <Document>[],
  });
}
