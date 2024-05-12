import 'package:coffee/coffee_tile.dart';
import 'package:coffee/coffee_types.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void coffeeTypeSelected(int index) {
    setState(
      () {
        for (int i = 0; i < coffeeType.length; i++) {
          coffeeType[i][1] = false;
        }
        coffeeType[index][1] = true;
      },
    );
  }

  final List coffeeType = [
    ['Cappucino', false],
    ['Black', false],
    ['Latte', false],
    ['Tea', false],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(Icons.menu),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Icon(Icons.person),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ''),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              'Find the best Coffee for you ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 35,
              ),
            ),
          ),
          SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: TextField(
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade600)),
                prefixIcon: Icon(Icons.search),
                hintText: 'Find your coffee...',
                prefixIconColor: Colors.white54,
              ),
            ),
          ),
          SizedBox(height: 30),
          Container(
            height: 40,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: coffeeType.length,
              itemBuilder: (context, index) {
                return CoffeeType(
                  coffeeType: coffeeType[index][0],
                  isSelected: coffeeType[index][1],
                  onTap: () {
                    coffeeTypeSelected(index);
                  },
                );
              },
            ),
          ),
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                CoffeeTile(
                  coffeeImagePath: 'images/Espresso.jpg',
                  coffeeName: 'Espresso',
                  coffeePrice: '4.20',
                ),
                CoffeeTile(
                  coffeeImagePath: 'images/Cold Coffee.jpg',
                  coffeeName: 'Cold Coffee',
                  coffeePrice: '8.80',
                ),
                CoffeeTile(
                  coffeeImagePath: 'images/Latte.jpg',
                  coffeeName: 'Latte',
                  coffeePrice: '5.40',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
