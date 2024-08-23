import 'dart:math';
import 'package:flutter/material.dart';
class RockPaperScissors extends StatefulWidget {
  const RockPaperScissors({super.key});

  @override
  State<RockPaperScissors> createState() => _RockPaperScissorsState();
}

class _RockPaperScissorsState extends State<RockPaperScissors> {
  Map<String,int> scores = {'user':0,'computer':0};
  String? message;
  final indexes = ['Rock','Scissors','Paper'];
  void setupScores(String outcome,int userInput,int computerInput){
      if(outcome=='win'){
        setState(() {
          scores['user']=scores['user']!+1;
          if (scores['computer']! > 0) {
            scores['computer'] = scores['computer']! - 1;
          }
          message='You Win! ${indexes[userInput]} beats ${indexes[computerInput]}';
        });
      }else{
        setState(() {
          if (scores['user']! > 0) {
            scores['user'] = scores['user']! - 1;
          }
          scores['computer']=scores['computer']!+1;
          message='You Lost! ${indexes[computerInput]} beats ${indexes[userInput]}';
        });
      }
  }
  int computerOutput(){
    return Random().nextInt(2);
  }
  void calculateResult(int userInput){
    int computerInput = computerOutput();
    if(userInput==computerInput)
      {message="It's a Tie!";}
    else if(userInput==2 && computerInput==0)
        {setupScores('win',userInput,computerInput);}
    else if(userInput==0 && computerInput==1)
        {setupScores('win',userInput,computerInput);}
    else if(userInput==1 && computerInput==2)
        {setupScores('win',userInput,computerInput);}
    else
        {setupScores('lost',userInput,computerInput);}
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:const Text('Rock Paper Scissors',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
          backgroundColor: Color(0xFF6A5ACD),
          shape:const RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))),
          elevation: 20,
          iconTheme:const IconThemeData(
            color: Colors.white, //change your color here
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Rock Paper Scissors Game',style: TextStyle(fontSize: 38,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
              const SizedBox(height: 10,),
              const Text('Choose your move',style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),),
              const SizedBox(height: 25,),
              Buttons(onPress: calculateResult),
              const SizedBox(height: 50,),
              if(message!=null) Text('$message',style:const TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.black),),
              Text.rich(
                TextSpan(
                  text: 'Your score: ',
                  style:const TextStyle(fontSize: 24,color: Colors.black,fontWeight: FontWeight.bold),
                  children: <TextSpan>[
                    TextSpan(
                      text: '${scores['user']} ',
                      style:const TextStyle(fontSize: 24,color: Colors.blue,fontWeight: FontWeight.bold),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Computer score: ',
                          style:const TextStyle(fontSize: 24,color: Colors.black,fontWeight: FontWeight.bold),
                          children: <TextSpan>[
                            TextSpan(
                              text: '${scores['computer']} ',
                              style:const TextStyle(fontSize: 24,color: Colors.red,fontWeight: FontWeight.bold),
                            )
                          ]
                        )
                      ]
                    )
                  ]
                )
              )
            ],
          ),
        ),
      );
  }
}

class Buttons extends StatelessWidget {
  const Buttons({
    super.key,
    required this.onPress,
  });
  final void Function(int) onPress;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
          ElevatedButton(onPressed: () {onPress(0);},
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),elevation: 10),
            child:  const Text('👊',style: TextStyle(fontSize: 60),textAlign: TextAlign.center,)
          ),
          ElevatedButton(onPressed: () {onPress(1);},
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),elevation: 10),
            child:  const Text('🖐️',style: TextStyle(fontSize: 60),textAlign: TextAlign.center,)
          ),
          ElevatedButton(onPressed: () {onPress(2);},
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),elevation: 10),
            child:  const Text('✌️',style: TextStyle(fontSize: 60),textAlign: TextAlign.center,)
          ),
      ],
    );
  }
}