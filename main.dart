import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Level {
  final String title;
  Level(this.title);
}

class Win {
  bool wins;
  Win(this.wins);
}

void main() {
  int eyes = 0;
  runApp(MaterialApp(home: Home(eyes)));
}

class Levels extends StatefulWidget {
  final int eyes;
  Levels(this.eyes);
  @override
  _LevelsState createState() => _LevelsState(eyes,
    levels: List.generate(
      50,
          (i) => Level(
        'Level ${i + 1}',
      ),
    ),
    wins: List.generate(
      50,
          (i) => Win(false),
    ),
  );
}

class _LevelsState extends State<Levels> {
  int eyes;
  final List<Level> levels;
  List<Win> wins;

  _LevelsState(this.eyes, {Key key, @required this.levels, this.wins});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Anagrams Levels",
              style: TextStyle(color: Color(0xFF362d54))),
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home(eyes)),
              );
            },
            icon: Icon(
              Icons.arrow_back,
              color: Color(0xFF362d54),
            ),
          ),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: Icon(
                Icons.remove_red_eye,
                color: Color(0xFF362d54),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 30.0, top: 15.0),
              child: Text('$eyes',
                  style: TextStyle(
                    color: Color(0xFF362d54),
                    fontSize: 20.0,
                  )),
            )
          ]),
      body: ListView.builder(
        itemCount: levels.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(levels[index].title,
                style: TextStyle(
                  color: Color(0xFF362d54),
                  fontSize: 20.0,
                )),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Anagrams(eyes),
                  settings: RouteSettings(
                    arguments: levels[index],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

Future<void> _alert(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          'Choose a business',
          style: TextStyle(
            color: Color(0xFF362d54),
          ),
        ),
        content: const Text(
          'Please choose a business of your choice, which will receive all ad sense generated through your game play!',
          style: TextStyle(
            color: Color(0xFF362d54),
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text(
              'Ok',
              style: TextStyle(
                color: Color(0xFF5fb7cf),
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

Future<void> _levelComplete(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          'Level Complete!',
          style: TextStyle(
            color: Color(0xFF362d54),
          ),
        ),
        content: const Text(
          'You have received 5 eyes for completing this level!',
          style: TextStyle(
            color: Color(0xFF362d54),
          ),
        ),
      );
    },
  );
}

class Anagrams extends StatefulWidget {
  final int eyes;
  Anagrams(this.eyes);
  @override
  _AnagramsState createState() => _AnagramsState(eyes);
}

class _AnagramsState extends State<Anagrams> {
  int eyes;
  _AnagramsState(this.eyes);
  /// anagrams variables
  //array for the words. temp right now. use File IO later
  //string for storing the word they entered
  String letters = "FBCDE";
  bool entered = false;
  String word = "";
  bool won = false;
  @override
  Widget build(BuildContext context) {
    if (won == true) {
      eyes += 5;
      Future.delayed(const Duration(milliseconds: 3000), () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Levels(eyes)),
        );
      });
      _levelComplete(context);
    }
    final Level levels = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
          title: Text('${levels.title}',
              style: TextStyle(
                fontSize: 20.0,
                color: Color(0xFF362d54),
              )),
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
            color: Color(0xFF362d54),
          ),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: Icon(
                Icons.remove_red_eye,
                color: Color(0xFF362d54),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 30.0, top: 15.0),
              child: Text('$eyes',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Color(0xFF362d54),
                  )),
            ),
          ]),
      body: Column(children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 50.0),
        ),
        Row(

          ///letter buttons
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 60.0),
              ),
              Container(
                ///first letter
                width: 60.0,
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      if (!word.contains(letters.substring(0, 1))) {
                        word += letters.substring(0, 1);
                      }
                    });
                  },
                  child: Text(
                      letters.substring(
                          0, 1), //change this to get from the array
                      style: TextStyle(
                        fontSize: 50.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF5fb7cf),
                      )),
                ),
              ),
              Container(
                width: 60.0,
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      if (!word.contains(letters.substring(1, 2))) {
                        word += letters.substring(1, 2);
                      }
                    });
                  },
                  child: Text(letters.substring(1, 2),
                      style: TextStyle(
                        fontSize: 50.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF5fb7cf),
                      )),
                ),
              ),
              Container(
                width: 60.0,
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      if (!word.contains(letters.substring(2, 3))) {
                        word += letters.substring(2, 3);
                      }
                    });
                  },
                  child: Text(letters.substring(2, 3),
                      style: TextStyle(
                        fontSize: 50.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF5fb7cf),
                      )),
                ),
              ),
              Container(
                width: 60.0,
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      if (!word.contains(letters.substring(3, 4))) {
                        word += letters.substring(3, 4);
                      }
                    });
                  },
                  child: Text(letters.substring(3, 4),
                      style: TextStyle(
                        fontSize: 50.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF5fb7cf),
                      )),
                ),
              ),
              Container(
                width: 60.0,
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      if (!word.contains(letters.substring(4, 5))) {
                        word += letters.substring(4, 5);
                      }
                    });
                  },
                  child: Text(letters.substring(4, 5),
                      style: TextStyle(
                        fontSize: 50.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF5fb7cf),
                      )),
                ),
              ),
            ]),
        Container(
          ///word selection display
          child: Text('$word',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              )),
          color: Color(0xFF5fb7cf),
          margin: EdgeInsets.only(left: 60.0, right: 160.0, top: 30.0),
        ),
        Row(
          ///line and enter
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 40.0),
            ),
            Container(
              child: Text("____________________  ",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF5fb7cf),
                  )),
            ),
            Container(
              child: FlatButton(
                onPressed: () {
                  entered = true;
                  print(word);
                },
                child: Text(
                  'Enter',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                  ),
                ),
                color: Color(0xFFaee4ed),
              ),
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: 50.0),
        ),
        Row(

          /// first row of words
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                width: 100.0,
                height: 30.0,
                child: FlatButton(
                  onPressed: () {

                  },
                  child: Text("word",
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      )),
                ),
                color: Color(0xFF5fb7cf),
              ),
              Container(
                width: 100.0,
                height: 30.0,
                child: FlatButton(
                  onPressed: () {},
                  child: Text("word",
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      )),
                ),
                color: Color(0xFF5fb7cf),
              ),
            ]),
        Padding(
          padding: EdgeInsets.only(top: 10.0),
        ),
        Row(

          /// second row of words
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                width: 100.0,
                height: 30.0,
                child: FlatButton(
                  onPressed: () {},
                  child: Text("word",
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      )),
                ),
                color: Color(0xFF5fb7cf),
              ),
              Container(
                width: 100.0,
                height: 30.0,
                child: FlatButton(
                  onPressed: () {},
                  child: Text("word",
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      )),
                ),
                color: Color(0xFF5fb7cf),
              ),
            ]),
        Padding(
          padding: EdgeInsets.only(top: 10.0),
        ),
        Row(

          /// 3
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                width: 100.0,
                height: 30.0,
                child: FlatButton(
                  onPressed: () {},
                  child: Text("word",
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      )),
                ),
                color: Color(0xFF5fb7cf),
              ),
              Container(
                width: 100.0,
                height: 30.0,
                child: FlatButton(
                  onPressed: () {},
                  child: Text("word",
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      )),
                ),
                color: Color(0xFF5fb7cf),
              ),
            ]),
        Padding(
          padding: EdgeInsets.only(top: 10.0),
        ),
        Row(

          /// 4
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                width: 150.0,
                height: 30.0,
                child: FlatButton(
                  onPressed: () {},
                  child: Text("longer word",
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      )),
                ),
                color: Color(0xFF5fb7cf),
              ),
              Container(
                width: 150.0,
                height: 30.0,
                child: FlatButton(
                  onPressed: () {},
                  child: Text("longer word",
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      )),
                ),
                color: Color(0xFF5fb7cf),
              ),
            ]),
        Padding(
          padding: EdgeInsets.only(top: 10.0),
        ),
        Row(

          /// 5
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                width: 150.0,
                height: 30.0,
                child: FlatButton(
                  onPressed: () {},
                  child: Text("longer word",
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      )),
                ),
                color: Color(0xFF5fb7cf),
              ),
              Container(
                width: 150.0,
                height: 30.0,
                child: FlatButton(
                  onPressed: () {},
                  child: Text("longer word",
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      )),
                ),
                color: Color(0xFF5fb7cf),
              ),
            ]),
        Padding(
          padding: EdgeInsets.only(top: 10.0),
        ),
        Row(

          /// 6
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                width: 150.0,
                height: 30.0,
                child: FlatButton(
                  onPressed: () {},
                  child: Text("longer word",
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      )),
                ),
                color: Color(0xFF5fb7cf),
              ),
              Container(
                width: 150.0,
                height: 30.0,
                child: FlatButton(
                  onPressed: () {},
                  child: Text("longer word",
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      )),
                ),
                color: Color(0xFF5fb7cf),
              ),
            ]),
        Padding(
          padding: EdgeInsets.only(top: 50.0),
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 70.0,
                width: 70.0,
                child: FlatButton(
                  onPressed: () {},
                  child: Text(
                    'Hint',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                    ),
                  ),
                  color: Color(0xFFaee4ed),
                ),
              ),
              Container(
                height: 70.0,
                width: 70.0,
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      word = " ";
                    });
                  },
                  child: Text(
                    'Clear',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                    ),
                  ),
                  color: Color(0xFFaee4ed),
                ),
              ),
            ]),
      ]),
    );
  }
}

