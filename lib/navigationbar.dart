import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Navigation extends StatelessWidget {
  const Navigation({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          label: 'ADD',
          icon: IconButton(
            onPressed: () {},
            icon: Icon(Icons.add),
          ),
        ),
        BottomNavigationBarItem(
            label: 'HOME',
            icon: IconButton(
              onPressed: () {},
              icon: Icon(Icons.home),
            ))
      ],
    );
  }
}
