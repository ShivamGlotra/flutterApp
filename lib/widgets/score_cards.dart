import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ScoreCards extends StatefulWidget {
  static Color favoriteColor = const Color.fromARGB(255, 85, 81, 81);
  const ScoreCards({super.key});

  @override
  _ScoreCardsState createState() => _ScoreCardsState();
}

class _ScoreCardsState extends State<ScoreCards> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: MediaQuery.of(context).size.height * 0.25,
        autoPlay: false,
        viewportFraction: 0.7,
      ),
      items: [1, 2, 3, 4, 5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Card(
              color: Colors.grey[350],
              elevation: 10.0,
              margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                // Adds a border
              ),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Game Number $i, Team $i vs Team ${i + 1}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text('Team $i :  {scores}', textAlign: TextAlign.center),
                      SizedBox(height: 5),
                      Text('Team $i :  {scores}', textAlign: TextAlign.center),
                      SizedBox(height: 5),
                      Text(
                        'Team $i needs {points} points to win.',
                        textAlign: TextAlign.center,
                      ),
                      Divider(),
                      SizedBox(
                        height: 20, // Minimized height
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                              icon: Icon(Icons.calendar_month),
                              padding: EdgeInsets.all(0),
                              iconSize: 20,
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: Icon(Icons.rate_review),
                              padding: EdgeInsets.all(0),
                              iconSize: 20,
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: Icon(Icons.favorite),
                              padding: EdgeInsets.all(0),
                              iconSize: 20,
                              color: ScoreCards.favoriteColor,
                              onPressed: () {
                                setState(() {
                                  if (ScoreCards.favoriteColor ==
                                      const Color.fromARGB(255, 85, 81, 81)) {
                                    ScoreCards.favoriteColor = Colors.red;
                                  } else {
                                    ScoreCards.favoriteColor =
                                        const Color.fromARGB(255, 85, 81, 81);
                                  }
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
