import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mario_app/core/theme/colors.dart';
import 'package:mario_app/core/theme/text_styles.dart';
import 'package:mario_app/presentation/lesson_detailed_screen/view/widgets/lesson_details_clip_path.dart';
import 'package:mario_app/presentation/main_page/view_model/main_screen_states.dart';
import 'package:mario_app/presentation/main_page/view_model/main_screen_view_model.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class LessonDetailedScreen extends StatefulWidget {
  static const String routeName = 'LessonDetailedScreen';

  @override
  State<LessonDetailedScreen> createState() => _LessonDetailedScreenState();
}

class _LessonDetailedScreenState extends State<LessonDetailedScreen> {
  MainScreenViewModel? mainScreenCubit;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    mainScreenCubit = BlocProvider.of<MainScreenViewModel>(context);

    return BlocConsumer<MainScreenViewModel, MainScreenStates>(
      builder: (context, state) {
        if (state is GetSingleLessonLoadingState) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is GetSingleLessonFailureState) {
          return Scaffold(
            body: Center(
              child: Text(state.errMsg),
            ),
          );
        } else {
          return Scaffold(
            backgroundColor: MyColors.greyColor,
            appBar: AppBar(
              iconTheme: IconThemeData(color: MyColors.purpleColor),
              title: Text(
                mainScreenCubit?.lesson.name ?? '',
                style: Styles.textStyle20,
              ),
            ),
            body: SingleChildScrollView(
              child: Container(
                height: 812.h,
                child: Column(
                  children: [
                    Expanded(
                        child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.white,
                                MyColors.greyColor,
                              ],
                              begin: Alignment.topCenter)),
                      child: Column(
                        children: [
                          Container(
                            height: 300.h,
                            child: YoutubePlayer(
                              controller: mainScreenCubit!.youtubeController!,
                              showVideoProgressIndicator: true,
                              progressIndicatorColor: Colors.amber,
                              progressColors: const ProgressBarColors(
                                playedColor: Colors.amber,
                                handleColor: Colors.amberAccent,
                              ),
                              onReady: () {
                                // mainScreenCubit!.youtubeController!.addListener(listener);
                              },
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),

                          Container(
                            margin: EdgeInsetsDirectional.only(
                                start: 10.w, end: 10.w, top: 5.h),
                            padding: EdgeInsetsDirectional.only(
                                top: 10.h, start: 10.w, bottom: 10.h, end: 10.w),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                color: MyColors.whiteColor),
                            child: Container(
                              height: 450.h,
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    fieldsWidget(
                                        "HomeWork URL:",
                                        mainScreenCubit?.lesson.homeworkUrl ??
                                            ""),
                                    fieldsWidget("Lesson Name:",
                                        mainScreenCubit?.lesson.name ?? ""),
                                    fieldsWidget(
                                        "Lesson Description:",
                                        mainScreenCubit?.lesson.description ??
                                            ""),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          //  PodVideoPlayer(controller: mainScreenCubit!.controller!,),
                        ],
                      ),
                    )),
                    // ClipPath(
                    //     clipper: LessonDetailsScreenCustomClipPath(),
                    //     child: Container(
                    //       color: Colors.white,
                    //       height: 200.h,
                    //       width: double.infinity,
                    //     ))
                  ],
                ),
              ),
            ),
          );
        }
      },
      listener: (context, state) {},
    );
  }

  Widget fieldsWidget(String title, String details) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Styles.textStyle18.copyWith(color: Colors.black),
          ),
          Text(
            details,
            style: Styles.textStyle16
                .copyWith(color: MyColors.bottomNavigationBarIconColor),
          ),
        ],
      );

  void dispose() {
    // mainScreenCubit!.controller?.dispose();
    super.dispose();
  }
}
