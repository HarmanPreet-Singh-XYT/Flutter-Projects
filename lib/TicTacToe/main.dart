import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
class TicTacToe extends StatefulWidget {
  const TicTacToe({super.key});

  @override
  State<TicTacToe> createState() => _TicTacToeState();
}

class _TicTacToeState extends State<TicTacToe> {
  int turn = 1;
  Map<String,Map<String,int>> playerData = {'player1':{'sign':1},'player2':{'sign':2}};
  String? winMessage;
  List<List<int>> gameData = [
    [0,0,0],
    [0,0,0],
    [0,0,0]
  ];
  List<List<int>> blocks = [
    [0,0,0],
    [0,0,0],
    [0,0,0]
  ];
  Object checkWinner(List<List<int>> blocks) {
    // Check horizontal conditions
    for(int x = 0;x<3;x++){
      if(blocks[x][0]==blocks[x][1] && blocks[x][0]==blocks[x][2] && blocks[x][0]!=0)
        {return blocks[x][0];}
    }
    // Check vertical conditions
    for(int x = 0;x<3;x++){
      if(blocks[0][x]==blocks[1][x] && blocks[0][x]==blocks[2][x] && blocks[0][x]!=0)
        {return blocks[0][x];}
    }
    // Check diagonal conditions
    if (blocks[0][0] == blocks[1][1] && blocks[0][0] == blocks[2][2] && blocks[0][0]!=0) {
      return blocks[0][0];
    }
    if (blocks[2][0] == blocks[1][1] && blocks[2][0] == blocks[0][2] && blocks[0][0]!=0) {
      return blocks[2][0];
    }
    // No winner
    return false;
  }
  bool checkDraw(List<List<int>> blocks){
    //  Check
    int totalTrueValues = 0;
    for(int x = 0;x<3;x++){
      if(blocks[x][0]!=0 && blocks[x][1]!=0 && blocks[x][2]!=0)
        {totalTrueValues++;}
    };
    if(totalTrueValues==3){ return true;}
    else {return false;}
  }
  void updateData(int mainIndex,int subIndex,int preSelection){
    if(preSelection==0 && winMessage==null){
      gameData = blocks;
      if(turn==1){
        gameData[mainIndex][subIndex] = playerData['player1']!['sign']!;
      }else{
        gameData[mainIndex][subIndex] = playerData['player2']!['sign']!;
      }
      setState(() {
        turn = turn==1 ? 2 : 1;
      });
      blocks = gameData;
      Object winnerCheck = checkWinner(gameData);
      if(winnerCheck!=false){
        int? player = playerData['player1']!['sign']==winnerCheck ? playerData['player1']!['sign'] : playerData['player2']!['sign'];
        setState(() {
          winMessage = 'Player $player has Won the Game!';
        });
        return;
      }else{
        bool drawCheck = checkDraw(gameData);
        if(drawCheck) {
          setState(() {
            winMessage = 'Draw!';
          });
        }
      }
    }
  }
  void resetData(){
    setState(() {
      gameData = [
        [0,0,0],
        [0,0,0],
        [0,0,0]
      ];
      blocks = gameData;
      turn = 1;
      winMessage = null;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:const Text('TicTacToe',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
          backgroundColor: Color(0xFF6A5ACD),
          shape:const RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))),
          elevation: 20,
          iconTheme:const IconThemeData(
            color: Colors.white, //change your color here
          ),
        ),
        backgroundColor:const Color(0xff2C2B2B),
        body: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width*0.9,
            child: Column(
              children: [
                TitalMessage(winMessage: winMessage, turn: turn),
                Center(
                  child: Container(
                    padding:const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                    decoration: BoxDecoration(
                      color:const Color(0xffD9D9D9),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: blocks[0].mapIndexed((index,each){
                            return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20)
                              ),
                              width: MediaQuery.of(context).size.width*0.25,
                              height: MediaQuery.of(context).size.height*0.1,
                              child: ElevatedButton(onPressed:(){updateData(0, index,each);},  
                                style: ElevatedButton.styleFrom(backgroundColor:each==0 ? const Color(0xFF6A5ACD) : (each==1 ? const Color(0xFFCD5A5A) : const Color(0xffC9BE60)),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                                child: each==0 ? const Text('',style: TextStyle(color: Colors.white,fontSize: 64,fontWeight: FontWeight.bold)) : (each==1 ? const Text('X',style: TextStyle(color: Colors.white,fontSize: 64,fontWeight: FontWeight.bold,height:1)) : const Text('O',style: TextStyle(color: Colors.white,fontSize: 64,fontWeight: FontWeight.bold,height:1))),
                            ));
                          }).toList()
                        ),
                        const SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: blocks[1].mapIndexed((index,each){
                            return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20)
                              ),
                              width: MediaQuery.of(context).size.width*0.25,
                              height: MediaQuery.of(context).size.height*0.1,
                              child: ElevatedButton(onPressed: (){updateData(1, index,each);},  
                                style: ElevatedButton.styleFrom(backgroundColor:each==0 ? const Color(0xFF6A5ACD) : (each==1 ? const Color(0xFFCD5A5A) : const Color(0xffC9BE60)),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                                child: each==0 ? const Text('',style: TextStyle(color: Colors.white,fontSize: 64,fontWeight: FontWeight.bold)) : (each==1 ? const Text('X',style: TextStyle(color: Colors.white,fontSize: 64,fontWeight: FontWeight.bold,height:1)) : const Text('O',style: TextStyle(color: Colors.white,fontSize: 64,fontWeight: FontWeight.bold,height:1))),
                            ));
                          }).toList()
                        ),
                        const SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: blocks[2].mapIndexed((index,each){
                            return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20)
                              ),
                              width: MediaQuery.of(context).size.width*0.25,
                              height: MediaQuery.of(context).size.height*0.1,
                              child: ElevatedButton(onPressed: (){updateData(2, index,each);},  
                                style: ElevatedButton.styleFrom(backgroundColor:each==0 ? const Color(0xFF6A5ACD) : (each==1 ? const Color(0xFFCD5A5A) : const Color(0xffC9BE60)),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                                child: each==0 ? const Text('',style: TextStyle(color: Colors.white,fontSize: 64,fontWeight: FontWeight.bold)) : (each==1 ? const Text('X',style: TextStyle(color: Colors.white,fontSize: 64,fontWeight: FontWeight.bold,height:1)) : const Text('O',style: TextStyle(color: Colors.white,fontSize: 64,fontWeight: FontWeight.bold,height:1))),
                            ));
                          }).toList()
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Center(
                  child: ElevatedButton(onPressed: (){resetData();}, 
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue,padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 40)),
                  child: const Text('Reload Game',style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),)
                  ),
                )
              ],
            ),
          ),
        ),
      );
  }
}

class TitalMessage extends StatelessWidget {
  const TitalMessage({
    super.key,
    required this.winMessage,
    required this.turn,
  });

  final String? winMessage;
  final int turn;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin:const EdgeInsets.symmetric(vertical: 20),
        padding:const EdgeInsets.symmetric(vertical: 5),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color:const Color(0xff6A5ACD),
        ),
        child: Text(winMessage==null ? 'Player $turn Turn' : '$winMessage',style: const TextStyle(fontSize: 32,fontWeight: FontWeight.bold,color: Colors.white),textAlign: TextAlign.center,),
      ),
    );
  }
}