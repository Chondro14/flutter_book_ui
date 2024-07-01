import 'package:flutter/material.dart';

class RatingBar extends StatelessWidget {
  final double? score;
  const RatingBar({super.key, this.score});

  Widget ratingIndex(double score) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(score.floor(), (index) {
            return Icon(
              Icons.star,
              color: Colors.yellow,
            );
          }) +
          List.generate((score.floor() - 5).abs(), (index) {
            return Icon(
              Icons.star_border,
              color: Colors.grey,
            );
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ratingIndex(score ?? 0.0);
  }
}
