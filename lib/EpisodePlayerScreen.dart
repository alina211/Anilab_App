import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

class EpisodePlayerScreen extends StatefulWidget {
  final String videoUrl;
  final String episodeId;

  EpisodePlayerScreen(this.videoUrl, this.episodeId);

  @override
  _EpisodePlayerScreenState createState() => _EpisodePlayerScreenState();
}

class _EpisodePlayerScreenState extends State<EpisodePlayerScreen> {
  late VideoPlayerController _controller;
  bool isDownloading = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {});
      });
  }

  Future<void> _downloadVideo() async {
    setState(() {
      isDownloading = true;
    });
    try {
      final dio = Dio();
      final dir = await getApplicationDocumentsDirectory();
      final filePath = '${dir.path}/${widget.episodeId}.mp4';
      await dio.download(widget.videoUrl, filePath);
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Download Complete: $filePath')));
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Download Failed')));
    } finally {
      setState(() {
        isDownloading = false;
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Episode Player')),
      body: Column(
        children: [
          if (_controller.value.isInitialized)
            AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            ),
          IconButton(
            icon: Icon(_controller.value.isPlaying ? Icons.pause : Icons.play_arrow),
            onPressed: () {
              setState(() {
                _controller.value.isPlaying ? _controller.pause() : _controller.play();
              });
            },
          ),
          isDownloading
              ? CircularProgressIndicator()
              : ElevatedButton(
            child: Text('Download Episode'),
            onPressed: _downloadVideo,
          ),
        ],
      ),
    );
  }
}
