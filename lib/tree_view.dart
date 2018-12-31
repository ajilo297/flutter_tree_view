/// Tree view widget library
library tree_view;

import 'package:flutter/material.dart';

/// # Tree View
///
/// Creates a tree view widget. The widget is a List View with a [List] of
/// [Parent] widgets. The [TreeView] is nested inside a [Scrollbar] if the
/// [TreeView.hasScrollBar] property is true.
class TreeView extends StatelessWidget {
  final List<Parent> parentList;
  final bool hasScrollBar;

  TreeView({
    this.parentList = const <Parent>[],
    this.hasScrollBar = false,
  });

  @override
  Widget build(BuildContext context) {
    return hasScrollBar ? Scrollbar(child: _getTreeList()) : _getTreeList();
  }

  Widget _getTreeList() {
    return ListView.builder(
      itemBuilder: (context, index) {
        return parentList[index];
      },
      itemCount: parentList.length,
    );
  }
}

class Parent extends StatefulWidget {
  final Widget parent;
  final ChildList childWidget;
  final MainAxisSize mainAxisSize;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment mainAxisAlignment;

  Parent({
    @required this.parent,
    @required this.childWidget,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.min,
  });

  @override
  _ParentState createState() => _ParentState();
}

class _ParentState extends State<Parent> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: widget.mainAxisSize,
      crossAxisAlignment: widget.crossAxisAlignment,
      mainAxisAlignment: widget.mainAxisAlignment,
      children: <Widget>[
        InkWell(
          child: widget.parent,
          onTap: () {
            setState(() {
              _isSelected = _toggleBool(_isSelected);
            });
          },
        ),
        _getChild(),
      ],
    );
  }

  bool _toggleBool(bool b) {
    return b ? false : true;
  }

  Widget _getChild() {
    return _isSelected
        ? Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: widget.childWidget,
          )
        : Container();
  }
}

class ChildList extends StatelessWidget {
  final List<Widget> children;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisSize mainAxisSize;

  ChildList({
    this.children = const <Widget>[],
    this.mainAxisSize = MainAxisSize.min,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.mainAxisAlignment = MainAxisAlignment.center,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      mainAxisSize: mainAxisSize,
      children: children,
    );
  }
}
