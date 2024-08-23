import 'package:flutter/material.dart';
import 'dart:async';
class Testimonial extends StatefulWidget {
  const Testimonial({super.key});

  @override
  State<Testimonial> createState() => _TestimonialState();
}

class _TestimonialState extends State<Testimonial> {
  int selectedIndex = 0; // Moved here to maintain its state
  late Timer mytimer; // Declare Timer

  // Sample data
  final List<Map<String, String>> data = [
    {
      'imgLink':
          'https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=880&q=80',
      'description':
          'I would also like to say thank you to all your staff. Wow what great service, I love it! Apple impressed me on multiple levels.',
      'author': 'Rosetta Q'
    },
    {
      'imgLink':
          'https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=880&q=80',
      'description':
          'This is simply unbelievable! I would be lost without Apple. The very best. Not able to tell you how happy I am with Apple.',
      'author': 'Cherise G'
    },
    {
      'imgLink':
          'https://images.unsplash.com/photo-1628157588553-5eeea00af15c?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=880&q=80',
      'description':
          'Thank you for making it painless, pleasant and most of all hassle-free! I wish I would have thought of it first. The very best.',
      'author': 'Constantine V'
    }
  ];

  @override
  void initState() {
    super.initState();
    // Initialize timer in initState
    mytimer = Timer.periodic(const Duration(seconds: 5), (timer) {
      setState(() {
        selectedIndex = (selectedIndex + 1) % data.length; // Cycle through indices
      });
    });
  }

  @override
  void dispose() {
    mytimer.cancel(); // Cancel timer on dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MainContent(data: data[selectedIndex]);
  }
}

class MainContent extends StatelessWidget {
  const MainContent({
    super.key,
    required this.data,
  });

  final Map<String, String> data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:const Text('Testimonial',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
          backgroundColor: Color(0xFF6A5ACD),
          shape:const RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))),
          elevation: 20,
          iconTheme:const IconThemeData(
            color: Colors.white, //change your color here
          ),
        ),
      body: SafeArea(child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:<Widget> [
            Container(
            width: MediaQuery.of(context).size.width*0.9,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.deepPurple,
            ),
            height: 200,
            child: BoxContent(data: data)
            )
          ],
        )
      ),
    )
        );
  }
}

class BoxContent extends StatelessWidget {
  const BoxContent({
    super.key,
    required this.data,
  });

  final Map<String, String> data;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width*0.85,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(data: data),
            Text('${data['description']}',style:const TextStyle(fontWeight: FontWeight.w500,color: Colors.white),),
            const SizedBox(height: 10,),
            Text('${data['author']}',style: const TextStyle(color: Colors.white,fontSize: 12),)
          ],
          ),
        ),
      );
  }
}

class Image extends StatelessWidget {
  const Image({
    super.key,
    required this.data,
  });

  final Map<String, String> data;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width*0.25,
        height: 20,
        child: Stack(
        clipBehavior: Clip.none,
        children: [
            Positioned(
              bottom: 15.0,
              child: CircleAvatar(
                backgroundImage: NetworkImage('${data['imgLink']}'),
                radius: 50,
              )
            )
          ],
        ),
      ),
    );
  }
}