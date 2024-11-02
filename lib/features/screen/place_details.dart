import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../components/star_rating.dart';

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
                      borderRadius: BorderRadius.circular(15),
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
                    top: 20,
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
                              icon: Icon(Icons.share_outlined, color: Colors.white,),
                          ),
                          SizedBox(width: 20,),
                          IconButton(
                              onPressed: (){},
                              icon: Icon(Icons.favorite_border, color: Colors.white,)
                          )

                        ],
                      ),
                    )
                )
              ],
            ),

            Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25, vertical: 10),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.place['title'],
                    maxLines: 2,
                    style: const TextStyle(
                      fontSize: 25,
                      height: 1.0,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis
                    ),
                  ),

                  SizedBox(height: height*0.02,),
                  
                  Text(
                      "Room in: ${widget.place['address']}",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500
                    ),
                  ),

                  Text(
                      widget.place['bedAndBathroom'],
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w400
                    ),
                  ),

                  widget.place['isActive'] ==
                      true  ? Container(
                    margin: EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 8,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black26
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                             widget.place['rating'].toString(),
                             style: TextStyle(
                               fontSize: 17,
                               fontWeight: FontWeight.bold,
                               height: 1
                             ),
                            ),
                            StarRating(rating: widget.place['rating'])
                          ],
                        ),
                        Stack(
                          children: [
                            Image.network(
                             'https://wallpapers.com/images/hd/golden-laurel-wreathon-teal-background-k5791qxis5rtcx7w-k5791qxis5rtcx7w.png',
                             height: 50,
                              width: 130,
                              color: Colors.amber,
                            ),
                            const Positioned(
                              left: 35,
                                child: Text("Guest\nfavourite", style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  height: 1.2,
                                  color: Colors.black
                                ),
                                )
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Text(widget.place['review'].toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15
                            ),),
                            const Text(
                              "Reviews",
                              style: TextStyle(
                                height: 0.7,
                                color: Colors.black,
                                decoration: TextDecoration.underline
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ) : Container()

                ],
              ),

            ),



          ],
        ),
      ),
    );
  }


}
