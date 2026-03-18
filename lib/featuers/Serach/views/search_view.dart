import 'package:flutter/material.dart';
import 'package:houses/featuers/Serach/views/widget/airbnb_card.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final TextEditingController _searchController = TextEditingController();

  final List<String> filters = [
    "House",
    "Villa",
    "Apartment",
    "Cairo",
    "Alex",
    "Luxury",
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xffF7F7F7),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// 🔍 Floating Search Bar
            Padding(
              padding: EdgeInsets.all(size.width * .05),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.08),
                      blurRadius: 20,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: TextField(
                  controller: _searchController,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.search_rounded),
                    hintText: "Where do you want to live?",
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),

            /// 🎯 Filters
            SizedBox(
              height: 45,
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: size.width * .05),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Container(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Center(
                    child: Text(
                      filters[index],
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                separatorBuilder: (_, __) => const SizedBox(width: 12),
                itemCount: filters.length,
              ),
            ),

            const SizedBox(height: 20),

            /// 🏡 Results
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * .05),
              child: Text(
                "Recommended",
                style: TextStyle(
                  fontSize: size.width * .055,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 15),

            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: size.width * .05),
                itemCount: 6,
                itemBuilder: (context, index) => AirbnbCard(size: size),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
