import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Home()));
}

class Home extends StatelessWidget {
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
              child: Text('0',
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
                        MaterialPageRoute(builder: (context) => About()),
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
                        MaterialPageRoute(builder: (context) => Businesses()),
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
                        MaterialPageRoute(builder: (context) => Anagrams()),
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
                        MaterialPageRoute(builder: (context) => Rewards()),
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

class About extends StatelessWidget {
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
              child: Text('0',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Color(0xFF362d54),
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
                Container(
                  padding: EdgeInsets.only(bottom: 20.0),
                  height: 175.0,
                  child: FlatButton(
                    onPressed: () {},
                    child: Align(
                      alignment: Alignment(0, -0.8),
                      child: Text(
                        'About the App',
                        style: TextStyle(
                          fontSize: 25.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    color: Color(0xFF362d54),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 20.0),
                  height: 175.0,
                  child: FlatButton(
                    onPressed: () {},
                    child: Align(
                      alignment: Alignment(0, -0.8),
                      child: Text(
                        'Mission',
                        style: TextStyle(
                          fontSize: 25.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    color: Color(0xFF5fb7cf),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 20.0),
                  height: 175.0,
                  child: FlatButton(
                      onPressed: () {},

                      ///add code here
                      child: Align(
                        alignment: Alignment(0, -0.8),
                        child: Text(
                          'Team',
                          style: TextStyle(
                            fontSize: 25.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      color: Color(0xFFaee4ed)),
                ),
              ]),
        ),
      ),
    );
  }
}

class Businesses extends StatelessWidget {
  String business;
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
              child: Text('0',
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
                      business = "business 1";
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
                    color: Color(0xFF362d54),
                    highlightColor: Colors.blueGrey[100],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 20.0),
                  height: 175.0,
                  child: FlatButton(
                    onPressed: () {
                      business = "business 2";
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
                    color: Color(0xFF5fb7cf),
                    highlightColor: Colors.blueGrey[100],
                  ),
                ),
                Container(
                    padding: EdgeInsets.only(bottom: 20.0),
                    height: 175.0,
                    child: FlatButton(
                      onPressed: () {
                        business = "business 3";
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
                      color: Color(0xFFaee4ed),
                      highlightColor: Colors.blueGrey[100],
                    )
                ),
                Container(
                  padding: EdgeInsets.only(left: 50.0, right: 50.0),
                  height: 50.0,
                  child: FlatButton(
                      onPressed: () {
                        if ((identical(business, null)) == false) {
                          Navigator.pop(context);
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

class Anagrams extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Level 1',
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
              child: Text('0',
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
                width: 60.0,
                child: FlatButton(
                  onPressed: () {},
                  child: Text("A",
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
                  onPressed: () {},
                  child: Text("B",
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
                  onPressed: () {},
                  child: Text("C",
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
                  onPressed: () {},
                  child: Text("D",
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
                  onPressed: () {},
                  child: Text("E",
                      style: TextStyle(
                        fontSize: 50.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF5fb7cf),
                      )),
                ),
              ),
            ]),
        Row(
          ///line and enter
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 60.0),
            ),
            Container(
              child: Text("_________  ",
                  style: TextStyle(
                    fontSize: 50.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF5fb7cf),
                  )),
            ),
            Container(
              child: FlatButton(
                onPressed: () {},
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
                  onPressed: () {},
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

class Rewards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Rewards", style: TextStyle(color: Color(0xFF362d54))),
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
              child: Text('0',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Color(0xFF362d54),
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
                Container(
                  padding: EdgeInsets.only(bottom: 20.0),
                  height: 175.0,
                  child: FlatButton(
                    onPressed: () {},
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
                    color: Color(0xFF362d54),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 20.0),
                  height: 175.0,
                  child: FlatButton(
                    onPressed: () {},
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
                    color: Color(0xFF5fb7cf),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 20.0),
                  height: 175.0,
                  child: FlatButton(
                      onPressed: () {},

                      ///add code here
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
                      color: Color(0xFFaee4ed)),
                ),
                Container(
                  padding: EdgeInsets.only(left: 50.0, right: 50.0),
                  height: 50.0,
                  child: FlatButton(
                      onPressed: () {},

                      ///add code here
                      child: Text('Select',
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