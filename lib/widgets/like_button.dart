import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

const double buttonSize = 30.0;

class LikeButtonWidget extends StatefulWidget {
  const LikeButtonWidget({Key? key}) : super(key: key);

  @override
  _LikeButtonWidgetState createState() => _LikeButtonWidgetState();
}

class _LikeButtonWidgetState extends State<LikeButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return LikeButton(
      size: buttonSize,
      circleColor: CircleColor(
          start: Colors.red.shade200, end: Colors.pinkAccent.shade400),
      bubblesColor: BubblesColor(
        dotPrimaryColor: Colors.red.shade300,
        dotSecondaryColor: Colors.red.shade200,
      ),
      likeBuilder: (bool isLiked) {
        return Icon(
          Icons.favorite,
          color: isLiked ? Colors.red : Colors.grey,
          size: buttonSize,
        );
      },
    );
  }
}
