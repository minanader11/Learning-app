import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mario_app/core/theme/colors.dart';
import 'package:mario_app/core/theme/text_styles.dart';
import 'package:mario_app/presentation/lesson_detailed_screen/view/widgets/lesson_details_clip_path.dart';
import 'package:mario_app/presentation/main_page/view_model/main_screen_states.dart';
import 'package:mario_app/presentation/main_page/view_model/main_screen_view_model.dart';
import 'package:pod_player/pod_player.dart';

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
          return Scaffold(backgroundColor:MyColors.greyColor ,
            appBar: AppBar(
              iconTheme: IconThemeData(color: MyColors.purpleColor),
              title: Text(
                mainScreenCubit?.lesson.name ?? '',
                style: Styles.textStyle20,
              ),
            ),
            body: Column(
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
                   
                      PodVideoPlayer(controller: mainScreenCubit!.controller!),
                    ],
                  ),
                )),
                ClipPath(
                    clipper: LessonDetailsScreenCustomClipPath(),
                    child: Container(
                      color: Colors.white,
                      height: 200.h,
                      width: double.infinity,
                    ))
              ],
            ),
          );
        }
      },
      listener: (context, state) {},
    );
  }

  void dispose() {
    mainScreenCubit!.controller?.dispose();
    super.dispose();
  }
}
