import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PlaceDetails extends StatefulWidget {
  final DocumentSnapshot<Object?> place;
  const PlaceDetails({super.key, required this.place});

  @override
  State<PlaceDetails> createState() => _PlaceDetailsState();
}

class _PlaceDetailsState extends State<PlaceDetails> {
  @override
  Widget build(BuildContext context) {
    int currentIndex = 0;

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                SizedBox(
                  height: height * 0.35,
                  child: AnotherCarousel(
                      images: widget.place['imageUrls']
                          .map((url) => NetworkImage(url))
                          .toList(),
                    showIndicator: false,
                    dotBgColor: Colors.transparent,
                      onImageChange: (p0, p1){
                        setState(() {
                          currentIndex = p1;
                        });
                      },
                    autoplay: true,
                    boxFit: BoxFit.contain,
                  ),
                ),
                Positioned(
                    child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 5
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black45
                    ),
                      child: Text("${currentIndex+1}"
                          "/${widget.place['imageUrls'].length}",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),
                      ),
                    )
                ),
                Positioned(
                  right: 0,
                    left: 0,
                    top: 25,
                    child: Padding(
                        padding: EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                              onPressed: (){
                                Navigator.pop(context);
                              },
                              icon: (Icon(Icons.arrow_back_ios)),color: Colors.white,),
                              
                          IconButton(
                              onPressed: (){},
                              icon: Icon(Icons.share_outlined),
                          ),
                          SizedBox(width: 20,),
                          IconButton(
                              onPressed: (){},
                              icon: Icon(Icons.favorite_border)
                          )

                        ],
                      ),
                    )
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
