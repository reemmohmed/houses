import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:houses/core/subtitel_text_widget.dart';
import 'package:houses/featuers/home/presentation/data/logic/cubit/home_cubit.dart';
import 'package:houses/featuers/home/presentation/data/models/home_model.dart';
import 'package:houses/featuers/home/presentation/data/servers/api_home.dart';
import 'package:shimmer/shimmer.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(ApiHome())..fetchProducts(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text("Wellcom To Home "),
          backgroundColor: Colors.white,
          centerTitle: true,
        ),

        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 33),
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if (state is HomeLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is HomeSucsess) {
                final products = state.products;
                return ListView.builder(
                  itemCount: products.length,

                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomStacImage(product: products[index]),
                    );
                  },
                );
              } else if (state is HomeError) {
                return Center(child: Text(state.message));
              }
              return Text("daat");
            },
          ),
        ),
      ),
    );
  }
}

class CustomStacImage extends StatelessWidget {
  const CustomStacImage({super.key, this.onTap, required this.product});
  final void Function()? onTap;
  final HomeModel product;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: SizedBox(
              height: 200,
              width: double.infinity,
              child: Image.network(
                product.imageUrl ?? "https://i.pravatar.cc/300",
                fit: BoxFit.cover,
                width: double.infinity,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: Container(
                      width: double.infinity,
                      height: 200,
                      color: Colors.grey[300],
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: double.infinity,
                    height: 200,
                    color: Colors.grey,
                    child: const Icon(Icons.error, color: Colors.red),
                  );
                },
              ),
            ),
          ),

          // ClipRRect(
          //   borderRadius: BorderRadiusGeometry.circular(16),
          //   child: SizedBox(
          //     height: 200, // تحدد ارتفاع مناسب
          //     width: double.infinity,
          //     child: Image.network(
          //       product.imageUrl ?? "https://i.pravatar.cc/300",
          //       fit: BoxFit.cover,
          //       width: double.infinity,
          //     ),
          //   ),
          // ),
          Positioned(
            left: 20,
            top: 100,
            bottom: 40,
            child: Text(
              product.title ?? "Titel",
              style: TextStyle(color: Colors.white),
            ),
          ),
          Positioned(
            left: 20,
            bottom: 40,
            right: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  product.title ?? "Title",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        blurRadius: 3,
                        offset: Offset(1, 1),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                SubtitelTextWidget(
                  text: product.description ?? "Description",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
