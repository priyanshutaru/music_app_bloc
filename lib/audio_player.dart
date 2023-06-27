import 'package:flutter/material.dart';
import 'audio_bloc.dart';

class AudioPlayerWidget extends StatefulWidget {
  final String audioFilePath;

  AudioPlayerWidget({Key? key, required this.audioFilePath}) : super(key: key);

  @override
  _AudioPlayerWidgetState createState() => _AudioPlayerWidgetState();
}

class _AudioPlayerWidgetState extends State<AudioPlayerWidget> {
  late AudioBloc _audioBloc;

  @override
  void initState() {
    super.initState();
    _audioBloc = AudioBloc(audioFilePath: widget.audioFilePath);
  }

  @override
  void dispose() {
    _audioBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          icon: Icon(_audioBloc.state == AudioPlayerState.playing
              ? Icons.pause
              : Icons.play_arrow),
          onPressed: () {
            setState(() {
              if (_audioBloc.state == AudioPlayerState.playing) {
                _audioBloc.pause();
              } else {
                _audioBloc.play();
              }
            });
          },
        ),
        IconButton(
          icon: Icon(Icons.stop),
          onPressed: () {
            setState(() {
              _audioBloc.stop();
            });
          },
        ),
      ],
    );
  }
}
