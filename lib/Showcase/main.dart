import 'package:flutter/material.dart';
class Showcase extends StatelessWidget {
  const Showcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:const Text('Showcase',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
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
            child: ListView(
              padding:const EdgeInsets.symmetric(vertical: 20,horizontal: 0),
              scrollDirection:Axis.vertical,
              children:const [
                MainComponent()
                ],
              ),
          ),
        )
      );
  }
}

class MainComponent extends StatelessWidget {
  const MainComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('FLAT CARDS',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20)),
        SizedBox(height: 10,),
        FlatCards(),
        SizedBox(height: 20,),
        Text('ELEVATED CARDS',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20)),
        SizedBox(height: 10,),
        ElevatedCards(),
        SizedBox(height: 20,),
        Text('Trending Places',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20)),
        SizedBox(height: 10,),
        Trending(),
        SizedBox(height: 20,),
        Text('Blog Card',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20)),
        SizedBox(height: 10,),
        BlogCard(),
        SizedBox(height: 20,),
        Text('Contacts',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20)),
        SizedBox(height: 10,),
        Contacts()
      ],
    );
  }
}

class Contacts extends StatelessWidget {
  const Contacts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        IndividualContact(),
        SizedBox(height: 10,),
        IndividualContact(),
        SizedBox(height: 10,),
        IndividualContact(),
        SizedBox(height: 10,),
        IndividualContact(),
      ],
    );
  }
}

class IndividualContact extends StatelessWidget {
  const IndividualContact({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: NetworkImage('https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/35af6a41332353.57a1ce913e889.jpg'),
        ),
        SizedBox(width: 10,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('John Doe',style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.w500)),
            Text('Just a Manager in a Firm',style: TextStyle(color: Color(0xFF898888),fontSize: 16),)
          ],
        ),
      ],
    );
  }
}

class BlogCard extends StatelessWidget {
  const BlogCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color:Colors.white,
      ),
      child: const Column(
        children: [
          SizedBox(height: 5,),
          Text("What's new in Flutter 2024 - Mobile",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
          Spacer(),
          BlogImage(),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Read more",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Color(0xFF0066FF))),
              Text("Follow me",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Color(0xFF0066FF))),
            ],
          ),
          SizedBox(height: 10,),
        ],
      ),
    );
  }
}

class BlogImage extends StatelessWidget {
  const BlogImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.network('https://cdn.prod.website-files.com/5f841209f4e71b2d70034471/60bb4a2e143f632da3e56aea_Flutter%20app%20development%20(2).png',width: MediaQuery.of(context).size.width,height: 225,fit: BoxFit.cover);
  }
}

class Trending extends StatelessWidget {
  const Trending({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color:const Color(0xFFD9D9D9)
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius:const BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
            child: Image.network('https://i.ytimg.com/vi/cU6F3dffo2Y/maxresdefault.jpg',width: MediaQuery.of(context).size.width,height: 150,fit: BoxFit.cover),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 150,
            padding: const EdgeInsets.all(10),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Jaipur Place',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500)),
                Text('10 min away')
              ],
            ),
          )
        ],
      ),
    );
  }
}

class FlatCards extends StatelessWidget {
  const FlatCards({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding:const EdgeInsets.symmetric(vertical: 20,horizontal: 0),
          width: MediaQuery.of(context).size.width*0.25,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.red,
          ),
          alignment: Alignment.center,
          child:const Text('Red',style: TextStyle(color: Colors.white,fontSize: 18)),
        ),
        Container(
          padding:const EdgeInsets.symmetric(vertical: 20,horizontal: 0),
          width: MediaQuery.of(context).size.width*0.25,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.green,
          ),
          alignment: Alignment.center,
          child:const Text('Green',style: TextStyle(color: Colors.white,fontSize: 18)),
        ),
        Container(
          padding:const EdgeInsets.symmetric(vertical: 20,horizontal: 0),
          width: MediaQuery.of(context).size.width*0.25,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.blue,
          ),
          alignment: Alignment.center,
          child:const Text('Blue',style: TextStyle(color: Colors.white,fontSize: 18),),
        )
      ],
    );
  }
}

class ElevatedCards extends StatelessWidget {
  const ElevatedCards({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
            Card(
                elevation: 10,
                child: Container(
                padding:const EdgeInsets.symmetric(vertical: 20,horizontal: 0),
                width: MediaQuery.of(context).size.width*0.25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.red,
                ),
                alignment: Alignment.center,
                child:const Text('Red',style: TextStyle(color: Colors.white,fontSize: 18)),
              ),
            ),
            const SizedBox(width: 20),
            Card(
              elevation: 10,
              child: Container(
                padding:const EdgeInsets.symmetric(vertical: 20,horizontal: 0),
                width: MediaQuery.of(context).size.width*0.25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.green,
                ),
                alignment: Alignment.center,
                child:const Text('Green',style: TextStyle(color: Colors.white,fontSize: 18)),
              ),
            ),
            const SizedBox(width: 20),
            Card(
              elevation: 10,
              child: Container(
                padding:const EdgeInsets.symmetric(vertical: 20,horizontal: 0),
                width: MediaQuery.of(context).size.width*0.25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.blue,
                ),
                alignment: Alignment.center,
                child:const Text('Blue',style: TextStyle(color: Colors.white,fontSize: 18),),
              ),
            ),
            const SizedBox(width: 20),
            Card(
              elevation: 10,
              child: Container(
                padding:const EdgeInsets.symmetric(vertical: 20,horizontal: 0),
                width: MediaQuery.of(context).size.width*0.25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.blue,
                ),
                alignment: Alignment.center,
                child:const Text('Blue',style: TextStyle(color: Colors.white,fontSize: 18),),
              ),
            ),
            const SizedBox(width: 20),
            Card(
              elevation: 10,
              child: Container(
                padding:const EdgeInsets.symmetric(vertical: 20,horizontal: 0),
                width: MediaQuery.of(context).size.width*0.25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.blue,
                ),
                alignment: Alignment.center,
                child:const Text('Blue',style: TextStyle(color: Colors.white,fontSize: 18),),
              ),
            ),
            const SizedBox(width: 20),
            Card(
              elevation: 10,
              child: Container(
                padding:const EdgeInsets.symmetric(vertical: 20,horizontal: 0),
                width: MediaQuery.of(context).size.width*0.25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.blue,
                ),
                alignment: Alignment.center,
                child:const Text('Blue',style: TextStyle(color: Colors.white,fontSize: 18),),
              ),
            )
          ],
      ),
    );
  }
}