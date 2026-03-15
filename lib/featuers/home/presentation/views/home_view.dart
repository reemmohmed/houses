import 'package:flutter/material.dart';
import 'package:houses/core/widgets/shimmer_skeleton.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Explore Houses"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Find your dream home",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              "Browse the best offers carefully curated for you",
              style: TextStyle(fontSize: 13, color: Colors.white70),
            ),
            const SizedBox(height: 20),
            Expanded(
              child:
              ListView.separated(
                      itemCount: 6,
                      separatorBuilder: (_, __) => const SizedBox(height: 16),
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            ShimmerSkeleton(height: 200, borderRadius: 20),
                            SizedBox(height: 12),
                            ShimmerSkeleton(height: 16, width: 160),
                            SizedBox(height: 8),
                            ShimmerSkeleton(height: 14, width: 120),
                          ],
                        );
                      },
                    )
               

                 

                  
              
            ),
          ],
        ),
      ),
    );
  }
}