class Home extends StatefulWidget {
  final int eyes;
  Home(this.eyes);
  @override
  _HomeState createState() => _HomeState(eyes);
}

class _HomeState extends State<Home> {
  int eyes;
  _HomeState(this.eyes);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("LocalEyes"),
          centerTitle: true,
          backgroundColor: Color(0xFF362d54),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: Icon(
                Icons.remove_red_eye,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 30.0, top: 15.0),
              child: Text('$eyes',
                  style: TextStyle(
                    fontSize: 20.0,
                  )),

              ///change this to a variable
            )
          ]),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 80.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Center(
                  child: Text('LocalEyes:',
                      style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF5fb7cf),
                      )),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 50.0),
                    child: Text('Word Games',
                        style: TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF5fb7cf),
                        )),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 20.0),
                  height: 70.0,
                  child: FlatButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => About(eyes)),
                      );
                    },
                    child: Text(
                      'About LocalEyes',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                      ),
                    ),
                    color: Color(0xFF362d54),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 20.0),
                  height: 70.0,
                  child: FlatButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Businesses(eyes)),
                      );
                    },
                    child: Text('Choose Local Business',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                        )),
                    color: Color(0xFF5fb7cf),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 18.0),
                  height: 70.0,
                  child: FlatButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Levels(eyes)),
                      );
                    },
                    child: Text('Play',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        )),
                    color: Color(0xFFaee4ed),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 18.0),
                  height: 70.0,
                  child: FlatButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Rewards(eyes)),
                      );
                    },

                    ///add code here
                    child: Text('Rewards',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        )),
                    color: Colors.blueGrey[100],
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}

