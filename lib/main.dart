import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Tones(),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Tones extends StatefulWidget {
  @override
  State<Tones> createState() => _TonesState();
}

class _TonesState extends State<Tones> {
  void playSound(int number) {
    final player = AudioPlayer();
    player.play(AssetSource('note$number.wav'));
  }

  Expanded buildKey(Color color, int soundNumber) => Expanded(
        child: FilledButton(
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll<Color>(color),
          ),
          onPressed: () {
            playSound(soundNumber);
          },
          child: Container(),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        buildKey(Colors.red, 1),
        buildKey(Colors.orange, 2),
        buildKey(Colors.yellow, 3),
        buildKey(Colors.lightGreen, 4),
        buildKey(Colors.green, 5),
        buildKey(Colors.blue, 6),
        buildKey(Colors.purple, 7),
      ],
    );
  }
}
