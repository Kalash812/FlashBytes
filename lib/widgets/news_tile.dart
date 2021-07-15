import 'package:flutter/material.dart';
import 'package:news_app/screens/webView.dart';
import 'package:share/share.dart';

class NewsTile extends StatelessWidget {
  final String urlToImage;
  final String description;
  final String title;
  final DateTime date;
  final String url;

  NewsTile({
    required this.date,
    required this.description,
    required this.title,
    required this.urlToImage,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: 300,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(date.toString()),
                GestureDetector(
                  child: Icon(
                    Icons.share,
                    color: Color.fromRGBO(109, 71, 241, 1),
                  ),
                  onTap: () {
                    Share.share(url);
                  },
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              title,
              style: TextStyle(
                  letterSpacing: 0.5,
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w900),
            ),
            SizedBox(
              height: 25,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                urlToImage,
                cacheHeight: 200,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              thickness: 1.0,
              color: Colors.grey[350],
            ),
            Flexible(
              child: RichText(
                maxLines: 5,
                overflow: TextOverflow.visible,
                text: TextSpan(
                  style: TextStyle(color: Colors.black),
                  text: description,
                ),
              ),
            ),
            SizedBox(
              height: 35,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 22,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(109, 71, 241, 1),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ArticleWebView(url: url)));
                      },
                      child: Text(
                        'Read more..',
                        style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 0.2,
                            fontWeight: FontWeight.w400),
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
