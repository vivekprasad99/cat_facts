import 'package:flutter/material.dart';

class CatFeedTile extends StatelessWidget {
  final String catFacts;
  final String timerText;

  const CatFeedTile({required this.catFacts,required this.timerText, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: const Color(0xFF43C6AC),
          border: Border.all(
            color: const Color(0xFFD9E9ED),
            width: 2,
          ),
        ),
        child:
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              catFacts,
              style: const TextStyle(color: Colors.black, fontSize: 16.0),
            ),
            const SizedBox(height: 8,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Appearnce Time :- 5 sec",style: TextStyle(color: Colors.white),),
                Text("Visible Duration :- $timerText",style: TextStyle(color: Colors.white),),
              ],
            ),

          ],
        ));
  }
}
