import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:houses/core/const/image_app.dart';
import 'package:houses/core/titel_text_widget.dart';
import 'package:houses/featuers/home/presentation/views/widget/detailI_mage.dart';
import 'package:houses/featuers/home/presentation/views/widget/image_carousel.dart';
import 'package:houses/featuers/home/presentation/views/widget/product_info.dart';
import 'package:houses/featuers/home/presentation/views/widget/shimmer_box.dart';

class DetailView extends StatefulWidget {
  const DetailView({super.key});

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  bool _loading = true;
  int _currentImageIndex = 0;

  final List<String> images = [
    ImageApp.one,
    ImageApp.tow,
    ImageApp.three,
    ImageApp.four,
    ImageApp.five,
  ];

  @override
  void initState() {
    super.initState();
    // Simulate loading
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) setState(() => _loading = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,

        title: FittedBox(
          fit: BoxFit.scaleDown, // يقلل حجم النص لو كبير
          child: Text(
            "Detail View",
            style: TextStyle(
              fontSize: kIsWeb
                  ? size.width * 0.05
                  : size.width * 0.04, // الحد الأقصى لحجم النص
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        // title: TitelTextWidget(
        //   text: "Detail View",
        //   fontSize: kIsWeb ? size.width * 0.05 : size.width * 0.04,
        //   color: Colors.white,
        // ),
        backgroundColor: Colors.blueGrey[800],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: _loading
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShimmerBox(height: size.width * 0.7, borderRadius: 20),
                  const SizedBox(height: 16),
                  ShimmerBox(height: 24, width: size.width * 0.6),
                  const SizedBox(height: 12),
                  ShimmerBox(height: 16, width: size.width * 0.8),
                  const SizedBox(height: 8),
                  ShimmerBox(height: 16, width: size.width * 0.5),
                  const SizedBox(height: 20),
                  ShimmerBox(
                    height: 48,
                    width: double.infinity,
                    borderRadius: 12,
                  ),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 12),
                  DetailImage(imageUrl: images[_currentImageIndex], size: size),
                  const SizedBox(height: 12),
                  ImageCarousel(
                    images: images,
                    currentIndex: _currentImageIndex,
                    onTap: (index) {
                      setState(() {
                        _currentImageIndex = index;
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  ProductInfo(size: size),
                  const SizedBox(height: 200),
                ],
              ),
      ),
    );
  }
}
