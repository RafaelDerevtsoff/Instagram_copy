
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: Image.asset(
          'assets/images/Logo.png',
          width: 100,
          height: 80,
        ),
      ),
     const Spacer(flex: 5,),

      Flexible(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: IconButton(
              padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
              onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("text creating new Post!"))),
              icon: const Icon(
                Icons.add_box_outlined,
                color: Colors.black,
              )),
        ),
      ),
      const SizedBox(
        width: 10,
      ),
      Flexible(
        child: IconButton(
            padding: const EdgeInsets.all(0.0),
            onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Activity history!"))),
            icon: const Icon(
              Icons.heart_broken,
              color: Colors.black,
            )),
      ),
      const SizedBox(width: 10),
      Flexible(
        child: IconButton(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            onPressed: () => ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text("Chats!"))),
            icon: const Icon(
              Icons.chat,
              color: Colors.black,
            )),
      ),
    ]);
  }
}
