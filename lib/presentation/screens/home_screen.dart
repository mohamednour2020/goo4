
import 'package:flutter/material.dart';
import 'package:goo4/presentation/screens/cart_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text(
          "Home",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        leading: Icon(Icons.person),
        actions: [Icon(Icons.notifications), Icon(Icons.menu)],
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: 18,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (builder)=>
                    CartScreen(imagePath: 'assets/images/noFlag.png',)));
              },
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.cyan,
                  image: DecorationImage(fit: BoxFit.cover,
                      image: AssetImage("assets/images/noFlag.png")),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(children: []),
              ),
            );
          },

          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16

          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        backgroundColor: Colors.cyan,
        mini: true,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}