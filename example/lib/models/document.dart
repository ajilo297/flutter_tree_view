/**
 * File: document.dart
 * Package:
 * Project: tree_view
 * Author: Ajil Oommen (ajil@altorumleren.com)
 * Description:
 * Date: 06 January, 2019 1:59 PM
 * Copyright 2018 - Altorum Leren Private Limited
 */

import 'package:meta/meta.dart';

class Document {
  final String name;
  final bool isFile;
  final DateTime dateModified;

  Document({@required this.name,  @required this.dateModified, this.isFile = false});
}