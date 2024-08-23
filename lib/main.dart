import 'package:flutter/material.dart';
import './RandomImages/main.dart';
import './CurrencyConverter/main.dart';
import './First/mainComp.dart';
import './Showcase/main.dart';
import './PasswordGenerator/main.dart';
import './TicTacToe/main.dart';
import './RockPaperScissors/main.dart';
import './Testimonial/main.dart';
void main() {
  runApp(
   const MaterialApp(
    home: MainApp(),
    ),
  );
}
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color:const Color(0xff6A5ACD)
            ),
            width: 300,
            height: 400,
            padding:const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(onPressed: ()
                {Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PasswordGenerator()),
                );}, 
                child:const Text('Password Generator',style: TextStyle(fontSize: 18),)
                ),
                ElevatedButton(onPressed: ()
                {Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CurrencyConverter()),
                );}, 
                child:const Text('Currency Converter',style: TextStyle(fontSize: 18),)
                ),
                ElevatedButton(onPressed: ()
                {Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RandomImages()),
                );}, 
                child:const Text('Random Images',style: TextStyle(fontSize: 18),)
                ),
                ElevatedButton(onPressed: ()
                {Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RockPaperScissors()),
                );}, 
                child:const Text('Rock Paper Scissors',style: TextStyle(fontSize: 18),)
                ),
                ElevatedButton(onPressed: ()
                {Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Showcase()),
                );}, 
                child:const Text('Showcase',style: TextStyle(fontSize: 18),)
                ),
                ElevatedButton(onPressed: ()
                {Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TicTacToe()),
                );}, 
                child:const Text('TicTacToe',style: TextStyle(fontSize: 18),)
                ),
                ElevatedButton(onPressed: ()
                {Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Testimonial()),
                );}, 
                child:const Text('Testimonial',style: TextStyle(fontSize: 18),)
                ),
                ElevatedButton(onPressed: ()
                {Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const First()),
                );}, 
                child:const Text('Showcase 2',style: TextStyle(fontSize: 18),)
                ),
              ],
            ),
          ),
        )
      );
  }
}