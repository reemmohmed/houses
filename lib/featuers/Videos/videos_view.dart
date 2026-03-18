import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideosView extends StatefulWidget {
  const VideosView({super.key});

  @override
  State<VideosView> createState() => _VideosViewState();
}

class _VideosViewState extends State<VideosView> {
  final PageController _pageController = PageController();

  final List<String> videos = [
    "https://samplelib.com/lib/preview/mp4/sample-5s.mp4",
    "https://samplelib.com/lib/preview/mp4/sample-5s.mp4",
    "https://samplelib.com/lib/preview/mp4/sample-5s.mp4",
    // "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
    // "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",
    // "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView.builder(
        controller: _pageController,
        scrollDirection: Axis.vertical,
        itemCount: videos.length,
        itemBuilder: (context, index) {
          return _VideoItem(videoUrl: videos[index]);
        },
      ),
    );
  }
}

class _VideoItem extends StatefulWidget {
  const _VideoItem({required this.videoUrl});
  final String videoUrl;

  @override
  State<_VideoItem> createState() => _VideoItemState();
}

class _VideoItemState extends State<_VideoItem> {
  late VideoPlayerController _controller;
  bool isLocked = false;
  bool showIcon = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
        _controller.setLooping(true);
      });
  }

  void _togglePlay() {
    if (isLocked) return;

    setState(() => showIcon = true);

    if (_controller.value.isPlaying) {
      _controller.pause();
    } else {
      _controller.play();
    }

    Future.delayed(const Duration(milliseconds: 700), () {
      if (mounted) setState(() => showIcon = false);
    });
  }

  void _toggleLock() {
    setState(() => isLocked = !isLocked);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _togglePlay,
      child: Stack(
        alignment: Alignment.center,
        children: [
          /// Video
          Positioned.fill(
            child: _controller.value.isInitialized
                ? FittedBox(
                    fit: BoxFit.cover,
                    child: SizedBox(
                      width: _controller.value.size.width,
                      height: _controller.value.size.height,
                      child: VideoPlayer(_controller),
                    ),
                  )
                : const Center(child: CircularProgressIndicator()),
          ),

          /// Play / Pause Icon
          AnimatedOpacity(
            duration: const Duration(milliseconds: 200),
            opacity: showIcon ? 1 : 0,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(.4),
                shape: BoxShape.circle,
              ),
              child: Icon(
                _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                color: Colors.white,
                size: 50,
              ),
            ),
          ),

          /// Right Side Buttons
          Positioned(
            right: 16,
            bottom: 120,
            child: Column(
              children: [
                _SideButton(icon: Icons.favorite_border, label: "12K"),
                const SizedBox(height: 20),
                _SideButton(icon: Icons.comment, label: "1.2K"),
                const SizedBox(height: 20),
                _SideButton(icon: Icons.share, label: "Share"),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: _toggleLock,
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: isLocked ? Colors.red : Colors.white24,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      isLocked ? Icons.lock : Icons.lock_open,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),

          /// Bottom Info
          Positioned(
            left: 16,
            bottom: 40,
            right: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "@RealEstatePro",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  "Luxury apartment with amazing sea view 🌊",
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SideButton extends StatelessWidget {
  const _SideButton({required this.icon, required this.label});
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: const BoxDecoration(
            color: Colors.white24,
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: Colors.white),
        ),
        const SizedBox(height: 6),
        Text(label, style: const TextStyle(color: Colors.white)),
      ],
    );
  }
}
