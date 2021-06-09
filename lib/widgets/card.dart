import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  CustomCard({this.title, this.subTitle, required this.onClick, Key? key})
      : super(key: key);

  String? title;
  String? subTitle;
  Function onClick;
  List<Card> _cards = <Card>[];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onClick();
      },
      child: Card(
        color: Color(0xff96FBFC),
        elevation: 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        clipBehavior: Clip.antiAlias,
        // semanticContainer: false,
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Text(title == null ? '' : title!),
            ),
            Container(
              child: Text(subTitle == null ? '' : subTitle!),
            ),
          ],
        ),
      ),
    );
  }
}
