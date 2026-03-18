import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:houses/core/const/app_color.dart';
import 'package:houses/featuers/Serach/views/search_view.dart';
import 'package:houses/featuers/chat/views/chat_view.dart';
import 'package:houses/featuers/home/presentation/views/home_view.dart';
import 'package:houses/featuers/Videos/Videos_view.dart';

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  late List<Widget> pages;
  late int curntScreen = 0;
  late PageController controller;

  @override
  void initState() {
    pages = [HomeView(), SearchView(), ChatView(), VideosView()];
    controller = PageController(initialPage: curntScreen);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent, // 🔥 تمنع الدايرة
          // highlightColor: Colors.transparent, // 🔥 تمنع المستطيل
        ),
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColors.primary,
          ),
          child: BottomNavigationBar(
            elevation: 0,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,

            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              setState(() => curntScreen = index);
              controller.jumpToPage(curntScreen);
            },

            currentIndex: curntScreen,
            backgroundColor: Colors.transparent,

            items: [
              BottomNavigationBarItem(
                label: "Home",
                icon: Icon(CupertinoIcons.home),
              ),
              BottomNavigationBarItem(
                label: "search",
                icon: Icon(CupertinoIcons.search),
              ),
              BottomNavigationBarItem(label: "chat", icon: Icon(Icons.chat)),
              BottomNavigationBarItem(
                label: "Videos",
                icon: Icon(CupertinoIcons.plus_rectangle_on_rectangle),
              ),
            ],
          ),
        ),
      ),
      body: PageView(
        controller: controller,
        physics: NeverScrollableScrollPhysics(),
        children: pages,
      ),
    );
  }
}
