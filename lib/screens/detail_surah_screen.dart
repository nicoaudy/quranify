import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:hijra/providers/setting_provider.dart';
import 'package:hijra/providers/surah_info_provider.dart';
import 'package:hijra/screens/setting_screen.dart';
import 'package:hijra/services/ApiService.dart';
import 'package:provider/provider.dart';

class DetailSurahScreen extends StatefulWidget {
  final int index;
  final String latin;

  DetailSurahScreen({@required this.index, @required this.latin});

  @override
  _DetailSurahScreenState createState() => _DetailSurahScreenState();
}

class _DetailSurahScreenState extends State<DetailSurahScreen> {
  int bottomIndex = 2;
  bool isPlay = false;
  bool isPause = false;
  AudioPlayer audioPlayer = AudioPlayer();

  void play() async {
    if (!isPlay) {
      final audioUrl = Provider.of<SurahInfoProvider>(context, listen: false)
          .findAudioUrl(widget.index);

      if (isPause) {
        await audioPlayer.resume();
      } else {
        await audioPlayer.play(audioUrl);
      }

      setState(() {
        isPlay = true;
      });
    } else {
      await audioPlayer.pause();
      setState(() {
        isPlay = false;
        isPause = true;
      });
    }
  }

  void stop() async {
    await audioPlayer.stop();
    setState(() {
      isPlay = false;
    });
  }

  void _changeBottomIndex(index) {
    if (index == 1) {
      play();
    } else {
      stop();
    }

    setState(() {
      bottomIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.latin}"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.more_vert),
              color: Theme.of(context).primaryColorLight,
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SettingScreen())))
        ],
      ),
      body: FutureBuilder(
        future: ApiService().loadSurah(widget.index),
        builder: (context, snapshot) {
          final setting = Provider.of<SettingProvider>(context);
          if (snapshot.hasError) return Text('Error: ${snapshot.error}');
          return snapshot.hasData
              ? ListView.builder(
                  physics: AlwaysScrollableScrollPhysics(),
                  itemCount: snapshot.data.text.length,
                  itemBuilder: (BuildContext c, int i) {
                    String key = snapshot.data.text.keys.elementAt(i);
                    return Column(
                      children: <Widget>[
                        if (i == 0)
                          Hero(
                            tag: widget.latin,
                            child: Image.asset('assets/bismillah.jpg'),
                          ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 1.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              ListTile(
                                leading: Container(
                                  padding: EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Theme.of(context).primaryColor),
                                  child: Text(
                                    snapshot.data.text.keys.elementAt(i),
                                    style: TextStyle(
                                      color:
                                          Theme.of(context).primaryColorLight,
                                    ),
                                  ),
                                ),
                                title: Text(
                                  '${snapshot.data.text[key]}',
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                    fontSize: setting.arabSize,
                                    height: 1.5,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(15.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Terjemah',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      snapshot.data.translations.id.text[key],
                                    ),
                                  ],
                                ),
                              ),
                              if (setting.tafsir)
                                Padding(
                                  padding: EdgeInsets.all(15.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Tafsir Kemenag',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        snapshot
                                            .data.tafsir.id.kemenag.text[key],
                                      ),
                                    ],
                                  ),
                                )
                            ],
                          ),
                        )
                      ],
                    );
                  },
                )
              : Center(child: CircularProgressIndicator());
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: bottomIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.stop), title: Text('Stop')),
          BottomNavigationBarItem(
            icon: Icon(isPlay ? Icons.pause : Icons.play_arrow),
            title: Text('${!isPlay ? "Play" : "Pause"}'),
          ),
        ],
        onTap: _changeBottomIndex,
      ),
    );
  }
}
