import 'package:flutter/material.dart';
import './paragraph.dart';
import './buttons.dart';
class First extends StatelessWidget {
  const First({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    const IconData star = IconData(0xe5f9, fontFamily: 'MaterialIcons');
    const IconData phone = IconData(0xe4a2, fontFamily: 'MaterialIcons');
    const IconData navigation = IconData(0xe41e, fontFamily: 'MaterialIcons');
    const IconData share = IconData(0xe593, fontFamily: 'MaterialIcons');
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title:const Text('Showcase 2',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
          backgroundColor: Color(0xFF6A5ACD),
          shape:const RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))),
          elevation: 20,
          iconTheme:const IconThemeData(
            color: Colors.white, //change your color here
          ),
        ),
        body: Main(screenWidth: screenWidth, star: star, phone: phone, navigation: navigation, share: share)
      );
  }
}
class Main extends StatelessWidget {
  const Main({
    super.key,
    required this.screenWidth,
    required this.star,
    required this.phone,
    required this.navigation,
    required this.share,
  });

  final double screenWidth;
  final IconData star;
  final IconData phone;
  final IconData navigation;
  final IconData share;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 0),
              child: const Text('Flutter Layout Demo',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
            ),
          ],
        ),
        const SizedBox(height: 5),
        Image.network('https://t4.ftcdn.net/jpg/07/29/45/59/360_F_729455984_0BLpankzqOhGPVorxT5Tu7VuLNPvx2ur.jpg',width: screenWidth, height: 225,fit: BoxFit.fill,),
        const SizedBox(height: 20),
        SizedBox(
        width: MediaQuery.of(context).size.width * 0.85, // 50% of screen width
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                  Text('Oeschinen Lake Campground',style:TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),
                  Text('Kandersteg, Switzerland',style:TextStyle(fontSize: 14, color: Colors.black38))
              ],
            ),
            Row(
              children: [
                Icon(star,color: Colors.deepOrange),
                const SizedBox(width: 5),
                const Text('41',style: TextStyle(fontWeight: FontWeight.w500),)
              ],
            ),
          ],
        ),
      ),
        
        const SizedBox(height: 20),
        Buttons(phone: phone, navigation: navigation, share: share),
        const SizedBox(height: 20),
        const Paragraph()
        
      ],
    );
  }
}