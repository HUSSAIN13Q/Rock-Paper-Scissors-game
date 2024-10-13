import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int player1 = 0; //players score
  int player2 = 0;

  String playChoice1 = "rock"; //the choice of the players
  String playChoice2 = "rock";

  String winner = "";
  List<String> x = ["paper", "rock", "scissors"];

  void play() {
    setState(() {
      playChoice1 =
          x[Random().nextInt(3)]; //randomize the player choice (max of 3)
      playChoice2 = x[Random().nextInt(3)];

      // Determine the winner based on the choices
      if (playChoice1 == playChoice2) {
        winner = "Tie";
      } else if ((playChoice1 == "rock" && playChoice2 == "scissors") ||
          (playChoice1 == "scissors" && playChoice2 == "paper") ||
          (playChoice1 == "paper" && playChoice2 == "rock")) {
        winner = "Player 1 wins!";
        player1++; // ADD counter for the score
      } else {
        winner = "Player 2 wins!";
        player2++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 238, 39, 65),
          title: const Center(
              child: Text('RPS Game',
                  style: TextStyle(
                    color: Colors.white,
                  ))),
        ),
        
        body: Column(children: [
          SizedBox(height: 50),
          // Display the win counters of the players
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Player 1 Score: $player1',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                'Player 2 Score: $player2',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),


          // Display the players' current choices
          SizedBox(height: 70),
          Container(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                //crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Image.asset(
                    'assets/img/$playChoice1.png', //diplay the img of the default variable but whan
                    //the user tap the Button the fuction play() will randomize the img
                    width: 120,
                    height: 120,
                  ),
                  Image.asset(
                    'assets/img/$playChoice2.png',
                    width: 120,
                    height: 120,
                  )
                ]),
          ),


          // Display the winner of the round
          const SizedBox(height: 50),
          Container(
            child: Text(
              winner,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),


          // Button to play the next round
          SizedBox(height: 80),
          Container(
            child: ElevatedButton(
              onPressed: play, //call the function
              style: ElevatedButton.styleFrom(
                minimumSize: Size(200, 60),
                backgroundColor: const Color.fromARGB(255, 0, 0, 0),
              ),
              child: const Text('GOO!',
                  style: TextStyle(
                      fontSize: 18, color: Color.fromARGB(199, 255, 255, 255))),
            ),
          ),
        ]),
      ),
    );
  }
}
