import 'package:flutter/material.dart';
class Buttons extends StatelessWidget {
  const Buttons({
    super.key,
    required this.phone,
    required this.navigation,
    required this.share,
  });

  final IconData phone;
  final IconData navigation;
  final IconData share;

  @override
  Widget build(BuildContext context) {
    return Center(
      child:
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                IconButton(onPressed:() {print('press');}, icon:Icon(phone,color: Colors.deepPurpleAccent,),),
                const SizedBox(height: 5),
                const Text('CALL',style: TextStyle(color: Colors.deepPurpleAccent),)
              ],
            ),
            Column(
              children: [
                  Transform.rotate(
                  angle: 45,
                  child: IconButton(onPressed:() {print('press');}, icon:Icon(navigation,color: Colors.deepPurpleAccent,),),
                  
                ),
                const SizedBox(height: 5),
                const Text('ROUTE',style: TextStyle(color: Colors.deepPurpleAccent),)
              ],
            ),
        
            Column(
              children: [
                IconButton(onPressed:() {print('press');}, icon:Icon(share,color: Colors.deepPurpleAccent,)),
                const SizedBox(height: 5),
                const Text('SHARE',style: TextStyle(color: Colors.deepPurpleAccent),)
              ],
            ),
          ],
        )
    );
  }
}