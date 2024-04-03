import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../themes/colors_theme.dart';

class ShimmerLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color(0xFFd1d1cf),
      highlightColor: const Color(0xFFe0e0e0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ShimmerCard(),
            const SizedBox(height: 10),
            ShimmerCard(),
            const SizedBox(height: 10),
            ShimmerCard(),
            const SizedBox(height: 10),
            ShimmerCard(),
            const SizedBox(height: 10),
            ShimmerCard(),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

class AppbarShimmerLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color(0xFFd1d1cf),
      highlightColor: const Color(0xFFe0e0e0),
      child: Container(
        width: Get.width,
        height: 100,
        decoration: BoxDecoration(
            color: ThemeColor.white,
            borderRadius: BorderRadius.circular(4)),
      ),
    );
  }
}


class MainShimmerLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color(0xFFd1d1cf),
      highlightColor: const Color(0xFFe0e0e0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            // const SizedBox(height: 30),
            // ShimmerHashtagCard(),
            const SizedBox(height: 20),
            ShimmerCard(),
            const SizedBox(height: 50),
            ShimmerCard(),
            const SizedBox(height: 50),
            ShimmerCard(),
            const SizedBox(height: 50),
            ShimmerCard(),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}

class ShimmerHashtagCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      width: Get.width - 20,
      height: 50,
      decoration: BoxDecoration(
          color: ThemeColor.primaryGrey,
          borderRadius: BorderRadius.circular(6)),
    );
  }
}

class ShimmerCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Container(
              width: 108,
              height: 105,
              decoration: BoxDecoration(
                  color: ThemeColor.white,
                  borderRadius: BorderRadius.circular(4)),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Container(
              width: 108,
              height: 105,
              decoration: BoxDecoration(
                  color: ThemeColor.white,
                  borderRadius: BorderRadius.circular(4)),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Container(
              width: 108,
              height: 105,
              decoration: BoxDecoration(
                  color: ThemeColor.white,
                  borderRadius: BorderRadius.circular(4)),
            ),
          ),
        )
      ],
    );
  }
}
