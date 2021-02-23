import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart' as youtube;

class YoutubePlayer extends StatefulWidget {
  final String streamLink;
  final bool autoPlay;
  const YoutubePlayer({
    this.streamLink,
    this.autoPlay = false,
  });
  @override
  _YoutubePlayerState createState() => _YoutubePlayerState();
}

class _YoutubePlayerState extends State<YoutubePlayer> {
  youtube.YoutubePlayerController _controller;
  @override
  void initState() {
    _controller = youtube.YoutubePlayerController(
      initialVideoId: widget.streamLink,
      flags: youtube.YoutubePlayerFlags(
        autoPlay: widget.autoPlay,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return youtube.YoutubePlayer(
      controller: _controller,
      topActions: <Widget>[
        const SizedBox(width: 8.0),
        Expanded(
          child: Text(
            _controller.metadata.title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
        /* IconButton(
          icon: const Icon(
            Icons.settings,
            color: Colors.white,
            size: 25.0,
          ),
          onPressed: () {
            print('Settings Tapped!');
          },
        ), */
      ],
      /* bottomActions: [
        const SizedBox(width: 14.0),
        youtube.CurrentPosition(),
        const SizedBox(width: 8.0),
        youtube.ProgressBar(
          isExpanded: true,
          colors: youtube.ProgressBarColors(
            playedColor: Colors.white,
            handleColor: Colors.white,
          ),
        ),
        youtube.RemainingDuration(),
        const youtube.PlaybackSpeedButton(),
      ], */
      progressIndicatorColor: Colors.white,
      progressColors: youtube.ProgressBarColors(
        playedColor: Colors.white,
        handleColor: Colors.white,
      ),
    );
  }
}
