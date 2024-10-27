import 'package:flutter/material.dart';

class DisplayTotalPrice extends StatefulWidget {
  const DisplayTotalPrice({super.key});

  @override
  State<DisplayTotalPrice> createState() => _DisplayTotalPriceState();
}

class _DisplayTotalPriceState extends State<DisplayTotalPrice> {
  @override
  Widget build(BuildContext context) {
    bool isSwitch = false;
    return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal:20
        ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.black26
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
              const Column(
                children: [
                  Text("Display Total Price",style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 17
                  ),
                  ),
                  Text("Display Total Price",style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                    color: Colors.black54
                  ),
                  ),
                ],
              ),
            Switch(
              inactiveThumbColor: Colors.white,
                inactiveTrackColor: Colors.grey,
                value: isSwitch,
                onChanged: (value){
                setState(() {
                  isSwitch = value;
                });
                }
            )
          ],
        ),
      ),
    );
  }
}
