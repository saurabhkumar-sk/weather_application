import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Weather",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          const TextField(),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.search),
            label: const Text("Search"),
          ),
          const Text(
            "Min wheather: ",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            "Max wheather: ",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            "Wheather: ",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
