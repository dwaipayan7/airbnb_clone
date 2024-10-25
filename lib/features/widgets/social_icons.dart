import 'package:flutter/material.dart';

Widget socialIcons(BuildContext context, icon, name, color, double iconSize){
  final height = MediaQuery.of(context).size.height;
  final width = MediaQuery.of(context).size.width;
  return Padding(padding: EdgeInsets.only(
      bottom: 15
  ),
    child: Container(
        width: width,
        padding: EdgeInsets.symmetric(vertical: 11),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all()
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.005,),
              Icon(icon, color: color, size: iconSize,),
              SizedBox(height: height * 0.018,),
              Expanded(
                child: Center(
                  child: Text(name,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500
                  ),),
                ),
              ),
              SizedBox(width: 10,),
            ],
          ),
        )
    ),
  );
}