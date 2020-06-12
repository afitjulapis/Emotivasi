import 'dart:convert';
import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:emotiv/provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class MainDoa extends StatelessWidget {
  var getDoa;
  @override
  Widget doQuotes(BuildContext context,int index){
    var rngen=Random();
    var randomQuote=rngen.nextInt(6);
    var h=MediaQuery.of(context).size.height;
    var w=MediaQuery.of(context).size.width;
    var prov = Provider.of<provider>(context);

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
                      child: AutoSizeText(getDoa[index]['namaDoa'],style: TextStyle(color: Colors.pink[800],fontWeight: FontWeight.w500,fontSize: 20))
                    ),
                  ],
                ),
                SizedBox(height: h*0.02,),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                    width: w*0.8,
                    color: Colors.pink[600],
                    child: Padding(
                      padding:  EdgeInsets.fromLTRB(w*0.05, h*0.02, w*0.05, h*0.02),
                      child: Center(child: AutoSizeText(getDoa[index]['doa'],style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 30),textAlign: TextAlign.center,)),
                    )
                  ),
                ),
                SizedBox(height: h*0.02,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: w*0.8,
                      child: AutoSizeText(getDoa[index]['detail'],style: TextStyle(color: Colors.grey[900],fontStyle: FontStyle.italic,fontWeight: FontWeight.w400,fontSize: 16),textAlign: TextAlign.center,)
                    ),
                  ],
                ),
                SizedBox(height: h*0.02,),
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
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SizedBox(width: w*0.01,),
                        FaIcon(FontAwesomeIcons.book,color: Colors.pink[800],),
                        Text('Senarai Doa',style: TextStyle(color: Colors.grey[900],fontSize: 20,fontWeight: FontWeight.w500),),
                        FaIcon(FontAwesomeIcons.book,color: Colors.pink[800],),
                        SizedBox(width: w*0.01,),


                        
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
                      future: DefaultAssetBundle.of(context).loadString('lib/DB/doa.json'),
                      builder: (context,snap){
                        if (snap.hasData){
                          getDoa=json.decode(snap.data.toString());
                          
                          return Expanded(
                            child: ListView.builder(
                              itemCount: getDoa.length,
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