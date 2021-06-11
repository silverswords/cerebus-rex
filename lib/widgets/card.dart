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
    final card_height = (_media.width - 34) / 3 / 1.618;

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
        child: Stack(
          children: <Widget>[
            Container(
              // height: card_height - 140,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('card.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        child: Text(title == null ? '' : title!,
                            style: TextStyle(fontSize: 24)))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Text(
                        subTitle == null ? '' : subTitle!,
                        style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                      ),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
