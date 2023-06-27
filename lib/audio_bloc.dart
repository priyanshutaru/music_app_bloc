import 'package:audioplayers/audioplayers.dart';


enum AudioPlayerState { stopped, playing, paused }

class AudioBloc {
  final AudioPlayer audioPlayer;
  final String audioFilePath;
  AudioPlayerState _state;

  AudioBloc({required this.audioFilePath})
      : audioPlayer = AudioPlayer(),
        _state = AudioPlayerState.stopped {
    audioPlayer.onPlayerStateChanged.listen((AudioPlayerState state) {
      _state = state;
    } as void Function(PlayerState event)?);
  }

  AudioPlayerState get state => _state;

  Future<void> play() async {
    if (_state == AudioPlayerState.paused) {
      audioPlayer.resume();
    } else {
      await audioPlayer.play(audioFilePath as Source,);
    }
  }

  Future<void> pause() async {
    if (_state == AudioPlayerState.playing) {
      await audioPlayer.pause();
    }
  }

  Future<void> stop() async {
    await audioPlayer.stop();
  }

  void dispose() {
    audioPlayer.dispose();
  }
}
