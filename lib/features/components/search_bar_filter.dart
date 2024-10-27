import 'package:flutter/material.dart';

class SearchBarFilter extends StatelessWidget {
  const SearchBarFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              children: [
                Expanded(
                    child:Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: const [
                          BoxShadow(
                              blurRadius: 7,
                            color: Colors.black38
                          )
                        ]
                      ),
                      child: const Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 5,
                            vertical: 8,
                          ),
                        child: SingleChildScrollView(
                          child: Row(
                            children: [
                              Icon(
                                Icons.search,
                                size: 32,
                              ),
                              // SizedBox(width: 8,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("   Where to?",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500
                                  ),),
                                  SizedBox(
                                    height: 20,
                                    width: 240,
                                    child: TextField(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                        ),
                                        hintText: "Anywhere, Any week . Add guests",
                                        hintStyle: TextStyle(
                                          color: Colors.black38,
                                          fontSize: 13
                                        ),
                                        filled: true,
                                        fillColor: Colors.white
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                ),
                SizedBox(width: 8,),

                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black54,

                    ),
                    shape: BoxShape.circle,

                  ),
                  child: Icon(
                    Icons.tune,
                    size: 30,
                  ),
                )

              ],
            ),
    );
  }
}
