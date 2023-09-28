import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sample_app/Screens/favouriteItem.dart';
import 'package:sample_app/Screens/fullSize.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _auth = FirebaseAuth.instance;
  late User loggedInUser;

  void getCurrentUser() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  List images = [];
  int page = 1;

  fetchApi() async {
    await http.get(Uri.parse('https://api.pexels.com/v1/curated?per_page=80'),
        headers: {
          'Authorization':
              'eeJr1k9p802wc3xhj3n2AMQGZFNc3a01iyuu1DXAffWwEGWhDYYYjFph'
        }).then((value) {
      Map result = jsonDecode(value.body);
      setState(() {
        images = result['photos'];
      });
    });
  }

  loadMore() async {
    setState(() {
      page = page + 1;
    });
    String url = 'https://api.pexels.com/v1/curated?per_page=80&page=$page';
    await http.get(Uri.parse(url), headers: {
      'Authorization':
          'eeJr1k9p802wc3xhj3n2AMQGZFNc3a01iyuu1DXAffWwEGWhDYYYjFph'
    }).then((value) {
      Map result = jsonDecode(value.body);
      setState(() {
        images.addAll(result['photos']);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getCurrentUser();
    fetchApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: const Padding(
          padding: EdgeInsets.all(6.0),
          child: CircleAvatar(
            child: Text(
              'Hello',
              style: TextStyle(color: Colors.white70),
            ),
          ),
        ),
        title: const Text(
          'Wallpaper',
          style: TextStyle(color: Colors.white70, letterSpacing: 3.0),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FavItem()),
                );
              },
              child: const Icon(
                Icons.favorite,
                color: Colors.red,
              ),
            ),
          ),
          IconButton(
              onPressed: () {
                _auth.signOut();
                Navigator.pop(context);
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: Column(children: [
        Expanded(
          child: GridView.builder(
            itemCount: images.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 2 / 3,
                crossAxisSpacing: 2,
                mainAxisSpacing: 2),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FullSizePhoto(
                        image: images[index]['src']['large2x'],
                      ),
                    ),
                  );
                },
                child: Container(
                  color: Colors.white10,
                  child: Image.network(
                    images[index]['src']['tiny'],
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
        InkWell(
          onTap: () {
            loadMore();
          },
          child: Container(
            height: 40,
            width: double.infinity,
            color: Colors.black,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Load More ',
                  style: TextStyle(
                      color: Colors.white70,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700),
                ),
                Icon(
                  Icons.arrow_downward_sharp,
                  color: Colors.white70,
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
