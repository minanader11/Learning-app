import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mario_app/Domain/entities/LessonResponseEntity.dart';
import 'package:mario_app/core/texts.dart';
import 'package:mario_app/core/theme/colors.dart';
import 'package:mario_app/presentation/main_page/view_model/main_screen_view_model.dart';

class LessonItem extends StatelessWidget {
  LessonItem({required this.lesson});

  LessonEntity lesson;

  @override
  Widget build(BuildContext context) {
    MainScreenViewModel mainScreenViewModel =
    BlocProvider.of<MainScreenViewModel>(context);

    return InkWell(
      onTap: () {
        // Navigator.of(context).push(MaterialPageRoute(
        //   builder: (context) => NewsDetails(news: news),
        // ));
        if(lesson.hasLesson == false){
        mainScreenViewModel.requestBuyLesson();
        mainScreenViewModel.changeLessonID(lesson.id!);}
      },
      child: Card(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                children: [
                  Container(
                    height: 232.h,
                    width: 360.w,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: //Image.network(
                            // news.urlToImage ?? '',
                            //),
                            CachedNetworkImage(
                          imageUrl: lesson.image ?? '',
                          placeholder: (context, url) =>
                              Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) => Container(
                              height: 232.h,
                              child: Icon(
                                Icons.error,
                                size: 40,
                              )),
                        )
                        // child:Image.asset(MyTexts.productImage,fit:BoxFit.fill) ,
                        ),
                  ),
                  Positioned(
                    left: 280.w,
                    child: ElevatedButton(
                        onPressed: () {},
                        child: lesson.hasLesson == true || lesson.price==0
                            ? Text(
                                'view',
                              )
                            : Icon(Icons.lock),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: MyColors.primaryColor,
                            foregroundColor: MyColors.whiteColor)),
                  )
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                lesson.name ?? '',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: MyColors.blackColor),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                lesson.grade?.name ?? '',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Price : ${lesson.price} EGP',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: MyColors.blackColor),
                textAlign: TextAlign.right,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
