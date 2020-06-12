import 'dart:convert';
import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:chewie/chewie.dart';
import 'package:emotiv/provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class Pengenalan extends StatefulWidget {
  @override
  _PengenalanState createState() => _PengenalanState();
}

class _PengenalanState extends State<Pengenalan> {
  VideoPlayerController vidcon;
  @override
  void initState() {
    // TODO: implement initState
    vidcon = VideoPlayerController.asset(
      'assets/videoIntro/introVID.mp4',
    );
    vidcon.initialize();

    super.initState();
  }

  @override
  void dispose(){
    vidcon.dispose();
    super.dispose();
  }
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              
              SizedBox(height: h*0.15,),
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
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text('Pengenalan',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),),

                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: h*0.02,),
              Container(
                height: h*0.75,
                child: ListView(
                  padding: EdgeInsets.fromLTRB(w*0.02, 0, w*0.02, h*0.02),
                  children: <Widget>[
                    SizedBox(height: h*0.02,),
                    Container(
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
                          SizedBox(height: h*0.02,),
                          Text('Pembuka Kata Aplikasi',style: TextStyle(color: Colors.pink[900]  ,fontSize: 20,fontWeight: FontWeight.w500)),
                          SizedBox(height: h*0.03,),
                          Container(
                            child: Image.asset('asset/introIMG.jpg'),
                          ),
                          SizedBox(height: h*0.03,),
                          Container(
                            width: w*0.8,
                            child:Text(
                              'The fourth major function of an introduction is to establish a connection between the speaker and the audience, and one of the most effective means of establishing a connection with your audience is to provide them with reasons why they should listen to your speech. The idea of establishing a connection is an extension of the notion of caring/goodwill. In the chapters on Language and Speech Delivery, we’ll spend a lot more time talking about how you can establish a good relationship with your audience. However, this relationship starts the moment you step to the front of the room to start speaking .Instead of assuming the audience will make their own connections to your material, you should explicitly state how your information might be useful to your audience. Tell them directly how they might use your information themselves. It is not enough for you alone to be interested in your topic. You need to build a bridge to the audience by explicitly connecting your topic to their possible needs.'
                              ,style: TextStyle(color: Colors.grey[900]  ,fontSize: 16,fontWeight: FontWeight.w400),textAlign: TextAlign.center,) ,
                          ),
                          //PERENGGAN BARU just copy paste dari sini
                          SizedBox(height: h*0.02,),
                          Container(
                            width: w*0.8,
                            child:Text(
                              'The fourth major function of an introduction is to establish a connection between the speaker and the audience, and one of the most effective means of establishing a connection with your audience is to provide them with reasons why they should listen to your speech. The idea of establishing a connection is an extension of the notion of caring/goodwill. In the chapters on Language and Speech Delivery, we’ll spend a lot more time talking about how you can establish a good relationship with your audience. However, this relationship starts the moment you step to the front of the room to start speaking .Instead of assuming the audience will make their own connections to your material, you should explicitly state how your information might be useful to your audience. Tell them directly how they might use your information themselves. It is not enough for you alone to be interested in your topic. You need to build a bridge to the audience by explicitly connecting your topic to their possible needs.'
                              ,style: TextStyle(color: Colors.grey[900]  ,fontSize: 16,fontWeight: FontWeight.w400),textAlign: TextAlign.center,) ,
                          ),
                          //// sampai sini
                          SizedBox(height: h*0.02,),
                        ],
                      ),
                    ),
                    SizedBox(height: h*0.02,),
                    InkWell(
                      onTap: (){
                        
                      },
                      child: Container(
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
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(height: h*0.02,),
                                Text('Video Pembuka',style: TextStyle(color: Colors.pink[900]  ,fontSize: 20,fontWeight: FontWeight.w500)),
                                SizedBox(height: h*0.02,),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: w * 0.8,
                                    child: Chewie(
                                      controller: ChewieController(videoPlayerController: vidcon),
                                    ),
                                  ),
                                ),
                                SizedBox(height: h*0.02,),

                              ],
                            )
                          ],
                        ),
                      ),
                    ),
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