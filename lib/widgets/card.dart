import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  CustomCard(
      {this.title, this.subTitle, required this.onClick, this.type, Key? key})
      : super(key: key);

  String? title;
  String? subTitle;
  String? type;
  Function onClick;
  List<Card> _cards = <Card>[];

  @override
  Widget build(BuildContext context) {
    final _media = MediaQuery.of(context).size;
    final picture_height = _media.height - 100;

    return GestureDetector(
      onTap: () {
        onClick();
      },
      child: Card(
        color: Color(0xffffffff),
        elevation: 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        clipBehavior: Clip.antiAlias,
        // semanticContainer: false,
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 50),
              height: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('card.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
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