class About extends StatefulWidget {
  final int eyes;
  About(this.eyes);
  @override
  _AboutState createState() => _AboutState(eyes);
}

class _AboutState extends State<About> {
  int eyes;
  _AboutState(this.eyes);
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
          title: Text("About LocalEyes",
              style: TextStyle(color: Color(0xFF362d54))),
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context, eyes);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Color(0xFF362d54),
            ),
          ),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: Icon(
                Icons.remove_red_eye,
                color: Color(0xFF362d54),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 30.0, top: 15.0),
              child: Text('$eyes',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Color(0xFF362d54),
                  )),
            )
          ]),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 80.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(5.0),
                  margin: EdgeInsets.only(bottom: 20.0),
                  height: 180.0,
                  child: Column(
                    children: <Widget>[
                      Text(
                        'About the App',
                        style: TextStyle(
                          fontSize: 25.0,
                          color: Colors.white,
                        ),
                      ),
                      Text(' ',
                          style: TextStyle(
                            fontSize: 5.0,
                          )),
                      Text(
                        'Users will be able to play a series of minigames, and all ad revenue will go to the local business THEY choose to support or a charity that supports local businesses in different areas. We will also reward users with coupons to their favourite local businesses in Richmond Hill, Ontario, Canada.',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  color: Color(0xFF362d54),
                ),
                Container(
                  padding: EdgeInsets.all(5.0),
                  margin: EdgeInsets.only(bottom: 20.0),
                  height: 180.0,
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Mission',
                        style: TextStyle(
                          fontSize: 25.0,
                          color: Colors.white,
                        ),
                      ),
                      Text(' ',
                          style: TextStyle(
                            fontSize: 5.0,
                          )),
                      Text(
                        'LocalEyes is an organization that aims to promote and reimagine local food businesses in the Greater Toronto Area. With the outbreak of COVID-19, families were instructed to stay at home, limiting their opportunities to experience the tasteful dishes of local cuisine.',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  color: Color(0xFF5fb7cf),
                ),
                Container(
                  padding: EdgeInsets.all(5.0),
                  margin: EdgeInsets.only(bottom: 20.0),
                  height: 180.0,
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Team',
                        style: TextStyle(
                          fontSize: 25.0,
                          color: Colors.white,
                        ),
                      ),
                      Text(' ',
                          style: TextStyle(
                            fontSize: 5.0,
                          )),
                      Text(
                        'We are 5 high school students from the Greater Toronto Area. This app was created as part of a project for Stanford Rebuild 2020. If you wish to contact us send us an email at localeyes.company@gmail.com or you can visit our instagram @localeyes.app',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  color: Color(0xFFaee4ed),
                ),
              ]),
        ),
      ),
    );
  }
}

