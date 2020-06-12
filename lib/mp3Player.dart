import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:emotiv/provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class LocalAudio extends StatefulWidget {
  @override
  _LocalAudio createState() =>  _LocalAudio();
}

class _LocalAudio extends State<LocalAudio> {
  Duration _duration = new Duration();
  Duration _position = new Duration();
  AudioPlayer advancedPlayer;
  AudioCache audioCache;

  @override
  void initState() {
    super.initState();
    initPlayer();
  }

  void initPlayer() {
    advancedPlayer = new AudioPlayer();
    audioCache = new AudioCache(fixedPlayer: advancedPlayer);

    advancedPlayer.durationHandler = (d) => setState(() {
          _duration = d;
        });

    advancedPlayer.positionHandler = (p) => setState(() {
          _position = p;
        });
  }

  String localFilePath;

  Widget _tab(List<Widget> children) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: children
                .map((w) => Container(child: w, padding: EdgeInsets.all(6.0)))
                .toList(),
          ),
        ),
      ],
    );
  }

  Widget _btn(String txt, VoidCallback onPressed) {
    return ButtonTheme(
      minWidth: 48.0,
      child: Container(
        child: RaisedButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            child: txt=='Play'? FaIcon(FontAwesomeIcons.solidPlayCircle,size:40):txt=='Pause'?FaIcon(FontAwesomeIcons.solidPauseCircle,size:40):FaIcon(FontAwesomeIcons.solidStopCircle,size:40),
            color: Colors.transparent,
            textColor: Colors.white,
            onPressed: onPressed),
      ),
    );
  }

  Widget slider() {
    return Slider(
        activeColor: Colors.blue,
        inactiveColor: Colors.white,
        value: _position.inSeconds.toDouble(),
        min: 0.0,
        max: _duration.inSeconds.toDouble(),
        onChanged: (double value) {
          setState(() {
            seekToSecond(value.toInt());
            value = value;
          });
        });
  }

  Widget LocalAudio(BuildContext context) {
    var prov = Provider.of<provider>(context);
    var h=MediaQuery.of(context).size.height;
    var w=MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(prov.selectedSurahName,style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),),
        SizedBox(height: h*0.01,),
        Text('Ayat '+prov.selectedAyatName,style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w500),),
        SizedBox(height: h*0.03,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
              _btn('Play', () => audioCache.play('ayatquran/'+prov.selectedMp3Name)),
              _btn('Pause', () => advancedPlayer.pause()),
              _btn('Stop', () => advancedPlayer.stop()),
          ],
        ),
        slider()
      ],
    );
  }

  void seekToSecond(int second) {
    Duration newDuration = Duration(seconds: second);

    advancedPlayer.seek(newDuration);
  }

  @override
  Widget build(BuildContext context) {
    var h=MediaQuery.of(context).size.height;
    var w=MediaQuery.of(context).size.width;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
        color: Colors.pinkAccent,
        child: Container(
            height: h*0.3,
            width: w*0.7,
            color: Colors.transparent,
            child: LocalAudio(context),
          ),
      ),
    );
  }
}