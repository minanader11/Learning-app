
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mario_app/core/theme/colors.dart';
import 'package:mario_app/presentation/main_page/view/widgets/redeem_code_modal_sheet.dart';
import 'package:mario_app/presentation/main_page/view_model/main_screen_states.dart';
import 'package:mario_app/presentation/main_page/view_model/main_screen_view_model.dart';
import 'package:mario_app/presentation/utils/dialog_utils.dart';

class MainScreen extends StatelessWidget{
  static const String routeName='homeScreen';


  @override
  Widget build(BuildContext context) {
    MainScreenViewModel mainScreenViewModel=BlocProvider.of<MainScreenViewModel>(context);
    return BlocConsumer<MainScreenViewModel,MainScreenStates>(listener: (context, state) {
      if (state is RedeemCodeLoadingState) {
        DialogUtils.showLoading(context: context);
      } else if (state is RedeemCodeErrorState) {
        DialogUtils.hideLoading(context);
        DialogUtils.showMessage(
            context: context,
            message: state.errMsg,
            actionName: 'ok',
            posActionFun: () {
              Navigator.of(context).pop();
            });
      } else if (state is RedeemCodeSuccessState) {
        DialogUtils.hideLoading(context);
        DialogUtils.showMessage(
            context: context,
            message: 'Code Redeeming Successfully',
            actionName: 'ok',
            posActionFun: () {
              Navigator.of(context).pop();
            });
      }
    },
      builder:(context, state) => Scaffold(backgroundColor:MyColors.whiteColor,
          floatingActionButton: FloatingActionButton( backgroundColor: MyColors.primaryColor,
              shape: StadiumBorder(
                side: BorderSide(
                  color: MyColors.whiteColor,
                  width: 4,
                ),
              ),
              onPressed: () async {
                showModalBottomSheet(

                  context: context,
                  builder: (context) {
                    return RedeemCodeModalSheet();
                  },
                );
              },
              child: const Icon(
                Icons.add_card,
                color: MyColors.whiteColor,
              )),
          bottomNavigationBar: BottomAppBar(
            padding: EdgeInsets.zero,
            elevation: 0,
            color: MyColors.lightGreen,
            shape: const CircularNotchedRectangle(),
            notchMargin: 8,
            child: BottomNavigationBar(selectedItemColor: MyColors.primaryColor,
                backgroundColor: Colors.transparent,
                elevation: 0,
                onTap: (value) {
                 mainScreenViewModel.changeIndex(value);
                },
                currentIndex: mainScreenViewModel.selectedIndex,
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.home,
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
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          body: mainScreenViewModel.tabs[mainScreenViewModel.selectedIndex]),
    );
  }

}