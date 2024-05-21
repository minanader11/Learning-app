import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;
    final path = Path();
   path.moveTo(0, size.height);
   path.lineTo(0, size.height*0.1);
   path.quadraticBezierTo(size.width/2,0,size.width, size.height*0.1);
   path.lineTo(size.width, size.height);
    // path.lineTo(0, size.height-100);
    // path.quadraticBezierTo(
    //     size.width / 2, size.height , size.width, 0);
    // path.lineTo(size.width, 0);
    path.close();
    return path;

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
