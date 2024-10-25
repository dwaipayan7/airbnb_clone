import 'package:flutter/material.dart';

Widget phoneNumberField(){
  return  Container(
    width:  double.infinity, height: 130,
    decoration: BoxDecoration(
        border: Border.all(
            color: Colors.black54
        ),
        borderRadius: BorderRadius.circular(10)
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
              right: 10,
              left: 10,
              top: 8
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Country/Regin",
                style: TextStyle(
                    color: Colors.black45,
                    fontWeight: FontWeight.bold
                ),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "India(+91)",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20
                    ),
                  ),
                  Icon(Icons.keyboard_arrow_down_sharp, size: 30,)
                ],
              )
            ],
          ),
        ),
        Divider(),
        Padding(padding: EdgeInsets.symmetric(horizontal: 10),
          child: TextField(
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Phone Number",
                hintStyle: TextStyle(
                    fontSize: 18,
                    color: Colors.black45
                )
            ),
          ),
        )
      ],
    ),
  );
}