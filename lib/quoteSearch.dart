import 'dart:convert';
import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:emotiv/provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuoteSearch extends StatefulWidget {
  @override
  _QuoteSearchState createState() => _QuoteSearchState();
}

class _QuoteSearchState extends State<QuoteSearch> {
  var getQuote;
  TextEditingController editingController = TextEditingController();
  static final _formkey = GlobalKey<FormState>();
  List<int> favQuotes=List<int>();
  Future<void> getFavQuote() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      List<String> myList = (prefs.getStringList('mylist')) ;
      if(myList==null||myList.length==0){
        List<int> favQuotes2=List<int>();
        favQuotes=favQuotes2;
      }else if(myList.length>0){
        favQuotes = myList.map((i)=> int.parse(i)).toList();
      }
      
      print('Your list  $favQuotes');
  }

  Future<void> setquoteList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> myListOfStrings=  favQuotes.map((i)=>i.toString()).toList();
    await prefs.setStringList('mylist', myListOfStrings);
  }
  @override
  void initState() {
    getFavQuote();
    super.initState();
  }

  @override
  Widget doQuotes(BuildContext context,int index){
    var rngen=Random();
    var randomQuote=rngen.nextInt(6);
    var h=MediaQuery.of(context).size.height;
    var w=MediaQuery.of(context).size.width;
    var prov = Provider.of<provider>(context);

    

    return prov.searchResultIndex.length==0? Padding(
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: w*0.7,
                      child: AutoSizeText(getQuote[index]['nama'],style: TextStyle(color: Colors.grey[900],fontWeight: FontWeight.w500,fontSize: 20))
                    ),
                  ],
                ),
                SizedBox(height: h*0.02,),
                Stack(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Container(
                        width: w*0.8,
                        height: h*0.2,
                        child: Image.asset('asset/bgquote/'+randomQuote.toString()+'.jpg',fit: BoxFit.fitWidth,),
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Container(
                        width: w*0.8,
                        height: h*0.2,
                        color: Colors.black26,
                      ),
                    ),
                    Container(
                      width: w*0.8,
                      height: h*0.2,
                      child: Center(child: AutoSizeText(getQuote[index]['quote'],style: TextStyle(color: Colors.white,fontStyle: FontStyle.italic,fontWeight: FontWeight.w500,fontSize: 20),textAlign: TextAlign.center,maxLines: 5,))
                    ),
                  ],
                ),
                SizedBox(height: h*0.02,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    InkWell(
                      onTap: (){
                        if(favQuotes.contains(index)){
                          setState(() {
                            favQuotes.remove(index);
                            setquoteList();
                          });
                        }else{
                          setState(() {
                            favQuotes.add(index);
                            setquoteList();
                          });
                        }
                        
                        
                        print('Ok'+favQuotes.toString());
                      },
                      child: FaIcon(favQuotes.contains(index)?FontAwesomeIcons.solidHeart:FontAwesomeIcons.heart,size: 18,color: Colors.red,)),
                    SizedBox(width: w*0.02,),
                    Text(favQuotes.contains(index)?'Sudah disukai':'Suka',style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w500),),
                    SizedBox(width: w*0.02,),

                  ],
                )
                

              ],
            ),
          ),
        ),
        onTap: (){
          
        },
      ),
    ):prov.searchResultIndex.contains(index)?
    Padding(
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: w*0.7,
                      child: AutoSizeText(getQuote[index]['nama'],style: TextStyle(color: Colors.grey[900],fontWeight: FontWeight.w500,fontSize: 20))
                    ),
                  ],
                ),
                SizedBox(height: h*0.02,),
                Stack(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Container(
                        width: w*0.8,
                        height: h*0.2,
                        child: Image.asset('asset/bgquote/'+randomQuote.toString()+'.jpg',fit: BoxFit.fitWidth,),
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Container(
                        width: w*0.8,
                        height: h*0.2,
                        color: Colors.black26,
                      ),
                    ),
                    Container(
                      width: w*0.8,
                      height: h*0.2,
                      child: Center(child: AutoSizeText(getQuote[index]['quote'],style: TextStyle(color: Colors.white,fontStyle: FontStyle.italic,fontWeight: FontWeight.w500,fontSize: 20),textAlign: TextAlign.center,maxLines: 5,))
                    ),
                  ],
                ),
                SizedBox(height: h*0.02,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    InkWell(
                      onTap: (){
                        if(favQuotes.contains(index)){
                          setState(() {
                            favQuotes.remove(index);
                            setquoteList();
                          });
                        }else{
                          setState(() {
                            favQuotes.add(index);
                            setquoteList();
                          });
                        }
                        
                        
                        print('Ok'+favQuotes.toString());
                      },
                      child: FaIcon(favQuotes.contains(index)?FontAwesomeIcons.solidHeart:FontAwesomeIcons.heart,size: 18,color: Colors.red,)),
                    SizedBox(width: w*0.02,),
                    Text(favQuotes.contains(index)?'Sudah disukai':'Suka',style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w500),),
                    SizedBox(width: w*0.02,),

                  ],
                )
                

              ],
            ),
          ),
        ),
        onTap: (){
          
        },
      )):Container();
  }

  Widget build(BuildContext context) {
    var prov = Provider.of<provider>(context);
    
    var h=MediaQuery.of(context).size.height;
    var w=MediaQuery.of(context).size.width;
    
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
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
                          Form(
                            key: _formkey,
                            child: Container(
                              // color: Colors.pink,
                              height: h*0.05,
                              width: w*0.6,
                              child: TextFormField(
                                controller: editingController,
                                style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,color: Colors.white),
                                decoration: InputDecoration(
                                  hintText: 'Cari Kata Hikmah',
                                  hintStyle: TextStyle(color: Colors.white),
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                ),
                                onSaved: (value) => prov.searchTerm = value,
                                onTap: (){
                                },
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              prov.searchResultIndex=List<int>();
                              _formkey.currentState.save();
                              if(prov.searchTerm.length>0){
                                for(int i=0;i<prov.quoteFull.length;i++){
                                  if(prov.quoteFull[i]['quote'].contains(prov.searchTerm)||prov.quoteFull[i]['nama'].contains(prov.searchTerm)){
                                    setState(() {
                                      prov.searchResultIndex.add(i);
                                    });
                                  }
                                }
                                print(prov.searchResultIndex);
                              }

                            },
                            child: Icon(Icons.search,color:Colors.white,size:30))
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
                        future: DefaultAssetBundle.of(context).loadString('lib/DB/quote.json'),
                        builder: (context,snap){
                          if (snap.hasData){
                            getQuote=json.decode(snap.data.toString());
                            prov.quoteFull=getQuote;
                            // print(prov.quoteFull);
                            return Expanded(
                              child: ListView.builder(
                                itemCount: getQuote.length,
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
      ),
    );
  }
}