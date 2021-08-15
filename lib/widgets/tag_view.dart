import 'package:chat_app/theme/colors.dart';
import 'package:flutter/material.dart';

class FlutterTagView extends StatefulWidget {
  FlutterTagView({
    required this.tags,
    this.minTagViewHeight = 0,
    this.maxTagViewHeight = 150,
    this.tagBackgroundColor = primary,
    this.tagTitleColor = white
  });

final List tags;
final Color tagBackgroundColor;
final Color tagTitleColor;
final double maxTagViewHeight;
final double minTagViewHeight;
  @override
  _FlutterTagViewState createState() => _FlutterTagViewState();
}

class _FlutterTagViewState extends State<FlutterTagView> {

  @override
  Widget build(BuildContext context) {
    return getTagView();
  }

  Widget getTagView() {
    return ConstrainedBox(
        constraints:BoxConstraints(
          minHeight: widget.minTagViewHeight,
          maxHeight: widget.maxTagViewHeight,
        ),

        child: SingleChildScrollView(
          child: Wrap(
            alignment: WrapAlignment.start,
            spacing: 3.0,
            direction: Axis.horizontal,
            children: buildTags(),
          ),
        )
    );
  }

  List<Widget> buildTags() {
    List<Widget> tags = <Widget>[];
    for(int i = 0; i < widget.tags.length; i++) {
      tags.add(createTag(i, widget.tags[i]));
    }
    return tags;
  }

  Widget createTag(int index, String tagTitle) {
    return  
      Container(
        margin: EdgeInsets.only(top: 5, bottom: 5, right: 5),
        padding: EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: widget.tagBackgroundColor,
          borderRadius: BorderRadius.circular(5)
        ),
        child: Text(tagTitle, style: TextStyle(color: widget.tagTitleColor)),
      );
  }
}