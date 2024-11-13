import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';

class CustomRatingBarIndicator extends StatefulWidget {
  double? rating;
  double? width;

  CustomRatingBarIndicator({
    super.key,
    this.rating,
    this.width,
  });

  @override
  State<CustomRatingBarIndicator> createState() =>
      _CustomRatingBarIndicatorState();
}

class _CustomRatingBarIndicatorState extends State<CustomRatingBarIndicator> {
  @override
  void initState() {
    super.initState();
    widget.rating ??= 0;
    widget.width ??= 100;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0, top: 8.0, bottom: 8.0),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              children: [
                Container(
                  width: widget.width,
                  height: 10,
                  decoration: BoxDecoration(
                    color: AppColors.lightGrey,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Stack(
                    children: [
                      Container(
                        width:
                            ((widget.rating! * widget.width!) / 5).toDouble(),
                        height: 10,
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Rating",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(fontWeight: FontWeight.bold, fontSize: 10),
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                    Text(
                      "${widget.rating}/5",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(fontWeight: FontWeight.bold, fontSize: 10),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              width: 10,
            ),
            const Icon(
              Icons.star_rounded,
              color: Colors.amber,
              size: 30,
            ),
          ]),
    );
  }
}
