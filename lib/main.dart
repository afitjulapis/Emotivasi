import 'dart:convert';
import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:emotiv/ayatSenaraiAyat.dart';
import 'package:emotiv/mp3Player.dart';
import 'package:emotiv/provider.dart';
import 'package:emotiv/quoteAll.dart';
import 'package:emotiv/quoteFav.dart';
import 'package:emotiv/quoteMainPage.dart';
import 'package:emotiv/pengenalan.dart';
import 'package:emotiv/doaMainPage.dart';
import 'package:emotiv/ayatMainPage.dart';
import 'package:emotiv/quoteSearch.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
// import 'package:font_awesome_flutter_example/icons.dart';

void main() => runApp(
  MultiProvider(
    providers: [
      ChangeNotifierProvider.value(value: provider(),),
    ],
    child: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: '/',
      routes: {
        '/home': (context) => MyHomePage(),
        '/intro': (context) => Pengenalan(),
        '/quote': (context) => MainQuote(),
        '/doa': (context) => MainDoa(),
        '/quoteall': (context) => QuoteAll(),
        '/quotefav': (context) => QuoteFav(),
        '/quotesearch': (context) => QuoteSearch(),
        '/senaraisurah': (context) => MainSurah(),
        '/senaraiayat': (context) => SenaraiAyat(),
        '/mp3Player': (context) => LocalAudio(),


        




      },
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    var h=MediaQuery.of(context).size.height;
    var w=MediaQuery.of(context).size.width;
    var rngen=Random();


    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            child: Image.asset('asset/bg1.png',fit: BoxFit.fitHeight,),
            height: h,
          ),
          Container(
            height: h,
            color: Colors.black26,
          ),
          Container(
            height: h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // Container(
                    //   width: w*0.1,
                    //   height: h*0.03,
                    //   child: Image.asset('asset/logo.png',fit: BoxFit.fill,),
                    // ),
                    Text('FAIQAH  feat.  FPTV UTHM 2020',style: TextStyle(color:Colors.white,fontSize: 10),)
                  ],
                )
              ],
            ),
          ),
          Column(
            children: <Widget>[
              SizedBox(height: h*0.05,),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    // SizedBox(width: w*0.02,),
                    Icon(Icons.home,size: 30,color: Colors.white,),
                    Icon(Icons.exit_to_app,size: 30,color: Colors.white,)

                  ],
                ),
              ),
              SizedBox(height: h*0.05,),
              Container(
                height: h*0.15,
                width: w*0.9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: h*0.1,
                      child: Image.asset('asset/ico1.png'),
                    ),
                    SizedBox(width: w*0.05,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Aplikasi',style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.w500),),
                        Text('E-Motivasi',style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.w500),),

                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: h*0.01,),
              Container(
                width: w*0.5,
                child: Text('Pembangunan Sosial Kendiri Melalui Al-Quran',style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w400),textAlign: TextAlign.center,)
              ),
              SizedBox(height: h*0.03,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  InkWell(
                    onTap: (){
                      Navigator.of(context).pushNamed('/intro');
                    },
                    child: Container(
                      height: h*0.15,
                      width: w*0.44,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(2, 2),
                            color:Colors.black26,
                            blurRadius: 2,
                            spreadRadius: 2
                          )
                          
                          ],
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          FaIcon(FontAwesomeIcons.bookReader,size: 50,color: Colors.pink[800],),
                          SizedBox(height: h*0.01,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('Pengenalan',style: TextStyle(color: Colors.grey[900],fontSize: 18,fontWeight: FontWeight.w500),),
                              // Text('E-Motivasi',style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.w500),),

                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: w*0.02,),
                  InkWell(
                    onTap: (){
                      Navigator.of(context).pushNamed('/doa');
                    },
                    child: Container(
                      height: h*0.15,
                      width: w*0.44,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(2, 2),
                            color:Colors.black26,
                            blurRadius: 2,
                            spreadRadius: 2
                          )
                          
                          ],
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          FaIcon(FontAwesomeIcons.hands,size: 50,color: Colors.pink[800],),
                          SizedBox(height: h*0.01,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('Doa',style: TextStyle(color: Colors.black87  ,fontSize: 18,fontWeight: FontWeight.w500),),
                              // Text('E-Motivasi',style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.w500),),

                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: w*0.02,),
              InkWell(
                onTap: (){
                  Navigator.of(context).pushNamed('/senaraisurah');
                },
                child: Container(
                  height: h*0.15,
                  width: w*0.9,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(2, 2),
                        color:Colors.black26,
                        blurRadius: 2,
                        spreadRadius: 2
                      )
                      
                      ],
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          FaIcon(FontAwesomeIcons.quran,size: 50,color: Colors.pink[800],),
                          SizedBox(width: h*0.01,),
                          Column(
                            children: <Widget>[
                              Text('Potongan Al-Quran',style: TextStyle(color: Colors.black87  ,fontSize: 18,fontWeight: FontWeight.w500)),
                              Text('بِسۡمِ ٱللَّهِ ٱلرَّحۡمَـٰنِ ٱلرَّحِيمِ',style: TextStyle(color: Colors.pink[800],fontSize: 20,fontWeight: FontWeight.w800),),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height:w*0.02,),
              InkWell(
                child: Container(
                  height: h*0.27,
                  width: w*0.9,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(2, 2),
                        color:Colors.black26,
                        blurRadius: 2,
                        spreadRadius: 2
                      )
                      
                      ],
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          FaIcon(FontAwesomeIcons.graduationCap,size: 50,color: Colors.pink[800],),
                          SizedBox(width: h*0.01,),
                          Column(
                            children: <Widget>[
                              Text('Kata-kata Hikmah',style: TextStyle(color: Colors.black87  ,fontSize: 18,fontWeight: FontWeight.w500)),
                              // Text('"All Iz Well"',style: TextStyle(color: Colors.pink[800],fontSize: 20,fontWeight: FontWeight.w500),),
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: h*0.01,),
                      Text('Kata Hikmah Rawak',style: TextStyle(color: Colors.pink[900]  ,fontSize: 14,fontWeight: FontWeight.w400)),
                      SizedBox(height: h*0.01,),
                      Container(
                        height: h*0.13,
                        width: w*0.8,
                        decoration: BoxDecoration(
                          color:Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(2, 2),
                              color:Colors.white,
                              blurRadius: 2,
                              spreadRadius: 2
                            )
                          
                          ],
                          border: Border.all(color: Colors.pink[800],width: 3)
                        ),
                        child: Stack(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                SizedBox(width: w*0.02,),
                                FaIcon(FontAwesomeIcons.quoteLeft,size: 25,color: Colors.pink[800],),
                              
                              ],
                            ),
                            Column(
                              mainAxisAlignment:MainAxisAlignment.end ,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    FaIcon(FontAwesomeIcons.quoteRight,size: 25,color: Colors.pink[800],),
                                    SizedBox(width: w*0.02,),

                                  ],
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                FutureBuilder(
                                  future: DefaultAssetBundle.of(context).loadString('lib/DB/quote.json'),
                                  builder: (context,snap){
                                    if (snap.hasData){
                                      var getQuote=json.decode(snap.data.toString());
                                      var randomQuote=rngen.nextInt(getQuote.length);
                                      return Container(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Container(
                                            width: w*0.55,
                                            child: AutoSizeText(getQuote[randomQuote]['quote'],style: TextStyle(color: Colors.pink[900],fontStyle: FontStyle.italic,fontWeight: FontWeight.w500),maxLines: 5,textAlign: TextAlign.center,)
                                          ),
                                          SizedBox(height: h*0.01,),
                                          Container(
                                            width: w*0.55,
                                            child: AutoSizeText('-'+getQuote[randomQuote]['nama']+'-',style: TextStyle(color: Colors.grey[900],fontWeight: FontWeight.w500),textAlign: TextAlign.center,)
                                          ),

                                        ],
                                      ),
                                    );
                                    }else return Container();
                                  }),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                onTap: (){
                  Navigator.of(context).pushNamed('/quote');
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
