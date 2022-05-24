import 'package:flutter/material.dart';

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
      home: const MyHomePage(title: 'Instagram'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Image.asset(
              'assets/images/Logo.png',
              width: 100,
              height: 80,
            ),
          ),
          SizedBox(
            width: 190,
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: IconButton(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text("text creiating new Post!"))),
                  icon: const Icon(
                    Icons.add_box_outlined,
                    color: Colors.black,
                  )),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Flexible(
            child: IconButton(
                padding: EdgeInsets.all(0.0),
                onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Activity history!"))),
                icon: const Icon(
                  Icons.heart_broken,
                  color: Colors.black,
                )),
          ),
          SizedBox(width: 10),
          Flexible(
            child: IconButton(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                onPressed: () => ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(content: Text("Chats!"))),
                icon: const Icon(
                  Icons.chat,
                  color: Colors.black,
                )),
          ),
        ]),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(label: "", icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: "", icon: Icon(Icons.search_rounded)),
          BottomNavigationBarItem(
              label: "", icon: Icon(Icons.play_circle_sharp)),
          BottomNavigationBarItem(
              label: "", icon: Icon(Icons.shopping_bag_outlined)),
          BottomNavigationBarItem(label: "", icon: ProfilePhoto())
        ],
      ),
    );
  }
}

class ProfilePhoto extends StatelessWidget {
  const ProfilePhoto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30.0,
      height: 30.0,
      decoration: const BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage("assets/images/profile.jpg"),
          )),
    );
  }
}
