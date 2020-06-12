import 'dart:convert';
import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:emotiv/provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class MainQuote extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<provider>(context);
    
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
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              
              // SizedBox(height: h*0.05,),
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
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text('Kata Hikmah',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),),

                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: h*0.1,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  InkWell(
                    onTap: (){
                      prov.searchResultIndex=List<int>();
                      prov.searchTerm='';
                      Navigator.of(context).pushNamed('/quotesearch');
                    },
                    child: Container(
                      height: h*0.1,
                      width: w*0.44,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(2, 2),
                            color:Colors.black12,
                            blurRadius: 2,
                            spreadRadius: 2
                          )
                          
                          ],
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white12,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          FaIcon(FontAwesomeIcons.search,size: 30,color: Colors.white,),
                          SizedBox(width: h*0.01,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('Carian',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),),
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
                      Navigator.of(context).pushNamed('/quotefav');
                    },
                    child: Container(
                      height: h*0.1,
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          FaIcon(FontAwesomeIcons.solidHeart,size: 30,color: Colors.pink[800],),
                          SizedBox(width: h*0.01,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('Disukai',style: TextStyle(color: Colors.black87  ,fontSize: 18,fontWeight: FontWeight.w500),),
                              // Text('E-Motivasi',style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.w500),),

                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: h*0.02,),
              Container(
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
                    
                    Text('Kata Hikmah Rawak',style: TextStyle(color: Colors.pink[900]  ,fontSize: 20,fontWeight: FontWeight.w500)),
                    SizedBox(height: h*0.03,),
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
                                    prov.quoteFull=getQuote;
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
              SizedBox(height: h*0.02,),
              InkWell(
                onTap: (){
                  Navigator.of(context).pushNamed('/quoteall');
                },
                child: Container(
                  height: h*0.1,
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      FaIcon(FontAwesomeIcons.list,size: 30,color: Colors.pink[800],),
                      SizedBox(width: h*0.02,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Senarai Kata Hikmah',style: TextStyle(color: Colors.black87  ,fontSize: 18,fontWeight: FontWeight.w500),),
                          // Text('E-Motivasi',style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.w500),),

                        ],
                      )
                    ],
                  ),
                ),
              ),

            ],
          ),
          
        ],
      ),
    );
  }
}