import 'dart:convert';
import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:emotiv/mp3Player.dart';
import 'package:emotiv/provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class SenaraiAyat extends StatelessWidget {
  var getSurah;
  var fullSurah;
  @override
  Widget doQuotes(BuildContext context,int index){
    var rngen=Random();
    var randomQuote=rngen.nextInt(6);
    var h=MediaQuery.of(context).size.height;
    var w=MediaQuery.of(context).size.width;
    var prov = Provider.of<provider>(context);
    var currentAyat=fullSurah['senaraiAyat'];
    

    return Padding(
      padding:  EdgeInsets.fromLTRB(w*0.05, 0, w*0.05, h*0.02),
      child: InkWell(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(w*0.05, h*0.02, w*0.05, h*0.02),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: AutoSizeText('Ayat Ke-'+currentAyat[index]['noAyat'],style: TextStyle(color: Colors.grey[900],fontWeight: FontWeight.w500,fontSize: 20))
                    ),
                  ],
                ),
                SizedBox(height: h*0.02,),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                    color: Colors.pink[600],
                    width: w*0.8,
                    child: Padding(
                      padding:  EdgeInsets.fromLTRB(w*0.05, h*0.02, w*0.05, h*0.02),
                      child: Center(child: AutoSizeText(currentAyat[index]['ayatArab'],style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 30),textAlign: TextAlign.center,)),
                    )
                  ),
                ),
                SizedBox(height: h*0.02,),
                Text('Terjemahan:',style: TextStyle(color: Colors.grey[900],fontWeight: FontWeight.w500,fontSize: 16)),
                SizedBox(height: h*0.01,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: w*0.8,
                      child: AutoSizeText(currentAyat[index]['maknaAyat'],style: TextStyle(color: Colors.grey[900],fontStyle: FontStyle.italic,fontWeight: FontWeight.w400,fontSize: 16),textAlign: TextAlign.center,)
                    ),
                  ],
                ),
                SizedBox(height: h*0.02,),
                InkWell(
                  onTap: (){
                    prov.selectedMp3Name=currentAyat[index]['namaMp3'];
                    prov.selectedAyatName=currentAyat[index]['noAyat'];
                    print(prov.selectedMp3Name);
                    return showDialog(
                      context: context,
                      barrierDismissible: true,
                      
                      builder: (_) => new AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius:
                            BorderRadius.all(
                              Radius.circular(10.0))),
                          content: Builder(
                            builder: (context) {                         
                              return LocalAudio();
                            },
                          ),
                        )
                  );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      FaIcon(FontAwesomeIcons.solidPlayCircle,size: 25,color: Colors.pink[600],),
                      SizedBox(width: w*0.02,),
                      Text('Dengar Bacaan',style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w500),),
                      SizedBox(width: w*0.02,),

                    ],
                  ),
                )
                

              ],
            ),
          ),
        ),
        onTap: (){
          
        },
      ),
    );
  }
  Widget build(BuildContext context) {
    
    var h=MediaQuery.of(context).size.height;
    var w=MediaQuery.of(context).size.width;
    var prov = Provider.of<provider>(context);
    
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
          Column(
            children: <Widget>[
              SizedBox(height: h*0.05,),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    // SizedBox(width: w*0.02,),
                    InkWell(
                      onTap: (){
                        Navigator.of(context).pop();
                      },
                      child: Icon(Icons.arrow_back_ios,size: 30,color: Colors.white,)),
                    Icon(Icons.exit_to_app,size: 30,color: Colors.white,)

                  ],
                ),
              ),
              SizedBox(height: h*0.05,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: h*0.08,
                    width: w*0.9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(prov.selectedSurahName,style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: h*0.25,),
              Container(
                height: h*0.75,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FutureBuilder(
                      future: DefaultAssetBundle.of(context).loadString('lib/DB/ayat.json'),
                      builder: (context,snap){
                        if (snap.hasData){
                          getSurah=json.decode(snap.data.toString());
                          fullSurah=getSurah[prov.selectedSurahIndex];
                          print(fullSurah);
                          
                          return Expanded(
                            child: ListView.builder(
                              itemCount: getSurah.length,
                              itemBuilder:doQuotes),
                          );
                        }else return Container();
                      }),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}