import 'package:flutter/material.dart';
import 'package:news_app/constants/colors.dart';
import 'package:news_app/dataHandler/categoryNews.dart';
import 'package:news_app/models/newsData.dart';
import 'package:news_app/widgets/news_tile.dart';

enum Cateogory {
  Entertainment,
  Sports,
  Science,
  BitCoin,
  Business,
  Apple,
  Null
}

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}
//45,46,50

class _WelcomeScreenState extends State<WelcomeScreen> {
  List<News> categoryNewsList = [];
  bool _loading = true;
  var activeHeight = 4.0;
  var inActiveHeight = 0.0;

  Cateogory selectedTile = Cateogory.Sports;

  @override
  void initState() {
    getCategoryNews('technology');
    super.initState();
  }

  getCategoryNews(String category) async {
    CategoryNewsData categoryNewsData = CategoryNewsData();
    await categoryNewsData.getData(category);
    categoryNewsList = categoryNewsData.newsData;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(245, 246, 250, 0.9),
        body: Stack(
          children: [
            FractionallySizedBox(
              alignment: Alignment.topCenter,
              heightFactor: 0.6,
              child: Container(
                decoration: BoxDecoration(
                    color: Color.fromRGBO(108, 54, 249, 3),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    )),
              ),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.menu,
                            color: Colors.white,
                          ),
                          Text(
                            'Latest news',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1,
                                color: Colors.white),
                          ),
                          Text(''),
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 22),
                        height: 38,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedTile = Cateogory.Sports;
                                  _loading = true;
                                  getCategoryNews('sports');
                                });
                              },
                              child: CategoryTile(
                                height: selectedTile == Cateogory.Sports
                                    ? activeHeight
                                    : inActiveHeight,
                                color: selectedTile == Cateogory.Sports
                                    ? active
                                    : inActive,
                                text: 'Sports  ',
                              ),
                            ),
                            SizedBox(
                              width: 35,
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedTile = Cateogory.Apple;
                                  _loading = true;
                                  getCategoryNews('technology');
                                });
                              },
                              child: CategoryTile(
                                height: selectedTile == Cateogory.Apple
                                    ? activeHeight
                                    : inActiveHeight,
                                color: selectedTile == Cateogory.Apple
                                    ? active
                                    : inActive,
                                text: 'Technology ',
                              ),
                            ),
                            SizedBox(
                              width: 35,
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedTile = Cateogory.Entertainment;
                                  _loading = true;
                                  getCategoryNews('entertainment');
                                });
                              },
                              child: CategoryTile(
                                height: selectedTile == Cateogory.Entertainment
                                    ? activeHeight
                                    : inActiveHeight,
                                color: selectedTile == Cateogory.Entertainment
                                    ? active
                                    : inActive,
                                text: 'Entertainment',
                              ),
                            ),
                            SizedBox(
                              width: 35,
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedTile = Cateogory.Business;
                                  _loading = true;
                                  getCategoryNews('business');
                                });
                              },
                              child: CategoryTile(
                                height: selectedTile == Cateogory.Business
                                    ? activeHeight
                                    : inActiveHeight,
                                color: selectedTile == Cateogory.Business
                                    ? active
                                    : inActive,
                                text: 'Buisness   ',
                              ),
                            ),
                            SizedBox(
                              width: 35,
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedTile = Cateogory.Science;
                                  _loading = true;
                                  getCategoryNews('science');
                                });
                              },
                              child: CategoryTile(
                                height: selectedTile == Cateogory.Science
                                    ? activeHeight
                                    : inActiveHeight,
                                color: selectedTile == Cateogory.Science
                                    ? active
                                    : inActive,
                                text: 'Science   ',
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        thickness: 0.5,
                        color: Colors.white54,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      _loading
                          ? Center(
                              child: CircularProgressIndicator(
                              color: Colors.white,
                            ))
                          : Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              height: 500,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    elevation: 10.0,
                                    shadowColor: Colors.white,
                                    child: NewsTile(
                                      urlToImage:
                                          categoryNewsList[index].urlToImage,
                                      description:
                                          categoryNewsList[index].description,
                                      date: DateTime.parse(
                                          categoryNewsList[index].date),
                                      title: categoryNewsList[index].title,
                                      url: categoryNewsList[index].url,
                                      //urlToPost = categoryNewsList[index].url
                                    ),
                                  );
                                },
                                itemCount: categoryNewsList.length,
                              ),
                            ),
                      SizedBox(
                        height: 25,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}

class CategoryTile extends StatelessWidget {
  const CategoryTile({
    required this.height,
    required this.color,
    required this.text,
  });

  final double height;
  final Color? color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          text,
          style: TextStyle(
              color: color,
              fontSize: 15,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.8),
        ),
        SizedBox(
          height: 16,
        ),
        Container(
          margin: EdgeInsets.only(right: 10),
          height: height,
          width: 80,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                topRight: Radius.circular(5),
              )),
        ),
      ],
    );
  }
}

//109,71,241

// Second Layer

// body: SafeArea(
