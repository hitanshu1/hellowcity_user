//
// import 'package:audioplayers/audioplayers.dart';
// import 'package:hellowcity/app/services/pref_service.dart';
//
//
// enum AudioState{NotSet,Play,Pause,Stop,Next}
// class AppAudioService{
//   // final assetsAudioPlayer = AssetsAudioPlayer();
//  static final player = AudioPlayer();
//
//  static const audioFilesPrefix = 'sounds/';
//  static AudioCache audioCache = new AudioCache(prefix: audioFilesPrefix, fixedPlayer: player);
//
//  bool isPlaying=false;
//  AudioState audioState=AudioState.NotSet;
//  static Duration duration=Duration();
//
//
//
//
//
//  static void playBeep()async{
//    AudioCache _audioCache=AudioCache();
//    // js.AudioPlayer _player2=js.AudioPlayer();
//    // _player2.setVolume(.5);
//    // _player2.setAsset(AppAudioPaths.beep);
//    // _player2.play();
//   }
//   static void onClick()async{
//     AudioCache _audioCache=AudioCache();
//     // js.AudioPlayer _player2=js.AudioPlayer();
//     // _player2.setVolume(.5);
//     // _player2.setAsset(AppAudioPaths.onCLick);
//     // _player2.play();
//   }
//   void playMusicFromAsset(String path,{bool ? change})async{
//     bool _isPlaying=await Prefs.getPlaying();
//     if(change??false){
//       player.stop();
//       audioCache.play(path);
//       Prefs.setPlaying(true);
//     }else{
//       if(!_isPlaying){
//         audioCache.play(path);
//         Prefs.setPlaying(true);
//       }else{
//
//         player.pause();
//         Prefs.setPlaying(false);
//       }
//     }
//
//     // if(audioState==AudioState.NotSet||audioState==AudioState.Stop){
//     //   audioCache.play(path);
//     //   audioState=AudioState.Play;
//     // }else if(audioState==AudioState.Pause){
//     //   player.resume();
//     // }else if(audioState==AudioState.Play){
//     //   player.pause();
//     // }
//
//
//   }
//
//
//
//
//
//   void setMusic(String path)async{
//     // assetsAudioPlayer.open(
//     //   Audio(path),
//     //   // autoStart: false,
//     // );
//     // await player.setUrl(path);
//   }
//   void pauseMusic(){
//    // player.load();
//    player.pause();
//    // assetsAudioPlayer.pause();
//   }
//   void setVolume(double val){
//    player.setVolume(val);
//   }
//   void stopMusic(){
//     // assetsAudioPlayer.stop();
//     player.stop();
//   }
// }