import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sample_app/Screens/fullSize.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    fetchApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.purple,
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
          'App Name',
          style: TextStyle(color: Colors.white70),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.favorite_outline),
          )
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
                  color: Colors.greenAccent,
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
          onTap: () => loadMore(),
          child: Container(
            height: 40,
            width: double.infinity,
            color: Colors.black,
            child: const Center(
              child: Text(
                'Refresh',
                style: TextStyle(
                    color: Colors.white70,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
