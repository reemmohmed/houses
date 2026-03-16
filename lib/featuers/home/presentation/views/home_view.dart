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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
            Expanded(
              child: _loading
                  ? ListView.builder(
                      // itemCount: _homes.length,
                      // separatorBuilder: (_, __) => const SizedBox(height: 20),
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ShimmerImage(),
                            const SizedBox(height: 12),
                            ShimmerLine(width: size.width * 0.5),
                            const SizedBox(height: 8),
                            ShimmerLine(width: size.width * 0.35),
                          ],
                        );
                      },
                    )
                  : ListView.builder(
                  
                      itemBuilder: (context, index) {
                        // final home = _homes[index];
                        return CustomStackImage(
                          onTap: (){
                             Navigator.push(context, MaterialPageRoute(builder: (_) => DetailView()));
                          },
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
