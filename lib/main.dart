import 'package:flutter/material.dart';
import 'package:instagram_copy/screens/home.dart';

import 'components/ProfilePhoto.dart';
import 'components/header.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColorLight: Colors.white, primaryColorDark: Colors.black
          // primarySwatch: Colors.blue,
          ),
      home: Swipe(),
    );
  }
}

class Swipe extends StatelessWidget {
   Swipe({Key? key}) : super(key: key);
  final _controller = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {

    return PageView(
      controller: _controller,
      children: const [MyHomePage(),Scaffold(body: Text("aa"),)],
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentPage = 0;
  List<Widget> screens = [ Home(),const Text("search"),const Text("Reels"),const Text("Shop"),const Text("Profile")];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Header(),
      ),
      body: SingleChildScrollView(child: screens[currentPage]),

      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              blurStyle: BlurStyle.outer,
              color: Colors.black,
              blurRadius: 5,
            ),
          ],
        ),
        child: BottomNavigationBar(
          selectedItemColor: Colors.black,
          elevation: 10,
          currentIndex: currentPage,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          onTap: onTabTapped,
          items:  const [
            BottomNavigationBarItem(label: "", icon: Icon(Icons.home_outlined)),
            BottomNavigationBarItem(label: "", icon: Icon(Icons.search_rounded)),
            BottomNavigationBarItem(
                label: "", icon: Icon(Icons.play_circle_sharp)),
            BottomNavigationBarItem(
                label: "", icon: Icon(Icons.shopping_bag_outlined)),
            BottomNavigationBarItem(label: "", icon: ProfilePhoto())
          ],
        ),
      ),
    );
  }
  void onTabTapped(int index) {
    setState(() {
      currentPage = index;
    });
  }
}





