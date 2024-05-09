import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mario_app/core/theme/colors.dart';
import 'package:mario_app/presentation/utils/skeleton.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoading extends StatelessWidget {
  ShimmerLoading({required this.height, required this.width});

  double width;
  double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Card(
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Container(
                  height: 232.h,
                  width: 360.w,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              // Shimmer.fromColors(
              //   baseColor: Colors.grey.shade300,
              //   highlightColor: Colors.grey.shade100,
              //   child: Skeleton(height: 15.h, width: 100.w),
              // ),
              Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Container(height: 15.h, width: 100.w, color: Colors.red),
              ),
              SizedBox(
                height: 5,
              ),
              Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Container(height: 15.h, width: 100.w,color: Colors.white,),
              )
            ],
          ),
        ),
      ),
    );
  }
}
