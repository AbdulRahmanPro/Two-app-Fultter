import 'dart:math';
import 'package:flutter/material.dart';
int getRandomNumberInRange(int min, int max) {
  var random = Random();
  int randomNumber = min + random.nextInt(max - min + 1);
  return randomNumber;
}
void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.green[500],
      appBar: AppBar(
        title: const Text("لعبة الصور العجيبة"),
        backgroundColor: Colors.green[800],
      ),
      body:
       const SafeArea(
        child:
         BodyImage(),
      ),
    ),
  ));
}

class BodyImage extends StatefulWidget {
  const BodyImage({super.key});

  @override
  State<BodyImage> createState() => _BodyImageState();
}

class _BodyImageState extends State<BodyImage> {
  int numRight = getRandomNumberInRange(1 , 9);
  int numLeft = getRandomNumberInRange(1 , 9);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
         Text(
          numRight == numLeft ? "الصورة  صحيحة" :  "الصورة غير صحيحة" , 
          style: const TextStyle(fontSize: 35.0, color: Colors.white, fontWeight: FontWeight.w700),
        ),
        Row(
          children: [
           Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextButton(
                      onPressed: (){
                        setState(() {
                              numLeft = getRandomNumberInRange(1 , 9);
                        });
                      },
                      child: Image.asset(
                      "img/image-$numLeft.png",
                  ),
                 ),
                ) 
            ),
            Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextButton(
                      onPressed: (){
                        setState(() {
                           numRight = getRandomNumberInRange(1 , 9);
                        });
                      },
                      child: Image.asset(
                      "img/image-$numRight.png",
                    ),
                  ),
                ) 
            )
          ],
        )
      ],
    );
  }
}
