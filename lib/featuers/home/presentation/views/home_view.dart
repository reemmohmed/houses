import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:houses/core/subtitel_text_widget.dart';
import 'package:houses/core/titel_text_widget.dart';
import 'package:houses/featuers/home/presentation/views/detail_view.dart';
import 'package:houses/featuers/home/presentation/views/widget/custom_stack_image.dart';
import 'package:houses/featuers/home/presentation/views/widget/shimmer_image.dart';
import 'dart:async';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    // Simulate loading for 4 seconds
    Timer(const Duration(seconds: 4), () {
      if (mounted) {
        setState(() {
          _loading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: SingleChildScrollView(
          child: Column(
            // padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            children: [
              const SizedBox(height: 2),
              TitelTextWidget(
                text: "Find your dream home",
                fontSize: size.width * 0.06,
                color: Colors.black87,
              ),

              const SizedBox(height: 8),
              SubtitelTextWidget(
                text: "Browse the best offers carefully curated for you",
                fontSize: size.width * 0.038,
                color: Colors.black54,
              ),

              const SizedBox(height: 20),

              _loading
                  ? Column(
                      children: List.generate(5, (index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ShimmerImage(),
                            const SizedBox(height: 12),
                            ShimmerLine(width: size.width * 0.6),
                            const SizedBox(height: 8),
                            ShimmerLine(width: size.width * 0.35),
                            const SizedBox(height: 25),
                          ],
                        );
                      }),
                    )
                  : Column(
                      children: List.generate(5, (index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                            bottom: kIsWeb ? 50 : 12,
                          ),
                          child: CustomStackImage(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (_) => DetailView()),
                              );
                            },
                          ),
                        );
                      }),
                    ),

              /// ✨ الفوتر بقى في الآخر طبيعي
              buildContactFooter(),
            ],
          ),
        ),
      ),

      //  Padding(
      //   padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       TitelTextWidget(
      //         text: "Find your dream home",
      //         fontSize: size.width * 0.06,
      //         color: Colors.black87,
      //       ),

      //       const SizedBox(height: 8),
      //       SubtitelTextWidget(
      //         text: "Browse the best offers carefully curated for you",
      //         fontSize: size.width * 0.038,
      //         color: Colors.black54,
      //       ),

      //       const SizedBox(height: 20),
      //       Expanded(
      //         child: _loading
      //             ? ListView.builder(
      //                 itemCount: 5,
      //                 // separatorBuilder: (_, __) => const SizedBox(height: 20),
      //                 itemBuilder: (context, index) {
      //                   return Column(
      //                     crossAxisAlignment: CrossAxisAlignment.start,
      //                     children: [
      //                       ShimmerImage(),
      //                       const SizedBox(height: 12),
      //                       ShimmerLine(width: size.width * 0.5),
      //                       const SizedBox(height: 8),
      //                       ShimmerLine(width: size.width * 0.35),
      //                     ],
      //                   );
      //                 },
      //               )
      //             : ListView.builder(
      //                 itemBuilder: (context, index) {
      //                   // final home = _homes[index];
      //                   return CustomStackImage(
      //                     onTap: () {
      //                       Navigator.push(
      //                         context,
      //                         MaterialPageRoute(builder: (_) => DetailView()),
      //                       );
      //                     },
      //                   );
      //                 },
      //               ),
      //       ),
      //       buildContactFooter(),
      //     ],
      //   ),
      // ),
    );
  }
}

Widget buildContactFooter() {
  return Container(
    margin: const EdgeInsets.only(top: 30, bottom: 20),
    padding: const EdgeInsets.all(22),
    decoration: BoxDecoration(
      gradient: const LinearGradient(
        colors: [Color(0xFF1F1C2C), Color(0xFF928DAB)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderRadius: BorderRadius.circular(25),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.25),
          blurRadius: 25,
          offset: const Offset(0, 15),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Center(
          child: Text(
            "Contact Us",
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
        ),
        const SizedBox(height: 25),

        _contactItem(Icons.location_on, "Alexandria, Egypt"),
        const SizedBox(height: 15),
        _contactItem(Icons.phone, "+20 123 456 789"),
        const SizedBox(height: 15),
        _contactItem(Icons.email, "support@dreamhome.com"),

        const SizedBox(height: 25),
        const Divider(color: Colors.white30),
        const SizedBox(height: 18),

        const Text(
          "Follow Us",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 15),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _socialIcon(Icons.facebook),
            _socialIcon(Icons.camera_alt), // Instagram
            _socialIcon(Icons.alternate_email), // Twitter/X
            _socialIcon(Icons.play_arrow), // YouTube
          ],
        ),

        const SizedBox(height: 25),
        const Center(
          child: Text(
            "© 2026 Dream Home • All Rights Reserved",
            style: TextStyle(color: Colors.white60, fontSize: 12),
          ),
        ),
      ],
    ),
  );
}

Widget _contactItem(IconData icon, String text) {
  return Row(
    children: [
      Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.15),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.white, size: 20),
      ),
      const SizedBox(width: 15),
      Text(text, style: const TextStyle(color: Colors.white70, fontSize: 15)),
    ],
  );
}

Widget _socialIcon(IconData icon) {
  return Container(
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: Colors.white.withOpacity(0.15),
      shape: BoxShape.circle,
    ),
    child: Icon(icon, color: Colors.white),
  );
}