class Businesses extends StatefulWidget {
  final int eyes;
  Businesses(this.eyes);
  @override
  _BusinessesState createState() => _BusinessesState(eyes);
}

class _BusinessesState extends State<Businesses> {
  int eyes;
  _BusinessesState(this.eyes);
  String business;
  bool isPressed1 = false;
  bool isPressed2 = false;
  bool isPressed3 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Businesses", style: TextStyle(color: Color(0xFF362d54))),
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Color(0xFF362d54),
            ),
          ),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: Icon(
                Icons.remove_red_eye,
                color: Color(0xFF362d54),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 30.0, top: 15.0),
              child: Text('$eyes',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Color(0xFF362d54),
                  )),
            )
          ]),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 80.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                    padding: EdgeInsets.only(bottom: 20.0),
                    height: 175.0,
                    child: FlatButton(
                        onPressed: () {
                          setState(() {
                            if (isPressed1 == false) {
                              isPressed1 = true;
                              isPressed2 = false;
                              isPressed3 = false;
                              business = "business 1";
                            } else {
                              isPressed1 = false;
                              business = null;
                            }
                          });
                        },
                        child: Align(
                          alignment: Alignment(0, -0.8),
                          child: Text(
                            'Business 1',
                            style: TextStyle(
                              fontSize: 25.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        color: (isPressed1)
                            ? Colors.blueGrey[100]
                            : Color(0xFF362d54))),
                Container(
                    padding: EdgeInsets.only(bottom: 20.0),
                    height: 175.0,
                    child: FlatButton(
                        onPressed: () {
                          setState(() {
                            if (isPressed2 == false) {
                              isPressed2 = true;
                              isPressed1 = false;
                              isPressed3 = false;
                              business = "business 2";
                            } else {
                              isPressed2 = false;
                              business = null;
                            }
                          });
                        },
                        child: Align(
                          alignment: Alignment(0, -0.8),
                          child: Text(
                            'Business 2',
                            style: TextStyle(
                              fontSize: 25.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        color: (isPressed2)
                            ? Colors.blueGrey[100]
                            : Color(0xFF5fb7cf))),
                Container(
                    padding: EdgeInsets.only(bottom: 20.0),
                    height: 175.0,
                    child: FlatButton(
                        onPressed: () {
                          setState(() {
                            if (isPressed3 == false) {
                              isPressed3 = true;
                              isPressed2 = false;
                              isPressed1 = false;
                              business = "business 3";
                            } else {
                              isPressed3 = false;
                              business = null;
                            }
                          });
                        },
                        child: Align(
                          alignment: Alignment(0, -0.8),
                          child: Text(
                            'Business 3',
                            style: TextStyle(
                              fontSize: 25.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        color: (isPressed3)
                            ? Colors.blueGrey[100]
                            : Color(0xFFaee4ed))),
                Container(
                  padding: EdgeInsets.only(left: 50.0, right: 50.0),
                  height: 50.0,
                  child: FlatButton(
                      onPressed: () {
                        if ((identical(business, null)) == false) {
                          Navigator.pop(context, eyes);
                        } else {
                          _alert(context);
                        }
                      },
                      child: Text('Choose',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          )),
                      color: Color(0xFF362d54)),
                ),
              ]),
        ),
      ),
    );
  }
}

