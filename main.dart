import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:admob_flutter/admob_flutter.dart';
import 'package:localeyes_app/services/admob_service.dart';

void main() {
  ///for ad
  //Admob.initialize("come.example.localeyes_app");
  int eyes = 0;
  int level = 1;
  runApp(MaterialApp(home: Home(eyes, level)));
}

Future<void> _couponClaim(
	BuildContext context, String coupon, int cost, int eyes, int level) {
  eyes -= cost;
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          'Rules',
          style: TextStyle(
            color: Color(0xFF362d54),
          ),
        ),
        content: Text(
          'ONLY claim a coupon at the time of your purchase by showing the confirmation screen on this app. Your eyes will be deducted after pressing "claim."',
          style: TextStyle(
            color: Color(0xFF362d54),
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text(
              'Claim Coupon',
              style: TextStyle(
                color: Color(0xFF5fb7cf),
              ),
            ),
            onPressed: () {
              return showDialog<void>(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text(
                      'Coupon claimed',
                      style: TextStyle(
                        color: Color(0xFF362d54),
                      ),
                    ),
                    content: Text(
                      'You claimed $coupon for $cost eyes',
                      style: TextStyle(
                        color: Color(0xFF362d54),
                      ),
                    ),
                    actions: <Widget>[
                      FlatButton(
                        child: Text(
                          'Done',
                          style: TextStyle(
                            color: Color(0xFF5fb7cf),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Home(eyes, level)),
                          );
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
          FlatButton(
            child: Text(
              'Do not claim',
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

Future<void> _invalidCoupon(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          'Invalid',
          style: TextStyle(
            color: Color(0xFF362d54),
          ),
        ),
        content: Text(
          'You do not have enough eyes to claim this coupon',
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

Future<void> _levelComplete(BuildContext context, int eyes, int level) {
  eyes += 5;
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
        actions: <Widget>[
          FlatButton(
            child: Text(
              'Continue',
              style: TextStyle(
                color: Color(0xFF5fb7cf),
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Anagrams(eyes, level)),
              );
            },
          ),
        ],
      );
    },
  );
}

class Anagrams extends StatefulWidget {
  final int eyes;
  final int level;
  Anagrams(this.eyes, this.level);
  @override
  _AnagramsState createState() => _AnagramsState(eyes, level);
}

class _AnagramsState extends State<Anagrams> {

  final ams = AdMobService();
  AdmobInterstitial _admobInterstitial;
  AdmobReward _admobReward;

  @override
  void initState(){
    _admobInterstitial = createAdvert();
    _admobReward = createReward();
    super.initState();
    Admob.initialize(ams.getAdMobAppId());
  }

  AdmobReward createReward(){
    return AdmobReward(
        adUnitId: "ca-app-pub-3940256099942544/5224354917",
        listener: (AdmobAdEvent event, Map<String, dynamic> args){
          if(event == AdmobAdEvent.loaded){
            _admobReward.show();
          }else if(event == AdmobAdEvent.closed){
            _admobReward.dispose();
          }else if (event == AdmobAdEvent.rewarded){
            print("type: ${args["type"]}");
            print("reward: ${args["amount"]}");
          }
        });
  }

  AdmobInterstitial createAdvert() {
    return AdmobInterstitial(
        adUnitId: "ca-app-pub-3940256099942544/8691691433",
        listener: (AdmobAdEvent event, Map<String, dynamic> args){
          if(event == AdmobAdEvent.loaded){
            _admobInterstitial.show();
          }else if(event == AdmobAdEvent.closed){
            _admobInterstitial.dispose();
          }
        });
  }

  AlertDialog wrongWord = AlertDialog(
    content: Text(
      "NOT A WORD",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 25.0,
        color: Color(0xFF362d54),
        fontWeight: FontWeight.bold,
      ),
    ),
  );

  AlertDialog wordAlreadyFound = AlertDialog(
    content: Text(
      "WORD ALREADY FOUND",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 25.0,
        color: Color(0xFF362d54),
        fontWeight: FontWeight.bold,
      ),
    ),
  );
  /// anagrams variables
  int eyes;
  int level;
  bool isPressed1 = false;
  bool isPressed2 = false;
  bool isPressed3 = false;
  bool isPressed4 = false;
  bool isPressed5 = false;
  _AnagramsState(this.eyes, this.level);
  int i = 14;
  //pretend "file" is the file
  List file=[1, "IDARY", "DIARY", "DAIRY", "AIR", "RAID", "RAY", "DRAY", "YARD", "ARID", "DAY", "DRY", "AID", 2, "SORDW", "SWORD", "WORDS", "DOWS", "WORD", "ROWS", "RODS", "ROW", "SOW", "ROD", "SOD", 3, "JUICE", "JEU", "CUE", "CUI", "ECU", "ICE"];

  String letters = "IDARY";
  List wordList = ["DIARY", "DAIRY", "AIR", "RAID", "RAY", "DRAY", "YARD", "ARID", "DAY", "DRY", "AID"];
  int nWords = 11;
  bool entered = false;
  String word = "";
  bool won = false;
  List enteredWords = ["_ _ _ _ _", "_ _ _ _ _", "_ _ _", "_ _ _ _", "_ _ _", "_ _ _ _", "_ _ _ _", "_ _ _ _", "_ _ _", "_ _ _", "_ _ _", "?"];
  int foundWords = 0;


  @override
  Widget build(BuildContext context) {
    if (level == null) {
      level = 1;
    }
    return Scaffold(
      appBar: AppBar(
          title: Text(
              'Level $level',
              style: TextStyle(
                fontSize: 20.0,
                color: Color(0xFF362d54),
              )
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home(eyes, level)),
              );
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
                  '$eyes',
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
              padding: EdgeInsets.only(top: 30.0),
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
                          if (isPressed1 == false) {
                            isPressed1 = true;
                          }
                        });
                      },
                      child: Text(
                          letters.substring(
                              0, 1), //change this to get from the array
                          style: TextStyle(
                              fontSize: 50.0,
                              fontWeight: FontWeight.bold,
                              color: (isPressed1)
                                  ? Colors.blueGrey[100]
                                  : Color(0xFF5fb7cf))),
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
                          if (isPressed2 == false) {
                            isPressed2 = true;
                          }
                        });
                      },
                      child: Text(letters.substring(1, 2),
                          style: TextStyle(
                              fontSize: 50.0,
                              fontWeight: FontWeight.bold,
                              color: (isPressed2)
                                  ? Colors.blueGrey[100]
                                  : Color(0xFF5fb7cf))),
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
                          if (isPressed3 == false) {
                            isPressed3 = true;
                          }
                        });
                      },
                      child: Text(letters.substring(2, 3),
                          style: TextStyle(
                              fontSize: 50.0,
                              fontWeight: FontWeight.bold,
                              color: (isPressed3)
                                  ? Colors.blueGrey[100]
                                  : Color(0xFF5fb7cf))),
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
                          if (isPressed4 == false) {
                            isPressed4 = true;
                          }
                        });
                      },
                      child: Text(letters.substring(3, 4),
                          style: TextStyle(
                              fontSize: 50.0,
                              fontWeight: FontWeight.bold,
                              color: (isPressed4)
                                  ? Colors.blueGrey[100]
                                  : Color(0xFF5fb7cf))),
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
                          if (isPressed5 == false) {
                            isPressed5 = true;
                          }
                        });
                      },
                      child: Text(letters.substring(4, 5),
                          style: TextStyle(
                              fontSize: 50.0,
                              fontWeight: FontWeight.bold,
                              color: (isPressed5)
                                  ? Colors.blueGrey[100]
                                  : Color(0xFF5fb7cf))),
                    ),
                  ),
                ]),

            Container( ///word selection display
              child: Center(
                child: Text(
                    '$word',
                    style: TextStyle(
                      fontSize: 35.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF5fb7cf),
                    )
                ),
              ),
              color: Colors.white,

            ),

            Row( ///enter
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 160.0),
                ),
                Container(
                  child: FlatButton(
                    onPressed: () {
                      isPressed1 = false;
                      isPressed2 = false;
                      isPressed3 = false;
                      isPressed4 = false;
                      isPressed5 = false;
                      entered = true;
                      print(word);
                      if (enteredWords.contains(word)){

                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            Future.delayed(Duration(seconds: 1), () {
                              Navigator.of(context).pop(true);
                            });
                            return wordAlreadyFound;
                          },
                        );

                        setState((){
                          word = "";
                        });
                      }else if (wordList.contains(word)){ //check if the word is valid
                        print(wordList.indexOf(word));
                        if(!enteredWords.contains(word)){ //calculate how many words they've gotten so far
                          setState(() {
                            foundWords++;
                          });
                        }
                        setState(() {
                          enteredWords[wordList.indexOf(word)] = word;
                        });
                        setState((){
                          word = "";
                        });
                      }else if (!wordList.contains(word)){

                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            Future.delayed(Duration(seconds: 1), () {
                              Navigator.of(context).pop(true);
                            });
                            return wrongWord;
                          },
                        );
                        setState((){
                          word = "";
                        });
                      }

                      print(nWords);
                      print(foundWords);
                      if (foundWords == nWords){ //if they found all the words
                        print("won");
                        won = true;
                        _admobInterstitial.load();
                      }


                      //new level:
                      Future.delayed(const Duration(milliseconds: 1000), () {
                        if (won == true) {
                          wordList.clear(); //empty word list
                          print(wordList);
                          level++;

                          //get words for next level//

                          //reset variables:
                          foundWords = 0;
                          nWords = wordList.length;
                          enteredWords.clear();
                          for (int j = 0; j < wordList.length; j++) {
                            enteredWords.add("?");
                          }

                          Future.delayed(const Duration(milliseconds: 1000), () {
                            _levelComplete(context, eyes, level);
                          });
                        }
                      });

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
              padding: EdgeInsets.only(top: 20.0),
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
            if (nWords > 4) Row( /// 3
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
                  if (nWords > 5) Container(
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
            if (nWords > 6) Row( /// 4
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    width: 100.0,
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
                  if (nWords > 7) Container(
                    width: 100.0,
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
            if (nWords > 8) Row( /// 5
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    width: 100.0,
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
                  if (nWords > 9) Container(
                    width: 100.0,
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
            if (nWords > 10) Row( /// 6
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    width: 100.0,
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
                  if (nWords > 11) Container(
                    width: 100.0,
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
              padding: EdgeInsets.only(top: 10.0),
            ),
            if (nWords > 12) Row( /// 7
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
                  if (nWords > 13) Container(
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
            if (nWords > 14) Row( /// 8
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
                  if (nWords > 15) Container(
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
            ),if (nWords > 16) Row( /// 9
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
                  if (nWords > 17) Container(
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
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: 70.0,
                    height: 70.0,
                    child: FlatButton(
                      onPressed: () {
                        return showDialog<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text(
                                'Hint',
                                style: TextStyle(
                                  color: Color(0xFF362d54),
                                ),
                              ),
                              content: const Text(
                                'Reveal a letter in one of the words',
                                style: TextStyle(
                                  color: Color(0xFF362d54),
                                ),
                              ),
                              actions: <Widget>[
                                FlatButton(
                                  child: Text(
                                    'Watch an ad',
                                    style: TextStyle(
                                      color: Color(0xFF5fb7cf),
                                    ),
                                  ),
                                  onPressed: (){
                                    _admobInterstitial.load();
                                    bool revealed = false;
                                    for (int j = 0; j < enteredWords.length; j++){
                                      for (int k = 0; k < enteredWords[j].length(); k++){
                                        if(enteredWords[j].charAt(k) == '_'){
                                          String newChar = wordList[j].charAt(k);
                                          enteredWords[j] = enteredWords[j].substring(0,k) + newChar + enteredWords[j].substring(k+1);
                                        }
                                      }
                                    }
                                  },
                                ),
                                FlatButton(
                                  child: Text(
                                    'Use 25 eyes',
                                    style: TextStyle(
                                      color: Color(0xFF5fb7cf),
                                    ),
                                  ),
                                  onPressed: () {
                                    if (eyes >= 25) {
                                      eyes -= 25;
                                      // reveal letter
                                      Navigator.pop(context);
                                    }
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
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
                    width: 70.0,
                    height: 70.0,
                    child: FlatButton(
                      onPressed: () {
                        isPressed1 = false;
                        isPressed2 = false;
                        isPressed3 = false;
                        isPressed4 = false;
                        isPressed5 = false;
                        setState(() {
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
                ]),
            Padding(
              padding: EdgeInsets.only(top: 20.0),
            ),
            /// BANNER AD
            AdmobBanner(
              ///adUnitId: ams.getBannerAdId(),
              adUnitId: 'ca-app-pub-3940256099942544/6300978111',
              adSize: AdmobBannerSize.BANNER,
            ),
          ]),
    );
  }
}

class Home extends StatefulWidget {
  final int eyes;
  final int level;
  Home(this.eyes, this.level);
  @override
  _HomeState createState() => _HomeState(eyes, level);
}

class _HomeState extends State<Home> {
  int eyes;
  int level;
  _HomeState(this.eyes, this.level);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("LocalEyes"),
          centerTitle: true,
          backgroundColor: Color(0xFF362d54),
          leading: IconButton(
            onPressed: () {},
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
                        MaterialPageRoute(
                            builder: (context) => Businesses(eyes)),
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
                        MaterialPageRoute(builder: (context) => Anagrams(eyes, level)),
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
                        MaterialPageRoute(builder: (context) => Rewards(eyes, level)),
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
                          fontSize: 14.0,
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
                          fontSize: 14.0,
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
                          fontSize: 14.0,
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
  final int level;
  Rewards(this.eyes, this.level);
  @override
  _RewardsState createState() => _RewardsState(eyes, level);
}

class _RewardsState extends State<Rewards> {
  int eyes;
  int level;
  int num1 = 5;
  int num2 = 5;
  int num3 = 5;
  String coupon1 = "Coupon 1";
  String coupon2 = "Coupon 2";
  String coupon3 = "Coupon 3";
  _RewardsState(this.eyes, this.level);
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
                        color: (isPressed3)
                            ? Colors.blueGrey[100]
                            : Color(0xFFaee4ed))),
                Container(
                  padding: EdgeInsets.only(left: 50.0, right: 50.0),
                  height: 50.0,
                  child: FlatButton(
                      onPressed: () {
                        if (isPressed1 == true) {
                          if (eyes >= num1) {
                            _couponClaim(context, coupon1, num1, eyes);
                          } else {
                            _invalidCoupon(context);
                          }
                        } else if (isPressed2 == true) {
                          if (eyes >= num2) {
                            _couponClaim(context, coupon2, num2, eyes);
                          } else {
                            _invalidCoupon(context);
                          }
                        } else if (isPressed3 == true) {
                          if (eyes >= num2) {
                            _couponClaim(context, coupon3, num3, eyes);
                          } else {
                            _invalidCoupon(context);
                          }
                        }
                      },

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