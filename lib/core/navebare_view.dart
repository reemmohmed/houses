import 'package:flutter/material.dart';
import 'package:houses/featuers/Serach/views/search_view.dart';
import 'package:houses/featuers/home/presentation/views/home_view.dart';
import 'package:houses/featuers/profile/profile_view.dart';

class NavebareView extends StatefulWidget {
  const NavebareView({super.key});

  @override
  State<NavebareView> createState() => _NavebareViewState();
}

class _NavebareViewState extends State<NavebareView> {
  int selectedIndex = 0;
  late PageController controller;

  final List<Widget> screenPage = const [
    HomeView(),
    SearchView(),
    ProfileView(),
  ];
  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: selectedIndex);
  }

  void onTabTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
    controller.jumpToPage(index);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // محتوى الشاشة
      body: PageView(
        controller: controller,
        physics: const NeverScrollableScrollPhysics(),
        children: screenPage,
      ),

      // الزر العائم في المنتصف
      floatingActionButton: ClipRRect(
        borderRadius: BorderRadiusGeometry.circular(44),
        child: FloatingActionButton(
          backgroundColor: Color(0xff129575),
          onPressed: () {},
          child: const Icon(Icons.add, color: Colors.white),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      // الشريط السفلي
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(), // يعمل فراغ للزر العائم
        notchMargin: 8, // المسافة بين الزر والشريط
        color: Colors.blue,
        child: SizedBox(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.home,
                  color: selectedIndex == 0 ? Colors.white : Colors.white70,
                ),
                onPressed: () => onTabTapped(0),
              ),
              IconButton(
                icon: Icon(
                  Icons.search,
                  color: selectedIndex == 1 ? Colors.white : Colors.white70,
                ),
                onPressed: () => onTabTapped(1),
              ),
              const SizedBox(width: 40), // فراغ للزر العائم

              IconButton(
                icon: Icon(
                  Icons.person,
                  color: selectedIndex == 2 ? Colors.white : Colors.white70,
                ),
                onPressed: () => onTabTapped(2),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
