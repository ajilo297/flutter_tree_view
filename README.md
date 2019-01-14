[![pub package](https://img.shields.io/badge/pub-0.0.4-green.svg)](https://pub.dartlang.org/packages/tree_view)
[![Build Status](https://travis-ci.org/ajilo297/flutter_tree_view.svg?branch=master)](https://travis-ci.org/ajilo297/flutter_tree_view)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

# Tree View
A Flutter package for a fully customisable tree view

### Example

Let's assume we want to show a tree view with this structure:

```
Desktop
|-- documents
|   |-- Resume.docx
|   |-- Billing-Info.docx
|-- MeetingReport.xls
|-- MeetingReport.pdf
|-- Demo.zip
```

In this example
1. `Resume.docx` and `Billing-Info.docx` are **Child** widgets with
`documents` as the **Parent**.
2. `documents`, `MeetingReport.xls`, `MeetingReport.xls` and `Demo.zip`
are **Child** widgets with `Desktop` as a **Parent** widget.

The `TreeView` would look like this

```dart
var treeView = TreeView(
  parentList: [
    Parent(
      parent: Text('Desktop'),
      childList: ChildList(
        children: <Widget>[
          Parent(
            parent: Text('documents'),
            childList: ChildList(
              children: <Widget>[
                Text('Resume.docx'),
                Text('Billing-Info.docx'),
              ],
            ),
          ),
          Text('MeetingReport.xls'),
          Text('MeetingReport.pdf'),
          Text('Demo.zip'),
        ],
      ),
    ),
  ],
);
```

#### Sample
<a href="https://imgur.com/d4n4p1b"><img src="https://i.imgur.com/d4n4p1b.gif" title="source: imgur.com" /></a>
