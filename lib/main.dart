import 'package:audioplayers/src/audio_cache.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  int _counter = 0;

  void _incrementCounter() {
    FlameAudio.play('sounds/attack1.wav');
    // setState(() {
    _counter++;
    // });
  }

  @override
  Widget build(BuildContext context) {
    // FlameAudio.loop('music/Burp.mp3');
    AudioCache audio = FlameAudio.audioCache;
    // FlameAudio.bgm.clearAll();
    audio.clearAll().then((e) {});
    FlameAudio.bgm.initialize();
    FlameAudio.bgm.play('music/Choose_a_File.mp3');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
