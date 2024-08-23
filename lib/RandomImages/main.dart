import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

Future<List<ImageData>> fetchImageData(int page) async {
  final response = await http.get(Uri.parse('https://picsum.photos/v2/list?page=$page&limit=6'));

  if (response.statusCode == 200) {
    List<dynamic> jsonData = json.decode(response.body);
    return jsonData.map((json) => ImageData.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load images');
  }
}
class ImageData {
  final String id;
  final String author;
  final int width;
  final int height;
  final String url;
  final String downloadUrl;

  ImageData({
    required this.id,
    required this.author,
    required this.width,
    required this.height,
    required this.url,
    required this.downloadUrl,
  });

  factory ImageData.fromJson(Map<String, dynamic> json) {
    return ImageData(
      id: json['id'],
      author: json['author'],
      width: json['width'],
      height: json['height'],
      url: json['url'],
      downloadUrl: json['download_url'],
    );
  }
}
class RandomImages extends StatefulWidget {
  const RandomImages({super.key});

  @override
  State<RandomImages> createState() => _RandomImagesState();
}

class _RandomImagesState extends State<RandomImages> {
  List images = [];
  bool loading = false;
  int page = 1;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    loadMoreImages(); // Load initial images
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      if (!loading) {
        loadMoreImages();
      }
    }
  }
  void loadMoreImages() async {
    setState(() {
      loading = true;
    });

    try {
      List<ImageData> fetchedImages = await fetchImageData(page);
      setState(() {
        images.addAll(fetchedImages.map((image) => image.downloadUrl).toList());
        page++;
      });
    } catch (e) {
      print("Error fetching images: $e");
    } finally {
      setState(() {
        loading = false;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:const Text('Random Images',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
          backgroundColor: Color(0xFF6A5ACD),
          shape:const RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))),
          elevation: 20,
          iconTheme:const IconThemeData(
            color: Colors.white, //change your color here
          ),
        ),
        body: Stack(
          children: [
            Images(images: images, scrollController: _scrollController),
            if (loading)
              const Positioned(
                bottom: 10,
                left: 0,
                right: 0,
                child: Center(child: CircularProgressIndicator()),
              ),
          ],
        ),
      );
  }
}
class Images extends StatelessWidget {
  const Images({
    super.key,
    required this.images,
    required this.scrollController,
  });

  final List images;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          controller: scrollController,
          itemCount: images.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                const SizedBox(height: 20),
                Container(
                  padding:const EdgeInsets.symmetric(horizontal: 20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(images[index],
                        fit: BoxFit.cover, height: 350),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}