import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      home: Home()
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
              child: Text(
                  '0',
                  style: TextStyle(
                    fontSize: 20.0,
                  )
              ), ///change this to a variable
            )
          ]
      ),
      body: Center(

        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 80.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Center(
                  child: Text(
                      'LocalEyes:',
                      style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF5fb7cf),
                      )
                  ),
                ),

                Center(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 50.0),
                    child: Text(
                        'Word Games',
                        style: TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF5fb7cf),
                        )
                    ),
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
                    child: Text(
                        'Choose Local Business',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                        )
                    ),
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
                    child: Text(
                        'Play',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        )
                    ),
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
                    }, ///add code here
                    child: Text(
                        'Rewards',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        )
                    ),
                    color: Colors.blueGrey[100],

                  ),
                ),
              ]
          ),
        ),
      ),
    );

    /*child: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back),
          color: Colors.blue,
        )
          child: RaisedButton.icon(
          onPressed: () {},
          icon: Icon(
            Icons.remove_red_eye,
          ),
          label: Text("hi"),
          color: Colors.amber,
        )
        */
  }
}

class Businesses extends StatefulWidget {
  @override
  _BusinessesState createState() => _BusinessesState();
}

class _BusinessesState extends State<Businesses> {
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



class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("About LocalEyes", style: TextStyle(
              color: Color(0xFF362d54))),
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
              child: Text(
                  '0',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Color(0xFF362d54),
                  )
              ),

              ///change this to a variable
            )
          ]
      ),
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
                      color: Color(0xFFaee4ed)
                  ),
                ),
              ]
          ),
        ),
      ),
    );
  }
}

class Rewards extends StatefulWidget {
  @override
  _RewardsState createState() => _RewardsState();
}

class _RewardsState extends State<Rewards> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Rewards", style: TextStyle(
              color: Color(0xFF362d54))),
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon:Icon(
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
              child: Text(
                  '0',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Color(0xFF362d54),
                  )
              ), ///change this to a variable
            )
          ]
      ),
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

                    color: Color(0xFF362d54),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 20.0),
                  height: 175.0,
                  child: FlatButton(
                    onPressed: () {
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
                    color: Color(0xFF5fb7cf),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 20.0),
                  height: 175.0,
                  child: FlatButton(
                      onPressed: () {}, ///add code here
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
                      color: Color(0xFFaee4ed)
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 50.0, right: 50.0),
                  height: 50.0,
                  child: FlatButton(
                      onPressed: () {}, ///add code here
                      child: Text(
                          'Select',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          )
                      ),
                      color: Color(0xFF362d54)
                  ),
                ),
              ]
          ),
        ),
      ),
    );
  }
}







class Anagrams extends StatefulWidget {
  @override
  _AnagramsState createState() => _AnagramsState();
}

class _AnagramsState extends State<Anagrams> {
  /// anagrams variables

