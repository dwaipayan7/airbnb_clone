import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DisplayPlace extends StatefulWidget {
  const DisplayPlace({super.key});

  @override
  State<DisplayPlace> createState() => _DisplayPlaceState();
}

class _DisplayPlaceState extends State<DisplayPlace> {

  final CollectionReference placeCollection =
  FirebaseFirestore.instance.collection("myAppCollection");


  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: placeCollection.snapshots(),
        builder: (context, streamSnapShots){
          if(streamSnapShots.hasData){
            return ListView.builder(
              padding: EdgeInsets.zero,
                physics: NeverScrollableScrollPhysics(),
                itemCount: streamSnapShots.data!.docs.length,
                shrinkWrap: true,
                itemBuilder: (context, index){
                final place = streamSnapShots.data!.docs[index];
                  return Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20
                      ),
                    child: GestureDetector(
                      onTap: (){},
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: SizedBox(
                                  height: 360,
                                  width: double.infinity,
                                  child: AnotherCarousel(
                                      images: place['imageUrls'].
                                      map((url)=> NetworkImage(url)).toList(),
                                    dotSize: 6, indicatorBgPadding: 5,
                                    dotColor: Colors.transparent,

                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  );

                });
          }
          return Center(child: CircularProgressIndicator.adaptive(),);
        }
    );
  }
}