class Rewards extends StatefulWidget {
  final int eyes;
  Rewards(this.eyes);
  @override
  _RewardsState createState() => _RewardsState(eyes);
}

class _RewardsState extends State<Rewards> {
  int eyes;
  _RewardsState(this.eyes);
  bool isPressed1 = false;
  bool isPressed2 = false;
  bool isPressed3 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Rewards", style: TextStyle(color: Color(0xFF362d54))),
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context, eyes);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Color(0xFF362d54),
            ),
          ),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: Icon(
                Icons.remove_red_eye,
                color: Color(0xFF362d54),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 30.0, top: 15.0),
              child: Text('$eyes',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Color(0xFF362d54),
                  )),
            )
          ]),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 80.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                    padding: EdgeInsets.only(bottom: 20.0),
                    height: 175.0,
                    child: FlatButton(
                        onPressed: () {
                          setState(() {
                            if (isPressed1 == false) {
                              isPressed1 = true;
                              isPressed2 = false;
                              isPressed3 = false;
                            } else {
                              isPressed1 = false;
                            }
                          });
                        },
                        child: Align(
                          alignment: Alignment(0, -0.8),
                          child: Text(
                            'Coupon 1',
                            style: TextStyle(
                              fontSize: 25.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        color: (isPressed1)
                            ? Colors.blueGrey[100]
                            : Color(0xFF362d54))),
                Container(
                    padding: EdgeInsets.only(bottom: 20.0),
                    height: 175.0,
                    child: FlatButton(
                        onPressed: () {
                          setState(() {
                            if (isPressed2 == false) {
                              isPressed2 = true;
                              isPressed1 = false;
                              isPressed3 = false;
                            } else {
                              isPressed2 = false;
                            }
                          });
                        },
                        child: Align(
                          alignment: Alignment(0, -0.8),
                          child: Text(
                            'Coupon 2',
                            style: TextStyle(
                              fontSize: 25.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        color: (isPressed1)
                            ? Colors.blueGrey[100]
                            : Color(0xFF5fb7cf))),
                Container(
                    padding: EdgeInsets.only(bottom: 20.0),
                    height: 175.0,
                    child: FlatButton(
                        onPressed: () {
                          setState(() {
                            if (isPressed3 == false) {
                              isPressed3 = true;
                              isPressed2 = false;
                              isPressed1 = false;
                            } else {
                              isPressed3 = false;
                            }
                          });
                        },
                        child: Align(
                          alignment: Alignment(0, -0.8),
                          child: Text(
                            'Coupon 3',
                            style: TextStyle(
                              fontSize: 25.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        color: (isPressed1)
                            ? Colors.blueGrey[100]
                            : Color(0xFFaee4ed))),
                Container(
                  padding: EdgeInsets.only(left: 50.0, right: 50.0),
                  height: 50.0,
                  child: FlatButton(
                      onPressed: () {},

                      ///add code here
                      child: Text('Claim',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          )),
                      color: Color(0xFF362d54)),
                ),
              ]),
        ),
      ),
    );
  }
}