  int i = 14;
  //pretend "file" is the file
  List file=[1, "IDARY", "DIARY", "DAIRY", "AIR", "RAID", "RAY", "DRAY", "YARD", "ARID", "DAY", "DRY", "AID", 2, "SORDW", "SWORD", "WORDS", "DOWS", "WORD", "ROWS", "RODS", "ROW", "SOW", "ROD", "SOD", 3, "JUICE", "JEU", "CUE", "CUI", "ECU", "ICE"];
  int level = 1;
  String letters = "IDARY";
  List wordList = ["DIARY", "DAIRY", "AIR", "RAID", "RAY", "DRAY", "YARD", "ARID", "DAY", "DRY", "AID"];
  int nWords = 11;
  bool entered = false;
  String word = "";
  bool won = false;
  List enteredWords = ["?", "?", "?", "?", "?", "?", "?", "?", "?", "?", "?", "?"];
  int foundWords = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
              'Level ' + level.toString(),
              style: TextStyle(
                fontSize: 20.0,
                color: Color(0xFF362d54),
              )
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon:Icon(Icons.arrow_back),
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
              child: Text(
                  '0',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Color(0xFF362d54),
                  )
              ),
            ),
          ]
      ),
      body:Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 50.0),
            ),
            Row( ///letter buttons
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 60.0),
                  ),
                  Container( ///first letter
                    width: 60.0,
                    child: FlatButton(
                      onPressed: () {
                        setState((){
                          if (!word.contains(letters.substring(0,1))){
                            word+= letters.substring(0,1);
                          }
                        });
                      },
                      child: Text(
                          letters.substring(0,1), //change this to get from the array
                          style: TextStyle(
                            fontSize: 50.0,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF5fb7cf),
                          )
                      ),
                    ),
                  ),
                  Container(
                    width: 60.0,
                    child: FlatButton(
                      onPressed: () {
                        setState((){
                          if (!word.contains(letters.substring(1,2))){
                            word+= letters.substring(1,2);
                          }
                        });
                      },
                      child: Text(
                          letters.substring(1,2),
                          style: TextStyle(
                            fontSize: 50.0,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF5fb7cf),
                          )
                      ),
                    ),
                  ),
                  Container(
                    width: 60.0,
                    child: FlatButton(
                      onPressed: () {
                        setState((){
                          if (!word.contains(letters.substring(2,3))){
                            word+= letters.substring(2,3);
                          }
                        });
                      },
                      child: Text(
                          letters.substring(2,3),
                          style: TextStyle(
                            fontSize: 50.0,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF5fb7cf),
                          )
                      ),
                    ),
                  ),
                  Container(
                    width: 60.0,
                    child: FlatButton(
                      onPressed: () {
                        setState((){
                          if (!word.contains(letters.substring(3,4))){
                            word+= letters.substring(3,4);
                          }
                        });
                      },
                      child: Text(
                          letters.substring(3,4),
                          style: TextStyle(
                            fontSize: 50.0,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF5fb7cf),
                          )
                      ),
                    ),
                  ),
                  Container(
                    width: 60.0,
                    child: FlatButton(
                      onPressed: () {
                        setState((){
                          if (!word.contains(letters.substring(4,5))){
                            word+= letters.substring(4,5);
                          }
                        });
                      },
                      child: Text(
                          letters.substring(4,5),
                          style: TextStyle(
                            fontSize: 50.0,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF5fb7cf),
                          )
                      ),
                    ),
                  ),
                ]
            ),

            Container( ///word selection display
                child: Text(
                  '$word',
                  style: TextStyle(
                    fontSize: 35.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  )
                ),
                color: Color(0xFF5fb7cf),
                margin: EdgeInsets.only(left:60.0, right: 160.0, top: 30.0),
            ),

            Row( ///line and enter
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 40.0),
                ),

                Container(
                  child: Text(
                      "____________________  ",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF5fb7cf),
                      )
                  ),
                ),
                Container(
                  child: FlatButton(
                    onPressed: () {
                      entered = true;
                      print(word);
                      if (wordList.contains(word)){ //check if the word is valid
                        print(wordList.indexOf(word));
                        if(!enteredWords.contains(word)){ //calculate how many words they've gotten so far
                          setState(() {
                            foundWords++;
                          });
                        }
                        setState(() {
                          enteredWords[wordList.indexOf(word)] = word;
                        });
                      }
                      print(nWords);
                      print(foundWords);
                      if (foundWords == nWords){ //if they found all the words
                        print("won");
                        won = true;
                      }

                      ///insert message here? not rly sure

                      //new level:
                      if (won==true){
                        setState(() {
                          level++;
                        });
                        wordList.clear(); //empty word list
                        print(wordList);
                        while(file[i]!=level+1){ //get new words from file
                          wordList.add(file[i]);
                          setState(() {
                            i++; //stop right here in the array for next time
                          });

                        }
                        print(wordList);
                        //reset variables:
                        foundWords = 0;
                        nWords = wordList.length;
                        enteredWords.clear();
                        for(int j = 0; j < wordList.length; j++){
                          enteredWords.add("?");
                        }

                      }


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
            Row( /// first row of words
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    width: 100.0,
                    height: 30.0,
                    child: FlatButton(
                      onPressed: () {},
                      child: Text(
                          enteredWords[0],
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          )
                      ),
                    ),
                    color: Color(0xFF5fb7cf),
                  ),
                  Container(
                    width: 100.0,
                    height: 30.0,
                    child: FlatButton(
                      onPressed: () {},
                      child: Text(
                          enteredWords[1],
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          )
                      ),
                    ),
                    color: Color(0xFF5fb7cf),
                  ),
                ]
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0),
            ),
            Row( /// second row of words
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    width: 100.0,
                    height: 30.0,
                    child: FlatButton(
                      onPressed: () {},
                      child: Text(
                          enteredWords[2],
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          )
                      ),
                    ),
                    color: Color(0xFF5fb7cf),
                  ),
                  Container(
                    width: 100.0,
                    height: 30.0,
                    child: FlatButton(
                      onPressed: () {},
                      child: Text(
                          enteredWords[3],
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          )
                      ),
                    ),
                    color: Color(0xFF5fb7cf),
                  ),
                ]
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0),
            ),
            Row( /// 3
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    width: 100.0,
                    height: 30.0,
                    child: FlatButton(
                      onPressed: () {},
                      child: Text(
                          enteredWords[4],
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          )
                      ),
                    ),
                    color: Color(0xFF5fb7cf),
                  ),
                  Container(
                    width: 100.0,
                    height: 30.0,
                    child: FlatButton(
                      onPressed: () {},
                      child: Text(
                          enteredWords[5],
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          )
                      ),
                    ),
                    color: Color(0xFF5fb7cf),
                  ),
                ]
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0),
            ),
            Row( /// 4
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    width: 150.0,
                    height: 30.0,
                    child: FlatButton(
                      onPressed: () {},
                      child: Text(
                          enteredWords[6],
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          )
                      ),
                    ),
                    color: Color(0xFF5fb7cf),
                  ),
                  Container(
                    width: 150.0,
                    height: 30.0,
                    child: FlatButton(
                      onPressed: () {},
                      child: Text(
                          enteredWords[7],
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          )
                      ),
                    ),
                    color: Color(0xFF5fb7cf),
                  ),
                ]
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0),
            ),
            Row( /// 5
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    width: 150.0,
                    height: 30.0,
                    child: FlatButton(
                      onPressed: () {},
                      child: Text(
                          enteredWords[8],
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          )
                      ),
                    ),
                    color: Color(0xFF5fb7cf),
                  ),
                  Container(
                    width: 150.0,
                    height: 30.0,
                    child: FlatButton(
                      onPressed: () {},
                      child: Text(
                          enteredWords[9],
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          )
                      ),
                    ),
                    color: Color(0xFF5fb7cf),
                  ),
                ]
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0),
            ),
            Row( /// 6
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    width: 150.0,
                    height: 30.0,
                    child: FlatButton(
                      onPressed: () {},
                      child: Text(
                          enteredWords[10],
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          )
                      ),
                    ),
                    color: Color(0xFF5fb7cf),
                  ),
                  Container(
                    width: 150.0,
                    height: 30.0,
                    child: FlatButton(
                      onPressed: () {},
                      child: Text(
                          enteredWords[11],
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          )
                      ),
                    ),
                    color: Color(0xFF5fb7cf),
                  ),
                ]
            ),
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
                        setState((){
                          word = "";
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
                ]
            ),
          ]
      ),
    );
  }
}




