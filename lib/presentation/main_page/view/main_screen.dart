import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mario_app/core/theme/colors.dart';
import 'package:mario_app/presentation/authentication/register/view/widgets/customClipPath.dart';
import 'package:mario_app/presentation/main_page/view/widgets/main_screen_clip_path.dart';
import 'package:mario_app/presentation/main_page/view_model/main_screen_states.dart';
import 'package:mario_app/presentation/main_page/view_model/main_screen_view_model.dart';
import 'package:mario_app/presentation/utils/dialog_utils.dart';

class MainScreen extends StatelessWidget {
  static const String routeName = 'homeScreen';

  @override
  Widget build(BuildContext context) {
    MainScreenViewModel mainScreenViewModel =
        BlocProvider.of<MainScreenViewModel>(context);
    return BlocBuilder<MainScreenViewModel, MainScreenStates>(
      builder: (context, state) =>
          // Container(
          //   decoration: BoxDecoration(gradient: LinearGradient(end: Alignment.bottomCenter,colors: [Colors.white,MyColors.greyColor,],begin: Alignment.topCenter)),
          //   child: Column(
          //     children: [
          //  Spacer(),
          //
          //       ClipPath(
          //           clipper: MainScreenCustomClipPath(),
          //           child: Container(
          //
          //             color: Colors.white,
          //             height: 150.h,
          //             width: double.infinity,
          //           ))
          //     ],
          //   ),
          // ),
          Scaffold(
        backgroundColor: MyColors.greyColor.withOpacity(1),
        bottomNavigationBar: BottomAppBar(
          padding: EdgeInsets.zero,
          elevation: 0,
          color: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20.r),
                    topLeft: Radius.circular(20.r)),
                color: MyColors.whiteColor),
            child: BottomNavigationBar(
                selectedItemColor: MyColors.bottomNavigationBarIconColor,
                unselectedItemColor: MyColors.darkGreyColor,
                backgroundColor: Colors.transparent,
                elevation: 0,
                onTap: (value) {
                  mainScreenViewModel.changeIndex(value);
                },
                currentIndex: mainScreenViewModel.selectedIndex,
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.add_card,
                        size: 35,
                      ),
                      label: ''),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.favorite,
                        size: 35,
                      ),
                      label: ''),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.home,
                        size: 35,
                      ),
                      label: ''),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.shopping_cart_outlined,
                        size: 35,
                      ),
                      label: ''),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.person,
                        size: 35,
                      ),
                      label: ''),
                ]),
          ),
        ),
        body: mainScreenViewModel.tabs[mainScreenViewModel.selectedIndex],
      ),
    );
  }
}
